package com.hgkj.model.service;

import com.hgkj.model.entity.Customer;

public interface CustomerService {
    int addcustomerservice(Customer customer);
    Customer Logincustomerservice(Customer customer);
    int updatecustomerservice(Customer customer);
}