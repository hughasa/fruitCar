package com.hgkj.model.entity;

import java.sql.Timestamp;

public class Goods {
    private Integer goodsid;

    private Timestamp goodscreatetime;

    private String goodsname;

    private Double goodsprice;

    private String goodsinfo;

    private String goodspic;

    private Integer teambuy;

    private Double teambuyprice;

    private Timestamp begintime;

    private Timestamp endtime;

    private Integer pointbuy;

    private Integer pointbuyprice;

    private Integer goodssales;

    private Integer goodsinventory;

    private Integer goodstypeid;

    private String  place;

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public String getGoodsinfo() {
        return goodsinfo;
    }

    public void setGoodsinfo(String goodsinfo) {
        this.goodsinfo = goodsinfo == null ? null : goodsinfo.trim();
    }

    public String getGoodspic() {
        return goodspic;
    }

    public void setGoodspic(String goodspic) {
        this.goodspic = goodspic == null ? null : goodspic.trim();
    }

    public Integer getTeambuy() {
        return teambuy;
    }

    public void setTeambuy(Integer teambuy) {
        this.teambuy = teambuy;
    }

    public Double getTeambuyprice() {
        return teambuyprice;
    }

    public void setTeambuyprice(Double teambuyprice) {
        this.teambuyprice = teambuyprice;
    }

    public Integer getPointbuy() {
        return pointbuy;
    }

    public void setPointbuy(Integer pointbuy) {
        this.pointbuy = pointbuy;
    }

    public Integer getPointbuyprice() {
        return pointbuyprice;
    }

    public void setPointbuyprice(Integer pointbuyprice) {
        this.pointbuyprice = pointbuyprice;
    }

    public Integer getGoodssales() {
        return goodssales;
    }

    public void setGoodssales(Integer goodssales) {
        this.goodssales = goodssales;
    }

    public Integer getGoodsinventory() {
        return goodsinventory;
    }

    public void setGoodsinventory(Integer goodsinventory) {
        this.goodsinventory = goodsinventory;
    }

    public Integer getGoodstypeid() {
        return goodstypeid;
    }

    public void setGoodstypeid(Integer goodstypeid) {
        this.goodstypeid = goodstypeid;
    }

    public void setGoodscreatetime(Timestamp goodscreatetime) {
        this.goodscreatetime = goodscreatetime;
    }

    public void setBegintime(Timestamp begintime) {
        this.begintime = begintime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public Timestamp getGoodscreatetime() {
        return goodscreatetime;
    }

    public Timestamp getBegintime() {
        return begintime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

}