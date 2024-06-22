package com.service;

import com.pojo.*;

import java.util.*;

public interface UserService {

    boolean updateMoney(double price,int id);
    //登陆
    User login(String email,String password);

    //添加喜好的商品
    Integer addMyFavorite(Integer uid,Integer cid);

    //根据uid查询其用户的收藏的cid
    List<Integer> selectCidList(Integer uid);

    //根据传过来的cidList去查询对应的商品列表
    LinkedList<Favorite> selectFavoriteByUid(Integer uid);

    //查询收藏个数
    Integer findFavoriteByUid(Integer uid);
    //查询购物车个数
    Integer findCartByUid(Integer uid);

    //根据fid删除收藏的商品
    Integer delMyFavoriteByFid(Integer id);

    //根据cid添加购物车
    Integer addMyCart(Integer uid,Integer cid);

    //查看用户购物车内容
    List<ShoppingCart>  viewShoppingCartsByUid(Integer uid);

    //从购物车删除某类商品
    Integer delMyShoppingCartByCid(Integer uid,Integer cid);

    //清空购物车
    Integer clearMyShoppingCartByUid(Integer uid);

    //查看用户购物车是否为空
    Boolean isEmptyOfCartByUid(Integer uid);

    //查找用户地址
    List<Address> findAddressByUid(Integer uid);

    //修改用户余额
    Integer updateUserMoneyByUid(Integer uid,Double orderPrice);

    //查询全部用户id
    List<Integer> findAllUid();


}
