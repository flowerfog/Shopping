package com.pojo;

import java.time.LocalDateTime;

public class OrderDealing {
    private String orderUUid;
    private LocalDateTime createTime;
    private String oldCname;
    private Double oldPrice;
    private Integer status;
    private String tracking;
    private Integer uid;
    private Integer aid;
    private Address address;
    private User user;
    private Integer count;
    private Integer cid;
    private Integer oid;

    public OrderDealing() {
    }

    public OrderDealing(String orderUUid, LocalDateTime createTime, String oldCname, Double oldPrice, Integer status, String tracking, Integer uid, Integer aid, Address address, User user, Integer count, Integer cid, Integer oid) {
        this.orderUUid = orderUUid;
        this.createTime = createTime;
        this.oldCname = oldCname;
        this.oldPrice = oldPrice;
        this.status = status;
        this.tracking = tracking;
        this.uid = uid;
        this.aid = aid;
        this.address = address;
        this.user = user;
        this.count = count;
        this.cid = cid;
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

    public String getOldCname() {
        return oldCname;
    }

    public void setOldCname(String oldCname) {
        this.oldCname = oldCname;
    }

    public Double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(Double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTracking() {
        return tracking;
    }

    public void setTracking(String tracking) {
        this.tracking = tracking;
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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    @Override
    public String toString() {
        return "OrderDealing{" +
                "orderUUid='" + orderUUid + '\'' +
                ", createTime=" + createTime +
                ", oldCname='" + oldCname + '\'' +
                ", oldPrice=" + oldPrice +
                ", status=" + status +
                ", tracking='" + tracking + '\'' +
                ", uid=" + uid +
                ", aid=" + aid +
                ", address=" + address +
                ", user=" + user +
                ", count=" + count +
                ", cid=" + cid +
                ", oid=" + oid +
                '}';
    }
}
