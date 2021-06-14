package com.hgkj.model.service;

import com.hgkj.model.entity.Goods;
import com.hgkj.model.entity.Orderdetail;
import com.hgkj.model.entity.Orders;

public interface OrderdetailService {
    int addorderdetailservice(Orderdetail orderdetail);
    int deleteorderdetaoilservice(Orders orders);
    Orderdetail oneorderdetailservice(Goods goods);
}