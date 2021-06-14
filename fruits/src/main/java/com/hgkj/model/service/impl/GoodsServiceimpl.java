package com.hgkj.model.service.impl;

import com.hgkj.model.dao.GoodsMapper;
import com.hgkj.model.entity.Goods;
import com.hgkj.model.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodsServiceimpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    public List<Goods> allcuxiaogoodsservice(Goods goods) {
        return goodsMapper.allcuxiaogoods(goods);
    }

    @Override
    public List<Goods> allfygoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.allfygoods(goods,pageIndex,pagesize);
    }

    @Override
    public List<Goods> allxlgoodsservice(Goods goods) {
        return goodsMapper.allxlgoods(goods);
    }

    @Override
    public List<Goods> alllikegoodsservice(Goods goods,int pageIndex,int pagesize) {
        return goodsMapper.alllikegoods(goods,pageIndex,pagesize);
    }

    @Override
    public List<Goods> alltggoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.alltggoods(goods,pageIndex,pagesize);
    }

    @Override
    public Goods onegoodsservice(Goods goods) {
        return goodsMapper.onegoods(goods);
    }

    @Override
    public List<Goods> alljfgoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.alljfgoods(goods,pageIndex,pagesize);
    }

    @Override
    public List<Goods> alltglikegoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.alltglikegoods(goods,pageIndex,pagesize);
    }

    @Override
    public List<Goods> alljflikegoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.alljflikegoods(goods,pageIndex,pagesize);
    }

    @Override
    public int addgoodsservice(Goods goods) {
        return goodsMapper.addgoods(goods);
    }

    @Override
    public int updategoodsservice(Goods goods) {
        return goodsMapper.updategoods(goods);
    }

    @Override
    public int deletegoodsservice(Goods goods) {
        return goodsMapper.deletegoods(goods);
    }

    @Override
    public List<Goods> alladminlikegoodsservice(Goods goods, int pageIndex, int pagesize) {
        return goodsMapper.alladminlikegoods(goods,pageIndex,pagesize);
    }
}