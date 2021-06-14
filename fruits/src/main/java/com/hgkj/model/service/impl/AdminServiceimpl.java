package com.hgkj.model.service.impl;

import com.hgkj.model.dao.AdminMapper;
import com.hgkj.model.entity.Admin;
import com.hgkj.model.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceimpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin Loginadminservice(Admin admin) {
        return adminMapper.Loginadmin(admin);
    }
}