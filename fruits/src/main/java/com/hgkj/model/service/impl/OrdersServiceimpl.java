package com.hgkj.model.service.impl;

import com.hgkj.model.dao.OrdersMapper;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Orders;
import com.hgkj.model.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceimpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    public void setOrdersMapper(OrdersMapper ordersMapper) {
        this.ordersMapper = ordersMapper;
    }

    @Override
    public List<Orders> allordersservice(int pageIndex,int pagesize) {
        return ordersMapper.allorders(pageIndex,pagesize);
    }

    @Override
    public int addorderservice(Orders orders) {
        return ordersMapper.addorder(orders);
    }

    @Override
    public int deleteordersservice(Orders orders) {
        return ordersMapper.deleteorders(orders);
    }

    @Override
    public int updateordersservice(Orders orders) {
        return ordersMapper.updateorders(orders);
    }

    @Override
    public Orders oneordersservice(Orders orders) {
        return ordersMapper.oneorders(orders);
    }
}