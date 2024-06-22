package com.service.Impl;

import com.mapper.CommodityMapper;
import com.mapper.UserMapper;
import com.pojo.Category;
import com.pojo.Comment;
import com.pojo.Commodity;
import com.pojo.ShoppingCart;
import com.service.CommodityService;
import org.apache.commons.collections.Bag;
import org.apache.commons.collections.bag.HashBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class CommodityServiceImpl implements CommodityService {
    //注入对象
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CommodityMapper commodityMapper;

    /**
     * 主页2个大轮播图查询
     */
    @Override
    public List<Commodity> findNewCommodities() {
        List<Commodity> newCommodities = commodityMapper.findNewCommodities();
        //把查出来的种类赋值给商品
        for (Commodity newCommodity : newCommodities) {
            newCommodity.setCategory(commodityMapper.findCategoryByCid(newCommodity.getCategoryId()));
        }
        return newCommodities;
    }

    @Override
    public List<Commodity> findTopCommodities() {
        List<Commodity> topCommodities = commodityMapper.findTopCommodities();
        for (Commodity topCommodity : topCommodities) {
            topCommodity.setCategory(commodityMapper.findCategoryByCid(topCommodity.getCategoryId()));
        }
        return topCommodities;
    }

    /**
     * 主页3个小轮播图查询
     */
    @Override
    public List<List<Commodity>> findPopularCommodities() {
        //后台处理 将查出来的6条数据 弄错3 3形式存到popularCommodities里面
        //初始化
        List<List<Commodity>> popularCommodities = new LinkedList<>();
        List<Commodity> popularList=commodityMapper.findPopularCommodities();
        //分隔大集合
        //分隔大集合
        List<Commodity> p=new LinkedList<>();
        p.add(popularList.get(0));
        p.add(popularList.get(1));
        p.add(popularList.get(2));
        System.out.println("p1 = " + p);
        p.clear();
        popularCommodities.add(p);
        p.add(popularList.get(3));
        p.add(popularList.get(4));
        p.add(popularList.get(5));
        System.out.println("p2 = " + p);
        popularCommodities.add(p);
        System.out.println("manPopCommodities1 = " + popularCommodities.get(0));
        System.out.println("manPopCommodities2 = " + popularCommodities.get(1));
        return popularCommodities;
    }

    @Override
    public List<List<Commodity>> findManPopCommodities() {
        //后台处理 将查出来的6条数据 弄错3 3形式存到popularCommodities里面
        //初始化
        List<List<Commodity>> manPopCommodities = new LinkedList<>();
        List<Commodity> popularList=commodityMapper.findManPopCommodities();
        //分隔大集合
        List<Commodity> p=new LinkedList<>();
        p.add(popularList.get(0));
        p.add(popularList.get(1));
        p.add(popularList.get(2));
        System.out.println("p1 = " + p);
        p.clear();
        manPopCommodities.add(p);
        p.add(popularList.get(3));
        p.add(popularList.get(4));
        p.add(popularList.get(5));
        System.out.println("p2 = " + p);
        manPopCommodities.add(p);
        System.out.println("manPopCommodities1 = " + manPopCommodities.get(0));
        System.out.println("manPopCommodities2 = " + manPopCommodities.get(1));

        return manPopCommodities;
    }

    @Override
    public List<List<Commodity>> findWomanPopCommodities() {
        //后台处理 将查出来的6条数据 弄错3 3形式存到popularCommodities里面
        //初始化
        List<List<Commodity>> womanPopCommodities = new LinkedList<>();
        List<Commodity> popularList=commodityMapper.findWomanPopCommodities();
        //分隔大集合
        List<Commodity> p=new LinkedList<>();
        p.add(popularList.get(0));
        p.add(popularList.get(1));
        p.add(popularList.get(2));
        p.clear();
        womanPopCommodities.add(p);
        p.add(popularList.get(3));
        p.add(popularList.get(4));
        p.add(popularList.get(5));
        womanPopCommodities.add(p);
        return womanPopCommodities;
    }

    /**
     * 查看具体某个商品
     *
     * @param cid
     */
    @Override
    public Commodity viewCommodityByCid(Integer cid) {
        Commodity commodity = commodityMapper.viewCommodityByCid(cid);
        commodity.setParentCategory(commodityMapper.findParentCategoryByCategoryId(commodity.getCategoryId()));
        commodity.setCategory(commodityMapper.findCategoryByCid(commodity.getCategoryId()));
        return commodity;
    }

    @Override
    public List<Comment> viewCommentsByCid(Integer cid) {
        return commodityMapper.viewCommentsByCid(cid);
    }

    @Override
    public List<Commodity> viewRelatedCommoditiesByCid(Integer cid){
        String category = commodityMapper.findCategoryByCommodityId(cid);
        List<Commodity> relatedCommodityList = commodityMapper.findCommoditiesByCategory(category);
        for (Commodity commodity : relatedCommodityList) {
            commodity.setCategory(category);
        }
        return relatedCommodityList;
    }

    /**
     * 全部种类
     */
    @Override
    public Map<Integer, String> findAllParentCategory() {
        List <Category> categoryList = commodityMapper.findAllParentCategory();
        Map<Integer, String> map = new HashMap<>();
        for (Category category : categoryList) {
            map.put(category.getId(),category.getName());
        }
        return map;
    }


    /**
     * 订单相关
     *
     * @param cidList
     */
    @Override
    public List<ShoppingCart> findCommodityOfOrder(List<Integer> cidList) {
        List<ShoppingCart> shoppingCarts = new LinkedList<>();
        //去重
        TreeSet<Integer> cidSet= new TreeSet<>();
        for (Integer cid : cidList) {
            cidSet.add(cid);
        }
        ArrayList<Integer> cids = new ArrayList<>(cidSet);
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

    /**
     * 更新并效验乐观锁
     *
     * @param cid
     * @param version
     */
    @Override
    public  Integer updateVersion(Integer cid, Integer version,Integer successCount) {
        return commodityMapper.updateVersion(cid,version,successCount);
    }

    /**
     * 模糊查询
     *
     * @param categoryId
     * @param cname
     * @return
     */
    @Override
    public List<Commodity> viewCommoditiesByPage(Integer categoryId, String cname) {
        //如果cname有值,需要拼接%
        if (!(cname==null||cname.length()==0)){
            cname=("%"+cname+"%");
        }
        if (categoryId==null||categoryId==0){
            categoryId=null;
        }
        Commodity commodity = new Commodity();
        commodity.setName(cname);
        commodity.setCategoryId(categoryId);
        return commodityMapper.findByCondition(commodity);
    }

    /**
     * 添加商品
     *
     * @param commodity
     */
    @Override
    public Integer addCommodity(Commodity commodity) {
        if(commodity.getName().isEmpty()) return 0;
        if (commodity.getPhotoUrl().isEmpty()){
            commodity.setPhotoUrl("/img/simple.png");
        }
        if (commodity.getPrice()==null) return 3;
        if (commodity.getInventory()==null){
            commodity.setInventory(0);
        }
        if (commodity.getDiscount()==null){
            commodity.setDiscount(1.0);
        }else {
            commodity.setDiscount(commodity.getDiscount()/10);
        }
        if (commodity.getDescription().length()<=30) return 6;
        if (commodity.getDetails().isEmpty()){
            commodity.setDetails("暂无细节,可联系平台了解详情");
        }
        return commodityMapper.addCommodity(commodity);
    }

    /**
     * 根据cid删除商品
     *
     * @param cid
     * @return
     */
    @Override
    public Integer deleteById(Integer cid) {
        return commodityMapper.deleteById(cid);
    }

    @Override
    public Integer changeStateById(Commodity commodity) {

        if (commodity.getStatus()==1) commodity.setStatus(0);
        else commodity.setStatus(1);

        return commodityMapper.changeStateById(commodity);
    }

    @Override
    public Integer updateCommodityByCid(Commodity commodity) {
        return commodityMapper.updateCommodityByCid(commodity);
    }

    @Override
    public Integer addCategory(String name, Integer parentId) {
        if (name.isEmpty()) return 0;
        if (parentId==null){
            parentId=0;
        }
        return commodityMapper.addCategory(name,parentId);
    }

    @Override
    public Integer updateInventory(Integer cid, Integer count) {
        //增加销量
        commodityMapper.updateSales(cid,count);
        return commodityMapper.updateInventory(cid,count);
    }

}
