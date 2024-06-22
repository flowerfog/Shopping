package com.pojo;

import java.time.LocalDateTime;

public class Favorite {
    private Integer id;
    private Integer cid;//商品id
    private String photoUrl;//封面图片
    private String name;//商品名称
    private Double oldPrice;//收藏时价格
    private Double nowPrice;//当前价格
    private String description;//详细描述
    private LocalDateTime createTime;

    public Favorite() {
    }

    public Favorite(Integer id, Integer cid, String photoUrl, String name, Double oldPrice, Double nowPrice, String description, LocalDateTime createTime) {
        this.id = id;
        this.cid = cid;
        this.photoUrl = photoUrl;
        this.name = name;
        this.oldPrice = oldPrice;
        this.nowPrice = nowPrice;
        this.description = description;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(Double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public Double getNowPrice() {
        return nowPrice;
    }

    public void setNowPrice(Double nowPrice) {
        this.nowPrice = nowPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", cid=" + cid +
                ", photoUrl='" + photoUrl + '\'' +
                ", name='" + name + '\'' +
                ", oldPrice=" + oldPrice +
                ", nowPrice=" + nowPrice +
                ", description='" + description + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}