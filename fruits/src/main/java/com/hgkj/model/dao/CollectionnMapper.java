package com.hgkj.model.dao;

import com.hgkj.model.entity.Collectionn;

import java.util.List;

public interface CollectionnMapper {
    List<Collectionn> allcollectionn(Collectionn collectionn);
    List<Collectionn> allfycollectionn(Collectionn collectionn,int pageIndex,int pagesize);
    int addcollectionn(Collectionn collectionn);
    int deletecollectionn(Collectionn collectionn);
    Collectionn onecollectionn(Collectionn collectionn);
}