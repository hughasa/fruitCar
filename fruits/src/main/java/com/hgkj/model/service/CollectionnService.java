package com.hgkj.model.service;

import com.hgkj.model.entity.Collectionn;
import com.hgkj.model.entity.Customer;

import java.util.List;

public interface CollectionnService {
    List<Collectionn> allcollectionnservice(Collectionn collectionn);
    List<Collectionn> allfycollectionnservice(Collectionn collectionn,int pageIndex,int pagesize);
    int addcollectionnservice(Collectionn collectionn);
    int deletecollectionnservice(Collectionn collectionn);
    Collectionn onecollectionnservice(Collectionn collectionn);
}