package com.mapper;

import com.pojo.Address;
import com.pojo.Commodity;
import com.pojo.Favorite;
import com.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.*;

@Mapper
public interface UserMapper {
    @Select("select * from `user` where email=#{email} and password=#{password}")
    User login(@Param("email") String email, @Param("password") String password);

    @Insert("INSERT INTO `favorite` (`uid`, `cid`,`oldPrice`) VALUES (#{uid}, #{cid},#{oldPrice})")
    Integer addMyFavorite(@Param("uid") Integer uid,@Param("cid") Integer cid,@Param("oldPrice") Double oldPrice);

    @Select("select cid from `favorite` where uid=#{uid}")
    List<Integer> selectCidList(Integer uid);

    LinkedList<Favorite> selectFavoriteByUid(Integer cid);

    @Select("select count(id) from `favorite` where uid=#{uid}")
    Integer findFavoriteByUid(Integer uid);

    @Select("select count(id) from `shoppingcart` where uid=#{uid}")
    Integer findCartByUid(Integer uid);

    @Delete("delete from `favorite` where id=#{id}")
    Integer delMyFavoriteByFid(Integer id);

    @Select("select id from `favorite` where uid=#{uid} and cid=#{cid}")
    Integer findMyFavorite(@Param("uid") Integer uid,@Param("cid") Integer cid);

    @Insert("insert into `shoppingcart` values(null,#{uid},#{cid})")
    Integer addMyCart(@Param("uid") Integer uid, @Param("cid") Integer cid);

    @Delete("DELETE FROM shoppingcart WHERE uid=#{uid} and cid=#{cid}")
    Integer delMyShoppingCartByCid(@Param("uid") Integer uid, @Param("cid") Integer cid);

    @Delete("DELETE FROM shoppingcart WHERE uid=#{uid}")
    Integer clearMyShoppingCartByUid(Integer uid);

    @Select("select id from `shoppingcart` where uid=#{uid} limit 1")
    Integer isEmptyOfCartByUid(Integer uid);

    @Select("select * from `address` where uid=#{uid} ORDER BY uses DESC")
    List<Address> findAddressByUid(Integer uid);

    @Update("UPDATE `user` SET money=(money-#{orderPrice}) WHERE id=#{uid}")
    Integer updateUserMoneyByUid(@Param("uid") Integer uid, @Param("orderPrice") Double orderPrice);

    @Select("select * from `user` where id=#{uid}")
    User findUserByUid(Integer uid);

    @Select("select id from `user`")
    List<Integer> findAllUid();

    @Select("select * from `address` where id=#{aid}")
    Address selectAddressByAid(Integer aid);

    @Update("update user set money=(money+#{price}) where id=#{uid}")
    Integer updateMoney(@Param("price") Double price,@Param("uid") Integer uid);

    @Select("select * from user where role=0")
    List<User> viewUsers();

    @Update("update user set status=#{status} where id=#{uid}")
    Integer updateStatus(@Param("uid")Integer uid,@Param("status") Integer status);

    @Insert("INSERT INTO `user` (`username`, `email`, `password`, `gender`,code) VALUES (#{username}, #{email}, #{password},'1',#{code})")
    Integer addUser(User user);

    @Select("SELECT id FROM `user` WHERE code like #{code}")
    Integer selectUidByCode(String code);

    @Update("UPDATE `user` set `status` = 1 where id=#{uid}")
    Integer setStatus(Integer uid);

    @Select("select * from `address` where uid=#{uid}")
    List<Address> findMyAddress(Integer uid);
}
