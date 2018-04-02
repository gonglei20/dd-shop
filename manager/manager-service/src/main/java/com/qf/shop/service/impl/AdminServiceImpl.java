package com.qf.shop.service.impl;

import com.qf.shop.dao.AdminMapper;
import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public TbAdmin findAdmin(TbAdmin admin) {
        return adminMapper.findAdmin(admin);
    }

    @Override
    public List<Book> findAllBook() {
        return adminMapper.findAllBook();
    }

    @Override
    public Book findBookByBid(String bid) {
        return adminMapper.findBookByBid(bid);
    }
}
