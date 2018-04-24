package com.qf.shop.service.impl;

import com.qf.shop.dao.AdminMapper;
import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.Category;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.pojo.User;
import com.qf.shop.pojo.dto.BookDTO;
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
    public List<BookDTO> findAllBook() {
        return adminMapper.findAllBook();
    }

    //通过bid查找具体商品
    @Override
    public Book findBookByBid(String bid) {
        return adminMapper.findBookByBid(bid);
    }

    //通过bid删除商品
    @Override
    public void deleteProduct(String bid) {
        adminMapper.deleteProduct(bid);
    }

    //查找所有分类信息
    @Override
    public List<Category> findCategory() {
        return adminMapper.findCategory();
    }

    //通过cid修改分类信息
    @Override
    public Category editCategoryByCid(Integer cid) {
        return adminMapper.editCategoryByCid(cid);
    }

    //用户管理
    @Override
    public List<User> findAllUser() {
        return adminMapper.findAllUser();
    }

    //用户编辑
    @Override
    public User editUser(User user) {
        return adminMapper.editUser(user);
    }

    @Override
    public void deleteUser(User user) {
        adminMapper.deleteUser(user);
    }

    @Override
    public void saveOneUser(User user) {
        adminMapper.saveOneUser(user);
    }
}
