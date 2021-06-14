package com.hgkj.model.service;

import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Orders;

import java.util.List;

public interface OrdersService {
    List<Orders> allordersservice(int pageIndex,int pagesize);
    int addorderservice(Orders orders);
    int deleteordersservice(Orders orders);
    int updateordersservice(Orders orders);
    Orders oneordersservice(Orders orders);
}