package com.mapper;


import com.pojo.Category;
import com.pojo.Comment;
import com.pojo.Commodity;
import org.apache.ibatis.annotations.*;

import java.util.*;

@Mapper
public interface CommodityMapper {
    /**
     * 初始化工作
     */

    List<Commodity> findNewCommodities();

    List<Commodity> findTopCommodities();

    List<Commodity> findPopularCommodities();

    List<Commodity> findManPopCommodities();

    List<Commodity> findWomanPopCommodities();

    List<Category> findAllParentCategory();

    @Select("select `category`.name from `category` where id=#{cid}")
    String findCategoryByCid(Integer cid);


    @Select("select `category`.name from `category` where id=(select categoryId from `commodity` where id=#{cid})")
    String findCategoryByCommodityId(Integer cid);
    /**
     * 基本查询
     */
    @Select("select price from `commodity` where id=#{cid}")
    Double findPriceByCid(Integer cid);

    /**
     * 根据cid查看商品
     */
    Commodity viewCommodityByCid(Integer cid);

    /**
     * 根据categoryId查看某个种类的父分类
     */
    String findParentCategoryByCategoryId(Integer categoryId);

    /**
     * 根据cid查看某商品的相关评论
     */
    @Select("select id,remark,uusername,createTime,comprehensive from `comment` where cid=#{cid}")
    List<Comment> viewCommentsByCid(Integer cid);

    @Select("SELECT commodity.* FROM `commodity` ,`category` WHERE commodity.categoryId=(SELECT id FROM category WHERE `name` like #{category}) LIMIT 4")
    List<Commodity> findCommoditiesByCategory(String category);


    /**
     * 根据uid查找其购物车里面的全部cid
     * @param uid
     * @return
     */
    @Select("SELECT cid FROM `shoppingcart` WHERE uid = #{uid}")
    List<Integer> findCartInCidsByUid(Integer uid);

    List<Commodity> findCommoditiesByCids(TreeSet<Integer> cids);

    /**
     * 效验乐观锁
     */
    @Update("UPDATE `commodity` SET inventory=(inventory-#{successCount}),version=(version+1) WHERE id=#{cid} and version=#{version};")
    Integer updateVersion(@Param("cid") Integer cid,@Param("version")  Integer version, @Param("successCount") Integer successCount);


    /**
     * 模糊查询
     * @return
     */
    List<Commodity> findByCondition(Commodity commodity);

    @Select("select id from `category` where parent_id = #{caId}")
    List<Integer> findAllSonCategoryByCaId(Integer caId);

    @Insert("INSERT INTO `commodity` (`name`, `photoUrl`, `price`, `categoryId`, `inventory`, `description`, `details`, `discount`, `status`) " +
            "VALUES (#{name}, #{photoUrl}, #{price}, #{categoryId}, #{inventory}, #{description},#{details}, #{discount}, '0')")
    Integer addCommodity(Commodity commodity);

    @Delete("delete from `commodity` where id=#{cid}")
    Integer deleteById(Integer cid);

    //根据id修改商品的状态
    @Update("update `commodity` set status=#{status}  where id=#{id}")
    Integer changeStateById(Commodity commodity);

    @Update("UPDATE `commodity` SET" +
            " `name`=#{name}," +
            " `price`=#{price}," +
            " `inventory`=#{inventory}," +
            " `description`=#{description}, `details`=#{details}, `discount`=#{discount} WHERE (`id`=#{id})")
    Integer updateCommodityByCid(Commodity commodity);

    @Insert("insert into `category` values(null,#{name},#{parentId},null,null)")
    Integer addCategory(@Param("name") String name,@Param("parentId") Integer parentId);

    //更新库存
    @Update("update `commodity` set inventory=(inventory-#{count}) where id=#{cid}")
    Integer updateInventory(@Param("cid") Integer cid,@Param("count") Integer count);

    //更新销量
    @Update("update `commodity` set salesVolume=(salesVolume+#{count}) where id=#{cid}")
    Integer updateSales(@Param("cid") Integer cid,@Param("count") Integer count);
}
