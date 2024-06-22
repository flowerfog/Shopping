package com.pojo;

/**
 * 购物车实体类
 */
public class ShoppingCart {
    private Integer id;
    private Integer commodityCount;
    private Commodity commodity;
    public ShoppingCart() {
    }

    public ShoppingCart(Integer id, Integer commodityCount, Commodity commodity) {
        this.id = id;
        this.commodityCount = commodityCount;
        this.commodity = commodity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCommodityCount() {
        return commodityCount;
    }

    public void setCommodityCount(Integer commodityCount) {
        this.commodityCount = commodityCount;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }




    @Override
    public String toString() {
        return "ShoppingCart{" +
                "id=" + id +
                ", commodityCount=" + commodityCount +
                ", commodity=" + commodity +
                '}';
    }
}
