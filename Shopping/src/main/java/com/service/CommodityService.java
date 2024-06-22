package com.service;

import com.pojo.Comment;
import com.pojo.Commodity;
import com.pojo.ShoppingCart;

import java.util.*;
public interface CommodityService {
    /**
     * 主页2个大轮播图查询
     */
    List<Commodity> findNewCommodities();

    List<Commodity> findTopCommodities();

    /**
     * 主页3个小轮播图查询
     */

    List<List<Commodity>> findPopularCommodities();

    List<List<Commodity>> findManPopCommodities();

    List<List<Commodity>> findWomanPopCommodities();

    /**
     * 查看具体某个商品 and 及其评论 and 及其相关商品
     */
    Commodity viewCommodityByCid(Integer cid);
    List<Comment> viewCommentsByCid(Integer cid);
    List<Commodity> viewRelatedCommoditiesByCid(Integer cid);

    /**
     * 全部种类
     */

    Map<Integer,String> findAllParentCategory();

    /**
     * 订单相关
     */
    List<ShoppingCart> findCommodityOfOrder(List<Integer> cidList);

    /**
     * 更新并效验乐观锁
     */
    Integer updateVersion(Integer cid, Integer version,Integer successCount);

    /**
     * 模糊查询
     * @param categoryId
     * @param cname
     * @return
     */
    List<Commodity> viewCommoditiesByPage(Integer categoryId,String cname);

    /**
     * 添加商品
     */
    Integer addCommodity(Commodity commodity);

    /**
     * 根据cid删除商品
     * @param cid
     * @return
     */
    Integer deleteById(Integer cid);

    Integer changeStateById(Commodity commodity);

    Integer updateCommodityByCid(Commodity commodity);

    Integer addCategory(String name,Integer parentId);

    //根据cid更新库存
    Integer updateInventory(Integer cid,Integer count);
}
