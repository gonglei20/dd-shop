package com.qf.shop.service.impl;

import com.qf.shop.dao.AdminMapper;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public TbAdmin findAdmin(TbAdmin admin) {
        return adminMapper.findAdmin(admin);
    }
}
