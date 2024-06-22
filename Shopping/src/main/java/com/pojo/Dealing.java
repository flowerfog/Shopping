package com.pojo;

import java.time.LocalDateTime;
import java.util.*;

public class Dealing {
    private Integer id;//详情表id
    private Integer oid;//订单Id
    private String orderUUid;//订单编号
    private LocalDateTime createTime;
    private String rightTime;//显示在页面的年月份
    private String dayTime;//显示在页面的具体当天时间

    private Double total;//订单总价


    //
    private List<HistoricalDealing> historicalDealingList;

    private Integer state;//订单状态 0-已完成 1-未完成

    private Address address;//收货地址

    public Dealing() {
    }

    public Dealing(Integer id, Integer oid, String orderUUid, LocalDateTime createTime, String rightTime, String dayTime, List<HistoricalDealing> historicalDealingList, Integer state, Address address) {
        this.id = id;
        this.oid = oid;
        this.orderUUid = orderUUid;
        this.createTime = createTime;
        this.rightTime = rightTime;
        this.dayTime = dayTime;
        this.historicalDealingList = historicalDealingList;
        this.state = state;
        this.address = address;
    }


    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOrderUUid() {
        return orderUUid;
    }

    public void setOrderUUid(String orderUUid) {
        this.orderUUid = orderUUid;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getRightTime() {
        return rightTime;
    }

    public void setRightTime(String rightTime) {
        this.rightTime = rightTime;
    }

    public String getDayTime() {
        return dayTime;
    }

    public void setDayTime(String dayTime) {
        this.dayTime = dayTime;
    }

    public List<HistoricalDealing> getHistoricalDealingList() {
        return historicalDealingList;
    }

    public void setHistoricalDealingList(List<HistoricalDealing> historicalDealingList) {
        this.historicalDealingList = historicalDealingList;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Dealing{" +
                "id=" + id +
                ", oid=" + oid +
                ", orderUUid='" + orderUUid + '\'' +
                ", createTime=" + createTime +
                ", rightTime='" + rightTime + '\'' +
                ", dayTime='" + dayTime + '\'' +
                ", historicalDealingList=" + historicalDealingList +
                ", state=" + state +
                ", address=" + address +
                '}';
    }
}
