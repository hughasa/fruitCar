package com.hgkj.model.dao;

import com.hgkj.model.entity.Goods;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {
    List<Goods> allcuxiaogoods(Goods goods);
    List<Goods> allfygoods(Goods goods,int pageIndex,int pagesize);
    List<Goods> allxlgoods(Goods goods);
    List<Goods> alllikegoods(Goods goods,int pageIndex,int pagesize);
    List<Goods> alltggoods(Goods goods,int pageIndex,int pagesize);
    Goods onegoods(Goods goods);
    List<Goods> alljfgoods(Goods goods,int pageIndex,int pagesize);
    List<Goods> alltglikegoods(Goods goods,int pageIndex,int pagesize);
    List<Goods> alljflikegoods(Goods goods,int pageIndex,int pagesize);
    int addgoods(Goods goods);
    int updategoods(Goods goods);
    int deletegoods(Goods goods);
    List<Goods> alladminlikegoods( @Param("goods")Goods goods, @Param("pageIndex") int pageIndex,@Param("pagesize") int pagesize);
}