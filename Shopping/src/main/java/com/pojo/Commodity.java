package com.pojo;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;

/**
 * 商品实体类
 */
@Component
public class Commodity {
    private Integer id;//商品编号
    private String name;//商品名称
    private Integer heat;//商品热度
    private String photoUrl;//封面地址
    private Double price;//商品价格
    private String category;//商品种类
    private Integer categoryId;//商品种类id
    private Integer salesVolume;//商品销售量
    private Integer positiveFeedback;//商品好评量
    private Integer inventory;//库存量
    private String description;//商品描述
    private String details;//商品细节
    private Integer quality;//商品质量星级
    private Integer afterSales;//商品售后星级
    private LocalDateTime createTime;//上架时间
    private int status;//商品状态 0-未上架 1-在售
    private Double discount;//商品折扣
    private Integer version;//乐观锁

    //细节图
    private List<String> photoDetails;

    //父种类
    private String parentCategory;

    public Commodity() {
    }

    public Commodity(Integer id, String name, Integer heat, String photoUrl, Double price, String category, Integer categoryId, Integer salesVolume, Integer positiveFeedback, Integer inventory, String description, String details, Integer quality, Integer afterSales, LocalDateTime createTime, int status, Double discount, Integer version, List<String> photoDetails, String parentCategory) {
        this.id = id;
        this.name = name;
        this.heat = heat;
        this.photoUrl = photoUrl;
        this.price = price;
        this.category = category;
        this.categoryId = categoryId;
        this.salesVolume = salesVolume;
        this.positiveFeedback = positiveFeedback;
        this.inventory = inventory;
        this.description = description;
        this.details = details;
        this.quality = quality;
        this.afterSales = afterSales;
        this.createTime = createTime;
        this.status = status;
        this.discount = discount;
        this.version = version;
        this.photoDetails = photoDetails;
        this.parentCategory = parentCategory;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getHeat() {
        return heat;
    }

    public void setHeat(Integer heat) {
        this.heat = heat;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Integer salesVolume) {
        this.salesVolume = salesVolume;
    }

    public Integer getPositiveFeedback() {
        return positiveFeedback;
    }

    public void setPositiveFeedback(Integer positiveFeedback) {
        this.positiveFeedback = positiveFeedback;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }

    public Integer getAfterSales() {
        return afterSales;
    }

    public void setAfterSales(Integer afterSales) {
        this.afterSales = afterSales;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public List<String> getPhotoDetails() {
        return photoDetails;
    }

    public void setPhotoDetails(List<String> photoDetails) {
        this.photoDetails = photoDetails;
    }

    public String getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(String parentCategory) {
        this.parentCategory = parentCategory;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", heat=" + heat +
                ", photoUrl='" + photoUrl + '\'' +
                ", price=" + price +
                ", category='" + category + '\'' +
                ", categoryId=" + categoryId +
                ", salesVolume=" + salesVolume +
                ", positiveFeedback=" + positiveFeedback +
                ", inventory=" + inventory +
                ", description='" + description + '\'' +
                ", details='" + details + '\'' +
                ", quality=" + quality +
                ", afterSales=" + afterSales +
                ", createTime=" + createTime +
                ", status=" + status +
                ", discount=" + discount +
                ", version=" + version +
                ", photoDetails=" + photoDetails +
                ", parentCategory='" + parentCategory + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Commodity commodity = (Commodity) o;
        return id.equals(commodity.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}