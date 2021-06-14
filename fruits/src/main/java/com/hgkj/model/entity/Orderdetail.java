package com.hgkj.model.entity;

public class Orderdetail {
    private Integer orderdetailid;

    private Integer orderfruitnum;

    private Double orderfruitmoney;

    private Integer ordersid;

    private Integer goodsid;

    private Goods goods;


    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getOrderdetailid() {
        return orderdetailid;
    }

    public void setOrderdetailid(Integer orderdetailid) {
        this.orderdetailid = orderdetailid;
    }

    public Integer getOrderfruitnum() {
        return orderfruitnum;
    }

    public void setOrderfruitnum(Integer orderfruitnum) {
        this.orderfruitnum = orderfruitnum;
    }

    public Double getOrderfruitmoney() {
        return orderfruitmoney;
    }

    public void setOrderfruitmoney(Double orderfruitmoney) {
        this.orderfruitmoney = orderfruitmoney;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }
}