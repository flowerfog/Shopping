package com.pojo;

import java.util.Date;

/**
 * 订单实体类
 */
public class OrderGoods {
    private Integer id;//订单id
    private String orderUUid;//订单编号
    private Date createTime;//订单创建时间
    private Integer uid;//用户id
    private Integer aid;//地址id
    private Integer state;//0-未完成 1-已完成

    public OrderGoods() {
    }

    public OrderGoods(Integer id, String orderUUid, Integer uid, Integer aid) {
        this.id = id;
        this.orderUUid = orderUUid;
        this.uid = uid;
        this.aid = aid;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderUUid() {
        return orderUUid;
    }

    public void setOrderUUid(String orderUUid) {
        this.orderUUid = orderUUid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "OrderGoods{" +
                "id=" + id +
                ", orderUUid='" + orderUUid + '\'' +
                ", createTime=" + createTime +
                ", uid=" + uid +
                ", aid=" + aid +
                ", state=" + state +
                '}';
    }
}
