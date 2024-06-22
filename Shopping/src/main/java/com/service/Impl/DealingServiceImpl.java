package com.service.Impl;

import com.mapper.DealingMapper;
import com.pojo.Dealing;
import com.service.DealingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DealingServiceImpl implements DealingService {
    @Autowired
    private DealingMapper dealingMapper;
    @Override
    public Integer insertDealing(Integer oid, Integer cid, String name, Double price) {
        return dealingMapper.insertDealing(oid,cid,name,price);
    }
}
