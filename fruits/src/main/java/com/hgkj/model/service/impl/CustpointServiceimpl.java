package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CustpointMapper;
import com.hgkj.model.entity.Custpoint;
import com.hgkj.model.service.CustpointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustpointServiceimpl implements CustpointService {
    @Autowired
    private CustpointMapper custpointMapper;

    public void setCustpointMapper(CustpointMapper custpointMapper) {
        this.custpointMapper = custpointMapper;
    }

    @Override
    public int addcustpointservice(Custpoint custpoint) {
        return custpointMapper.addcustpoint(custpoint);
    }

    @Override
    public int updatecustpointservice(Custpoint custpoint) {
        return custpointMapper.updatecustpoint(custpoint);
    }
}