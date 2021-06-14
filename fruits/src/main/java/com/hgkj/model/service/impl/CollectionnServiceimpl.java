package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CollectionnMapper;
import com.hgkj.model.entity.Collectionn;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CollectionnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CollectionnServiceimpl implements CollectionnService {
    @Autowired
    private CollectionnMapper collectionnMapper;

    public void setCollectionnMapper(CollectionnMapper collectionnMapper) {
        this.collectionnMapper = collectionnMapper;
    }

    @Override
    public List<Collectionn> allcollectionnservice(Collectionn collectionn) {
        return collectionnMapper.allcollectionn(collectionn);
    }

    @Override
    public List<Collectionn> allfycollectionnservice(Collectionn collectionn, int pageIndex, int pagesize) {
        return collectionnMapper.allfycollectionn(collectionn,pageIndex,pagesize);
    }

    @Override
    public int addcollectionnservice(Collectionn collectionn) {
        return collectionnMapper.addcollectionn(collectionn);
    }

    @Override
    public int deletecollectionnservice(Collectionn collectionn) {
        return collectionnMapper.deletecollectionn(collectionn);
    }

    @Override
    public Collectionn onecollectionnservice(Collectionn collectionn) {
        return collectionnMapper.onecollectionn(collectionn);
    }
}