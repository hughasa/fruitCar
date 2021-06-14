package com.hgkj.model.service;

import com.hgkj.model.entity.Address;
import com.hgkj.model.entity.Customer;

import java.util.List;

public interface AddressService {
    List<Address> alladdressservice(Customer customer);
    int updateaddressservice(Address address);
    int addaddressservice(Address address);
    int deleteaddressservice(Address address);
    Address oneaddressservice(Address address);
}