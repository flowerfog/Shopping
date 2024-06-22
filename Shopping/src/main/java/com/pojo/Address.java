package com.pojo;

public class Address {
    private Integer id;//地址id
    private Integer uid;//用户Id
    private String name;//收件人名
    private String city;//城市
    private String detail;//具体地址细节
    private String phone;//收件电话
    private String email;//收件邮箱
    private Integer uses;//使用次数


    public Address() {
    }

    public Address(Integer id, Integer uid, String name, String city, String detail, String phone, String email, Integer uses) {
        this.id = id;
        this.uid = uid;
        this.name = name;
        this.city = city;
        this.detail = detail;
        this.phone = phone;
        this.email = email;
        this.uses = uses;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getUses() {
        return uses;
    }

    public void setUses(Integer uses) {
        this.uses = uses;
    }


    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", detail='" + detail + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", uses=" + uses +
                '}';
    }
}
