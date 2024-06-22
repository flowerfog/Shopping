package com.service.Impl;

import com.mapper.CommodityMapper;
import com.mapper.OrderMapper;
import com.mapper.UserMapper;
import com.pojo.*;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

@Service
public class  OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CommodityMapper commodityMapper;
    @Override
    public Integer insertOrder(OrderGoods orderGoods) {
        return orderMapper.insertOrder(orderGoods);
    }

    @Override
    public List<Dealing> viewUserOrderListByUid(Integer uid,HttpSession session) {
        List<Dealing> orderList = orderMapper.viewUserOrderListByUid(uid);

        Double total;
        Double resTotal=0.0;
        //给orderList的HistoricalDealing赋值
        //处理orderList的日期格式
        for (Dealing dealing : orderList) {
            System.out.println("dealing = " + dealing);
            total=0.0;
            List <HistoricalDealing> historicalDealingList = orderMapper.selectDealingByOid(dealing.getOid());
            //设置单个商品的数量
            //将 historicalDealingList 去重
            System.out.println("historicalDealingList = " + historicalDealingList);
            for (HistoricalDealing historicalDealing : historicalDealingList) {
                System.out.println("historicalDealing = " + historicalDealing);
                Integer count = orderMapper.findCountByCidAndOid(historicalDealing.getCid(), dealing.getOid());
                System.out.println("count = " + count);
                historicalDealing.setCount(count);
                total+=historicalDealing.getCount()*historicalDealing.getPrice();
                resTotal+=historicalDealing.getCount()*historicalDealing.getPrice();
            }
            User user = (User) session.getAttribute("user");
            user.setResTotal(resTotal);
            dealing.setTotal(total);
            dealing.setHistoricalDealingList(historicalDealingList);
            LocalDateTime createTime = dealing.getCreateTime();
            dealing.setRightTime(""+createTime.getYear()+"."+createTime.getMonth()+"."+createTime.getDayOfMonth());
            dealing.setDayTime(""+createTime.getHour()+":"+createTime.getMinute());
        }
        return orderList;
    }

    @Override
    public List<OrderGoods> viewOrderByState(Integer state) {
        return orderMapper.viewOrderByState(state);
    }

    @Override
    public List<OrderDealing> findOrderByOid(Integer oid) {
        List<OrderDealing> order = orderMapper.findOrderByOid(oid);
        for (OrderDealing orderDealing : order) {
            orderDealing.setUser(userMapper.findUserByUid(orderDealing.getUid()));
            orderDealing.setAddress(userMapper.selectAddressByAid(orderDealing.getAid()));
            orderDealing.setCount(orderMapper.selectCidCountByOid(orderDealing.getCid(),orderDealing.getOid()));
        }
        return order;
    }

    @Override
    public Integer updateOrderStatus(HashMap<Integer,String> map,Integer oid) {
        //为详情订单发货 并将状态为0的详情单 修改为状态5 寓意已发货
        Integer status=5;
        Integer flag=0;
        try {
            for (Integer cid : map.keySet()) {
                String tracking = map.get(cid);
                System.out.println("tracking = " + tracking);
                if (tracking!=null){
                    if (!tracking.isEmpty()) {
                        System.out.println("修改发货状态执行了");
                        orderMapper.updateOrderStatusByOid(status,tracking,cid,oid);
                        flag=1;
                    }
                }
            }
        }catch (Exception e){
            System.out.println("e = " + e);
            flag=0;
        }

        return flag;
    }
}
