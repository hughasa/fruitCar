package com.hgkj.model.entity;

import java.sql.Timestamp;
import java.util.List;

public class Orders {
    private Integer ordersid;

    private String address;

    private Double orderstotalpage;

    private Timestamp orderscreatetime;

    private Integer invoice;

    private String ordersmessage;

    private Integer pointget;

    private Integer custid;

    private Integer paytypeid;

    private Integer orderstatetypeid;

    private Integer expressid;

    private List<Orderdetail> orderdetailList;

    private Orderstatetype orderstatetype;

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getOrderstotalpage() {
        return orderstotalpage;
    }

    public void setOrderstotalpage(Double orderstotalpage) {
        this.orderstotalpage = orderstotalpage;
    }

    public Timestamp getOrderscreatetime() {
        return orderscreatetime;
    }

    public void setOrderscreatetime(Timestamp orderscreatetime) {
        this.orderscreatetime = orderscreatetime;
    }

    public Integer getInvoice() {
        return invoice;
    }

    public void setInvoice(Integer invoice) {
        this.invoice = invoice;
    }

    public String getOrdersmessage() {
        return ordersmessage;
    }

    public void setOrdersmessage(String ordersmessage) {
        this.ordersmessage = ordersmessage;
    }

    public Integer getPointget() {
        return pointget;
    }

    public void setPointget(Integer pointget) {
        this.pointget = pointget;
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }

    public Integer getPaytypeid() {
        return paytypeid;
    }

    public void setPaytypeid(Integer paytypeid) {
        this.paytypeid = paytypeid;
    }

    public Integer getOrderstatetypeid() {
        return orderstatetypeid;
    }

    public void setOrderstatetypeid(Integer orderstatetypeid) {
        this.orderstatetypeid = orderstatetypeid;
    }

    public Integer getExpressid() {
        return expressid;
    }

    public void setExpressid(Integer expressid) {
        this.expressid = expressid;
    }

    public List<Orderdetail> getOrderdetailList() {
        return orderdetailList;
    }

    public void setOrderdetailList(List<Orderdetail> orderdetailList) {
        this.orderdetailList = orderdetailList;
    }

    public Orderstatetype getOrderstatetype() {
        return orderstatetype;
    }

    public void setOrderstatetype(Orderstatetype orderstatetype) {
        this.orderstatetype = orderstatetype;
    }
}