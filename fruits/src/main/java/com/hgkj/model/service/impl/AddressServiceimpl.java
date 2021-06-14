package com.hgkj.model.service.impl;

import com.hgkj.model.dao.AddressMapper;
import com.hgkj.model.entity.Address;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AddressServiceimpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;

    public void setAddressMapper(AddressMapper addressMapper) {
        this.addressMapper = addressMapper;
    }

    @Override
    public List<Address> alladdressservice(Customer customer) {
        return addressMapper.alladdress(customer);
    }

    @Override
    public int updateaddressservice(Address address) {
        return addressMapper.updateaddress(address);
    }

    @Override
    public int addaddressservice(Address address) {
        return addressMapper.addaddress(address);
    }

    @Override
    public int deleteaddressservice(Address address) {
        return addressMapper.deleteaddress(address);
    }

    @Override
    public Address oneaddressservice(Address address) {
        return addressMapper.oneaddress(address);
    }
}