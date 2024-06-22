package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DealingMapper {
    @Insert("INSERT INTO `dealing` (`oid`, `cid`, `oldCname`, `oldPrice`) VALUES (#{oid}, #{cid},#{name}, #{price})")
    Integer insertDealing(@Param("oid") Integer oid, @Param("cid") Integer cid, @Param("name") String name, @Param("price") Double price);
}
