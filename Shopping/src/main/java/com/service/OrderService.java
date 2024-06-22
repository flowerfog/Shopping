package com.service;

import com.pojo.Dealing;
import com.pojo.OrderDealing;
import com.pojo.OrderGoods;

import javax.servlet.http.HttpSession;
import java.util.*;

public interface OrderService {
    Integer insertOrder(OrderGoods orderGoods);

    //根据uid查询对应信息
    List<Dealing> viewUserOrderListByUid(Integer uid,HttpSession session);

    List<OrderGoods> viewOrderByState(Integer state);

    List<OrderDealing> findOrderByOid(Integer oid);

    Integer updateOrderStatus(HashMap<Integer,String> map,Integer oid);
}
