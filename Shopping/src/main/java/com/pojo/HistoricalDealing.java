package com.pojo;

import java.util.Objects;

public class HistoricalDealing {
    private Integer cid;//历史商品id
    private String name;//历史商品名字
    private Double price;//历史商品价格
    private Integer count;//历史购买商品个数
    private Integer status;//商品状态 0-未发货 1-未发货退货 3-未收货退货 5-运输中 7-收到货退货 8-成功退货 9-已到货
    private String tracking;//某个商品的快递单号

    public HistoricalDealing() {
    }

    public HistoricalDealing(Integer cid, String name, Double price, Integer count, Integer status, String tracking) {
        this.cid = cid;
        this.name = name;
        this.price = price;
        this.count = count;
        this.status = status;
        this.tracking = tracking;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HistoricalDealing that = (HistoricalDealing) o;
        return Objects.equals(cid, that.cid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cid);
    }

    @Override
    public String toString() {
        return "HistoricalDealing{" +
                "cid=" + cid +
                '}';
    }
}
