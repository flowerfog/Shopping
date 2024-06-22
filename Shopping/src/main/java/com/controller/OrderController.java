package com.controller;

import com.mapper.UserMapper;
import com.pojo.*;
import com.service.CommodityService;
import com.service.DealingService;
import com.service.OrderService;
import com.service.UserService;
import com.utils.StringUtil;
import com.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import java.math.BigDecimal;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private UserService userService;
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private DealingService dealingService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/confirmOrder")
    public String confirmOrder(HttpServletRequest request, HttpSession session, Integer aid, String payment, String counts, String cids, HttpServletResponse response, Model model){
        //解决中文乱码
        response.setContentType("text/html;charset=UTF-8");

        User user = (User) session.getAttribute("user");

        //先查询库存 查询乐观锁  避免下单出现并发问题
        Integer[] cidArray = StringUtil.delimitedIntegerArray(cids);
        Integer[] countArray = StringUtil.delimitedIntegerArray(counts);
        List<Commodity> successCommodityList = new LinkedList<>();//库存充足的商品
        List<Integer> successCountList = new LinkedList<>();//对应商品的数量

        List<Commodity> failCommodityList = new LinkedList<>();//库存不足的商品
        List<Integer> oldVersionList = new LinkedList<>();//存入老版本号
        for (int i = 0; i < cidArray.length; i++) {
            Commodity commodity = commodityService.viewCommodityByCid(cidArray[i]);
            if (commodity.getInventory()-countArray[i]<0){
                failCommodityList.add(commodity);
                continue;
            }
            // 将效验过关的cid 和 对应的数量 进行保存
            oldVersionList.add(commodity.getVersion());
            successCountList.add(countArray[i]);
            successCommodityList.add(commodity);
        }

        //将库存足够的商品进入下单流程
        try{
            //判断用户金额是否充足 先计算总价
            double orderPrice = 0.0;
            int index=0;
            for (Commodity commodity : successCommodityList) {
                orderPrice+=(commodity.getPrice()*successCountList.get(index));
                index++;
            }
            if (orderPrice>user.getMoney()) {
                session.setAttribute("addRes","账户余额不足,请充值后再试");
                String parameterAddress="cidList=";
                for (int i = 0; i < cidArray.length; i++) {
                    for (int j = 0; j < countArray[i]; j++) {
                        parameterAddress+=(""+cidArray[i]+"&cidList=");
                    }
                }
                String rightAddress=parameterAddress.substring(0,parameterAddress.length()-9);
                return "redirect:"+request.getContextPath()+"/commodity/toBuyCommodity?"+rightAddress;
            }
            //余额充足
            //成功之后需要将订单信息存入订单表 更新用户钱
            userService.updateUserMoneyByUid(user.getId(),orderPrice);
            //将信息添加到订单中
            OrderGoods orderGoods = new OrderGoods(null,
                    UuidUtil.getUuid(),
                    user.getId(),
                    aid
            );
            Integer integer = orderService.insertOrder(orderGoods);
            if (integer !=0){
                System.out.println("添加订单成功");
            }
            //存入订单详情
            //将信息添加到订单详细表中
            index=0;
            for (Commodity commodity : successCommodityList) {
                for (int i = 0; i < successCountList.get(index); i++) {
                    dealingService.insertDealing(
                            orderGoods.getId(),
                            commodity.getId(),
                            commodity.getName(),
                            commodity.getPrice()
                    );
                }
                index++;
            }
            //更新库存
            index=0;
            for (Commodity commodity : successCommodityList) {
                Integer cid = commodity.getId();
                Integer count = successCountList.get(index);
                //更新库存 根据cid修改库存
                Integer res = commodityService.updateInventory(cid,count);
                if (res!=0) System.out.println("库存减少了");
            }
            //遍历更新效验version 更新库存 如果不同 则进行事务回滚
            for (int i = 0; i < successCommodityList.size(); i++) {
                int res = commodityService.updateVersion(successCommodityList.get(i).getId(),oldVersionList.get(i),successCountList.get(i));
                if (res==0){
                    user.setMoney(userMapper.findUserByUid(user.getId()).getMoney());
                    throw new RuntimeException("乐观锁异常,进行事务回滚,携带错误信息回去");
                }
            }
            //将订单总价返回
            model.addAttribute("orderPrice",orderPrice);
            //更新session里面的user
            //1.更新钱
            user.setMoney(userMapper.findUserByUid(user.getId()).getMoney());

            //清空购物车

            session.setAttribute("addRes","购买成功,详细进程请前往我的订单查看详情");
            return "success";
        }catch (Exception e){
            session.setAttribute("addRes","购买时存在异常,请稍后重试或联系客服处理");
            return "fail";
        }
    }

    @RequestMapping("/toUserOrderListByUid")
    public String toUserOrderList(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        List<Dealing> dealingList = orderService.viewUserOrderListByUid(user.getId(),session);
        for (Dealing dealing : dealingList) {
            Integer id = dealing.getOid();
            System.out.println("oid = " + id);
        }
        model.addAttribute("dealingList",dealingList);
        return "orderList";
    }



}
