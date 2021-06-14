package com.hgkj.model.dao;

import com.hgkj.model.entity.Customer;
import com.hgkj.model.entity.Orders;

import java.util.List;

public interface OrdersMapper {
    List<Orders> allorders(int pageIndex,int pagesize);
    int addorder(Orders orders);
    int deleteorders(Orders orders);
    int updateorders(Orders orders);
    Orders oneorders(Orders orders);
}