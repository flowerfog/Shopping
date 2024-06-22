package com.pojo;

import org.springframework.stereotype.Component;
import java.util.*;

/**
 * 用户实体类
 */
@Component
public class User {
    private Integer id;//用户id
    private String username;//用户名
    private String email;//邮箱
    private String password;//密码
    private Integer role;//身份码 0-普通用户 5-商家 9-平台管理员
    private Double money;//用户余额
    private Integer status;//用户账户状态
    private String code;//验证码
    private Integer favoriteCount;//收藏个数
    private Integer cartCount;//购物车个数
    private Integer gender;//性别码
    private String UUid;

    public String getUUid() {
        return UUid;
    }

    public void setUUid(String UUid) {
        this.UUid = UUid;
    }


    public User(Integer id, String username, String email, String password, Integer role, Double money, Integer status, String code, Integer favoriteCount, Integer cartCount, Integer gender, String UUid, Integer cartCommodityCount, Double cartPrice, List<Commodity> myLike, String shoppingCids, Double resTotal, List<ShoppingCart> shoppingCarts) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.money = money;
        this.status = status;
        this.code = code;
        this.favoriteCount = favoriteCount;
        this.cartCount = cartCount;
        this.gender = gender;
        this.UUid = UUid;
        this.cartCommodityCount = cartCommodityCount;
        this.cartPrice = cartPrice;
        this.myLike = myLike;
        ShoppingCids = shoppingCids;
        this.resTotal = resTotal;
        this.shoppingCarts = shoppingCarts;
    }

    private Integer cartCommodityCount;//购物车里面的商品总个数
    private Double cartPrice;//购物车总价
    private List<Commodity> myLike;
    private String ShoppingCids;//用户购物车的cid们

    private Double resTotal;//用户的历史消费总和

    private List<ShoppingCart> shoppingCarts;

    public User() {
    }


    public User(Integer id, String username, String email, String password, Integer role, Double money, Integer status, String code, Integer favoriteCount, Integer cartCount, Integer gender, Integer cartCommodityCount, Double cartPrice, List<Commodity> myLike, String shoppingCids, Double resTotal, List<ShoppingCart> shoppingCarts) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.money = money;
        this.status = status;
        this.code = code;
        this.favoriteCount = favoriteCount;
        this.cartCount = cartCount;
        this.gender = gender;
        this.cartCommodityCount = cartCommodityCount;
        this.cartPrice = cartPrice;
        this.myLike = myLike;
        ShoppingCids = shoppingCids;
        this.resTotal = resTotal;
        this.shoppingCarts = shoppingCarts;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Double getResTotal() {
        return resTotal;
    }

    public void setResTotal(Double resTotal) {
        this.resTotal = resTotal;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getFavoriteCount() {
        return favoriteCount;
    }

    public void setFavoriteCount(Integer favoriteCount) {
        this.favoriteCount = favoriteCount;
    }

    public Integer getCartCount() {
        return cartCount;
    }

    public void setCartCount(Integer cartCount) {
        this.cartCount = cartCount;
    }

    public Integer getCartCommodityCount() {
        return cartCommodityCount;
    }

    public void setCartCommodityCount(Integer cartCommodityCount) {
        this.cartCommodityCount = cartCommodityCount;
    }

    public Double getCartPrice() {
        return cartPrice;
    }

    public void setCartPrice(Double cartPrice) {
        this.cartPrice = cartPrice;
    }

    public List<Commodity> getMyLike() {
        return myLike;
    }

    public void setMyLike(List<Commodity> myLike) {
        this.myLike = myLike;
    }

    public String getShoppingCids() {
        return ShoppingCids;
    }

    public void setShoppingCids(String shoppingCids) {
        ShoppingCids = shoppingCids;
    }

    public List<ShoppingCart> getShoppingCarts() {
        return shoppingCarts;
    }

    public void setShoppingCarts(List<ShoppingCart> shoppingCarts) {
        this.shoppingCarts = shoppingCarts;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", money=" + money +
                ", status=" + status +
                ", code='" + code + '\'' +
                ", favoriteCount=" + favoriteCount +
                ", cartCount=" + cartCount +
                ", cartCommodityCount=" + cartCommodityCount +
                ", cartPrice=" + cartPrice +
                ", myLike=" + myLike +
                ", ShoppingCids='" + ShoppingCids + '\'' +
                ", resTotal=" + resTotal +
                ", shoppingCarts=" + shoppingCarts +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}