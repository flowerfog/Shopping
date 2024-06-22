package com.mapper;

import com.pojo.Dealing;
import com.pojo.HistoricalDealing;
import com.pojo.OrderDealing;
import com.pojo.OrderGoods;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface OrderMapper {
    @Insert("INSERT INTO `ordergoods` (`id`,`orderUUid`, `uid`, `aid`) VALUES (null,#{orderUUid}, #{uid}, #{aid}) ")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    Integer insertOrder(OrderGoods orderGoods);

    List<Dealing> viewUserOrderListByUid(Integer uid);

    List <HistoricalDealing> selectDealingByOid(Integer oid);

    @Select("SELECT count(id) from `dealing` where cid=#{cid} and oid=#{oid}")
    Integer findCountByCidAndOid(@Param("cid")Integer cid,@Param("oid")Integer oid);

    List<OrderGoods> viewOrderByState(Integer state);

    //查出oid下的所有Dealing
    @Select("SELECT DISTINCT orderUUid,createTime,oldCname,oldPrice,aid,uid,`status`,`tracking` ,cid,oid \n" +
            "FROM `ordergoods` as o, `dealing` as d WHERE o.id=d.oid and oid=#{oid}")
    List<OrderDealing> findOrderByOid(Integer oid);

    //查到dealing的商品数量
    @Select("SELECT count(*) from `dealing` where oid=#{oid} and cid=#{cid}")
    Integer selectCidCountByOid(@Param("cid") Integer cid,@Param("oid") Integer oid);

    //发货
    Integer updateOrderStatusByOid(@Param("status") Integer status,@Param("tracking")String tracking,@Param("cid")Integer cid,@Param("oid")Integer oid);

    //修改Dealing状态
    @Update("update `dealing` set  status = #{status} where cid=#{cid} and oid=#{oid}")
    Integer updateOrderStatus(@Param("cid")Integer cid,@Param("oid")Integer oid,@Param("status") Integer status);

    //那么就去判断该订单的其他详情的status是否都为9
    @Select("select status from `dealing` where oid=#{oid}")
    List<Integer> selectStatusByOid(Integer oid);

    //修改订单最终状态
    @Update("update `ordergoods` set state=1 where id=#{oid}")
    Integer updateOrderFinalStatus(Integer oid);

    //查询快递单是否为空
    @Select("select tracking from `dealing` where cid=#{cid} and oid=#{oid} ")
    List<String> selectTrackingIsNull(@Param("cid")Integer cid,@Param("oid")Integer oid);

    @Select("select oldPrice from `dealing` where cid=#{cid} and oid=#{oid} ")
    List<Double> findOrderPriceByOid(@Param("cid")Integer cid,@Param("oid")Integer oid);

    @Select("select uid from `ordergoods` where id=#{oid}")
    Integer findUidByOid(Integer oid);

}
