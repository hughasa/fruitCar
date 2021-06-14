package com.hgkj.model.entity;

import java.sql.Timestamp;

public class Comment {
    private Integer commetid;

    private String commentcontext;

    private Timestamp commenttime;

    private Integer goodsid;

    private Integer custid;

    private Customer customer;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Integer getCommetid() {
        return commetid;
    }

    public void setCommetid(Integer commetid) {
        this.commetid = commetid;
    }

    public String getCommentcontext() {
        return commentcontext;
    }

    public void setCommentcontext(String commentcontext) {
        this.commentcontext = commentcontext == null ? null : commentcontext.trim();
    }

    public Timestamp getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(Timestamp commenttime) {
        this.commenttime = commenttime;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }
}