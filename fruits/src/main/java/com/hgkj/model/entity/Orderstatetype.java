package com.hgkj.model.entity;

public class Orderstatetype {
    private Integer orderstatetypeid;

    private String orderstatetypename;

    public Integer getOrderstatetypeid() {
        return orderstatetypeid;
    }

    public void setOrderstatetypeid(Integer orderstatetypeid) {
        this.orderstatetypeid = orderstatetypeid;
    }

    public String getOrderstatetypename() {
        return orderstatetypename;
    }

    public void setOrderstatetypename(String orderstatetypename) {
        this.orderstatetypename = orderstatetypename == null ? null : orderstatetypename.trim();
    }
}