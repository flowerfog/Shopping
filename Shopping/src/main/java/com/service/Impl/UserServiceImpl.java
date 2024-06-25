package com.service.Impl;

import com.mapper.CommodityMapper;
import com.mapper.UserMapper;
import com.pojo.*;
import com.service.UserService;
import org.apache.commons.collections.Bag;
import org.apache.commons.collections.bag.HashBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CommodityMapper commodityMapper;

    @Override
    public User login(String email,String password) {
        User user = userMapper.login(email, password);
        //说明没查到
        if (user==null){
            return null;
        }
        return user;
    }

    @Override
    public Integer addMyFavorite(Integer uid, Integer cid) {
        //先判断用户喜欢列表是否存在
        System.out.println("uid = " + uid);
        System.out.println("cid = " + cid);
        Integer fid = userMapper.findMyFavorite(uid, cid);
        System.out.println("fid = " + fid);
        if (fid==null){
            //根据cid 查询商品当前价格 存入喜欢列表
            Double price = commodityMapper.findPriceByCid(cid);
            return userMapper.addMyFavorite(uid,cid,price);
        }
        return 0;
    }

    @Override
    public List<Integer> selectCidList(Integer uid) {
        return userMapper.selectCidList(uid);
    }

    @Override
    public LinkedList<Favorite> selectFavoriteByUid(Integer uid) {
        //给收藏列表的favorite商品的nowPrice赋值
        LinkedList<Favorite> favorites = userMapper.selectFavoriteByUid(uid);
        for (Favorite favorite : favorites) {
            favorite.setNowPrice(commodityMapper.findPriceByCid(favorite.getCid()));
        }
        return favorites;
    }

    @Override
    public Integer findFavoriteByUid(Integer uid) {

        return userMapper.findFavoriteByUid(uid);
    }

    @Override
    public Integer findCartByUid(Integer uid) {
        return userMapper.findCartByUid(uid);
    }

    @Override
    public Integer delMyFavoriteByFid(Integer id) {
        System.out.println("删除收藏商品的id是"+id);
        return userMapper.delMyFavoriteByFid(id);
    }

    @Override
    public Integer addMyCart(Integer uid, Integer cid) {
        return userMapper.addMyCart(uid,cid);
    }

    @Override
    public List<ShoppingCart> viewShoppingCartsByUid(Integer uid){
        List<ShoppingCart> shoppingCarts = new LinkedList<>();
        List <Integer> cidList = commodityMapper.findCartInCidsByUid(uid);
        System.out.println("cidList = " + cidList);
        //去重
        TreeSet<Integer> cidSet= new TreeSet<>();
        for (Integer cid : cidList) {
            cidSet.add(cid);
        }
        ArrayList<Integer> cids = new ArrayList<>(cidSet);
        System.out.println("cids = " + cids);
        //通过cidSet里面的cid去查找商品然后商品集合
        List <Commodity> commodities = commodityMapper.findCommoditiesByCids(cidSet);
        Bag bag = new HashBag(cidList);
        for (int i = 0; i < commodities.size(); i++) {
            //添加元素
            shoppingCarts.add(new ShoppingCart(
                            i,
                            bag.getCount(cids.get(i)),
                            commodities.get(i)));
        }

        return shoppingCarts;
    }

    @Override
    public Integer delMyShoppingCartByCid(Integer uid, Integer cid) {
        return userMapper.delMyShoppingCartByCid(uid,cid);
    }

    @Override
    public Integer clearMyShoppingCartByUid(Integer uid) {
        return userMapper.clearMyShoppingCartByUid(uid);
    }

    @Override
    public Boolean isEmptyOfCartByUid(Integer uid) {
        Integer res = userMapper.isEmptyOfCartByUid(uid);
        if (res!=null) return true;
        return false;
    }

    @Override
    public List<Address> findAddressByUid(Integer uid) {
        List<Address> addressList = userMapper.findAddressByUid(uid);
        return addressList;
    }

    @Override
    public Integer updateUserMoneyByUid(Integer uid, Double orderPrice) {
        return userMapper.updateUserMoneyByUid(uid,orderPrice);
    }

    @Override
    public List<Integer> findAllUid() {
        return userMapper.findAllUid();
    }

    @Override
    public boolean updateMoney(double price,int id){
        int rs = userMapper.updateMoney(price,id);
        if(rs>0)
        {
            System.out.println("充值成功"+price);
            return true;
        }
            System.out.println("失败");
            return false;
    }
}
