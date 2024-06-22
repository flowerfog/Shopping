package com.controller;

import com.mapper.CommodityMapper;
import com.mapper.UserMapper;
import com.pojo.*;
import com.service.CommodityService;
import com.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("commodity")
public class CommodityController {

    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private CommodityService commodityService;

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/viewCommodityByCid")
    public String viewCommodityByCid(Integer cid, Model model, HttpSession session){
        //4.需要,判断session中有无用户数据
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请先登陆,再查看商品的各项细节");
            return"redirect:/login.jsp";
        }

        //需向前端返回一个商品的信息及其细节图
        Commodity commodity = commodityService.viewCommodityByCid(cid);

        //根据cid返回该商品评论集
        List<Comment> commentList = commodityService.viewCommentsByCid(cid);

        //根据cid查询该商品相关产品
        List<Commodity> relatedCommodityList =commodityService.viewRelatedCommoditiesByCid(cid);

        System.out.println("relatedCommodityList相关产品 = " + relatedCommodityList);
        model.addAttribute("commodity",commodity); //商品信息

        model.addAttribute("commentList",commentList); //商品相关的评论信息

        model.addAttribute("relatedCommodityList",relatedCommodityList); //商品相关产品信息

        return "product";
    }

    /**
     * 确认订单界面
     * @param cidList 从前端页面传过来的商品id数组
     * @return 返回
     * 选中的订单商品 && 用户的收货地址信息
     * 订单页面
     */
    @RequestMapping("toBuyCommodity")
    public String toBuyCommodity(@RequestParam("cidList") List<Integer> cidList,Model model,HttpSession session){
        //效验权限
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请登陆后浏览,获得更多权限");
            return"redirect:/login.jsp";
        }
        //判断list是否为有效list
        Boolean flag=true;
        for (Integer integer : cidList) {
            if (integer!=0) {
                flag=false;
                break;
            }
        }
        if (flag){
            session.setAttribute("addRes","目前没有商品被选中");
            return"redirect:/initShopping";
        }
        //订单所需商品
        List<ShoppingCart> commodityOfOrder = commodityService.findCommodityOfOrder(cidList);//查询需要在订单上的商品
        //订单总价
        String counts="";
        String cids="";
        double orderPrice=0;
        for (ShoppingCart shoppingCart : commodityOfOrder) {
            orderPrice+=(shoppingCart.getCommodityCount()*(shoppingCart.getCommodity().getPrice()*shoppingCart.getCommodity().getDiscount()));
            counts+=(""+shoppingCart.getCommodityCount()+" ");
            cids+=(""+shoppingCart.getCommodity().getId()+" ");
        }

        //查询用户的地址信息
        List<Address> addressList = userService.findAddressByUid(user.getId());

        model.addAttribute("counts",counts);
        model.addAttribute("cids",cids);
        model.addAttribute("addressList",addressList);
        model.addAttribute("commodityOfOrder",commodityOfOrder);
        model.addAttribute("orderPrice",orderPrice);
        return "checkout";
    }



}