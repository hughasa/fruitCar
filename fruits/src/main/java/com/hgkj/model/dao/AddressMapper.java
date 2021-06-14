package com.hgkj.model.dao;

import com.hgkj.model.entity.Address;
import com.hgkj.model.entity.Customer;

import java.util.List;

public interface AddressMapper {
    List<Address> alladdress(Customer customer);
    int updateaddress(Address address);
    int addaddress(Address address);
    int deleteaddress(Address address);
    Address oneaddress(Address address);
}