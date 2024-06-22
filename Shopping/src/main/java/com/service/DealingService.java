package com.service;


import com.pojo.Dealing;

import java.util.List;

public interface DealingService {
    Integer insertDealing(Integer oid,Integer cid,String name,Double price);

}
