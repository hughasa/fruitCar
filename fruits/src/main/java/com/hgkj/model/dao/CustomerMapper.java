package com.hgkj.model.dao;

import com.hgkj.model.entity.Customer;

public interface CustomerMapper {
    int addcustomer(Customer customer);
    Customer Logincustomer(Customer customer);
    int updatecustomer(Customer customer);
}