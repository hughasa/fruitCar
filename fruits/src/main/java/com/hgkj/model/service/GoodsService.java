package com.hgkj.model.service;

import com.hgkj.model.entity.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> allcuxiaogoodsservice(Goods goods);
    List<Goods> allfygoodsservice(Goods goods,int pageIndex,int pagesize);
    List<Goods> allxlgoodsservice(Goods goods);
    List<Goods> alllikegoodsservice(Goods goods,int pageIndex,int pagesize);
    List<Goods> alltggoodsservice(Goods goods,int pageIndex,int pagesize);
    Goods onegoodsservice(Goods goods);
    List<Goods> alljfgoodsservice(Goods goods,int pageIndex,int pagesize);
    List<Goods> alltglikegoodsservice(Goods goods,int pageIndex,int pagesize);
    List<Goods> alljflikegoodsservice(Goods goods,int pageIndex,int pagesize);
    int addgoodsservice(Goods goods);
    int updategoodsservice(Goods goods);
    int deletegoodsservice(Goods goods);
    List<Goods> alladminlikegoodsservice(Goods goods,int pageIndex,int pagesize);
}