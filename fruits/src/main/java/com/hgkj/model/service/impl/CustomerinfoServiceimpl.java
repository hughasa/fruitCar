package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CustomerinfoMapper;
import com.hgkj.model.entity.Customerinfo;
import com.hgkj.model.service.CustomerinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerinfoServiceimpl implements CustomerinfoService {

    @Autowired
    private CustomerinfoMapper customerinfoMapper;

    public void setCustomerinfoMapper(CustomerinfoMapper customerinfoMapper) {
        this.customerinfoMapper = customerinfoMapper;
    }

    @Override
    public int addcustomerinfoservice(Customerinfo customerinfo) {
        return customerinfoMapper.addcustomerinfo(customerinfo);
    }

    @Override
    public int updatecustomerinfoservice(Customerinfo customerinfo) {
        return customerinfoMapper.updatecustomerinfo(customerinfo);
    }
}