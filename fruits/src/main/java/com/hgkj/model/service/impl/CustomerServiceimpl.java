package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CustomerMapper;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerServiceimpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    public void setCustomerMapper(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    @Override
    public int addcustomerservice(Customer customer) {
        return customerMapper.addcustomer(customer);
    }

    @Override
    public Customer Logincustomerservice(Customer customer) {
        return customerMapper.Logincustomer(customer);
    }

    @Override
    public int updatecustomerservice(Customer customer) {
        return customerMapper.updatecustomer(customer);
    }
}