package com.qf.shop.service;

import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.Category;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.pojo.User;
import com.qf.shop.pojo.dto.BookDTO;

import java.util.List;

public interface IAdminService {
    //查找用户--登陆
    TbAdmin findAdmin(TbAdmin admin);
    //查找所有商品
    List<BookDTO> findAllBook();
    //通过bid查找商品
    Book findBookByBid(String bid);
    //通过bid删除单个商品(逻辑删除，进入回收站)
    void deleteProduct(String bid);
    //分类管理
    //查询分类
    List<Category> findCategory();
    //通过cid修改分类信息
    Category editCategoryByCid(Integer cid);
    //用户管理
    List<User> findAllUser();
}
