package com.hgkj.model.service.impl;

import com.hgkj.model.dao.OrderdetailMapper;
import com.hgkj.model.entity.Goods;
import com.hgkj.model.entity.Orderdetail;
import com.hgkj.model.entity.Orders;
import com.hgkj.model.service.OrderdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderdetailServiceimpl implements OrderdetailService {
    @Autowired
    private OrderdetailMapper orderdetailMapper;

    public void setOrderdetailMapper(OrderdetailMapper orderdetailMapper) {
        this.orderdetailMapper = orderdetailMapper;
    }

    @Override
    public int addorderdetailservice(Orderdetail orderdetail) {
        return orderdetailMapper.addorderdetail(orderdetail);
    }

    @Override
    public int deleteorderdetaoilservice(Orders orders) {
        return orderdetailMapper.deleteorderdetaoil(orders);
    }

    @Override
    public Orderdetail oneorderdetailservice(Goods goods) {
        return orderdetailMapper.oneorderdetail(goods);
    }
}