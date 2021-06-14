package com.hgkj.model.entity;

public class Collectionn {
    private Integer collectionid;

    private Integer goodsid;

    private Integer custid;

    private Goods goods;


    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(Integer collectionid) {
        this.collectionid = collectionid;
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