package com.hgkj.model.dao;

import com.hgkj.model.entity.Goods;
import com.hgkj.model.entity.Orderdetail;
import com.hgkj.model.entity.Orders;

public interface OrderdetailMapper {
    int addorderdetail(Orderdetail orderdetail);
    int deleteorderdetaoil(Orders orders);
    Orderdetail oneorderdetail(Goods goods);
}