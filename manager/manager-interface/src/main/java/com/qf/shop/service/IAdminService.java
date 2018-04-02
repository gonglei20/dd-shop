package com.qf.shop.service;

import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.TbAdmin;

import java.util.List;

public interface IAdminService {
    //查找用户--登陆
    TbAdmin findAdmin(TbAdmin admin);
    //查找所有商品
    List<Book> findAllBook();
    //通过bid查找商品
    Book findBookByBid(String bid);
}
