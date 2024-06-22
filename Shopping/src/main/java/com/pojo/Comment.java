package com.pojo;

import java.time.LocalDateTime;

public class Comment {
    private Integer id;
    private String remark;//评论内容
    private String uusername;//该条评论的用户名
    private LocalDateTime creatTime;//创建时间
    private Integer comprehensive;//综合星级评价

    public Comment() {
    }

    public Comment(Integer id, String remark, String uusername, LocalDateTime creatTime, Integer comprehensive) {
        this.id = id;
        this.remark = remark;
        this.uusername = uusername;
        this.creatTime = creatTime;
        this.comprehensive = comprehensive;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUusername() {
        return uusername;
    }

    public void setUusername(String uusername) {
        this.uusername = uusername;
    }

    public LocalDateTime getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(LocalDateTime creatTime) {
        this.creatTime = creatTime;
    }

    public Integer getComprehensive() {
        return comprehensive;
    }

    public void setComprehensive(Integer comprehensive) {
        this.comprehensive = comprehensive;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", remark='" + remark + '\'' +
                ", uusername='" + uusername + '\'' +
                ", creatTime=" + creatTime +
                ", comprehensive=" + comprehensive +
                '}';
    }
}
