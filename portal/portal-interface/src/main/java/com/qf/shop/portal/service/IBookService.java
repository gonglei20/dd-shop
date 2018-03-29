package com.qf.shop.portal.service;

import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;

import java.util.List;

public interface IBookService {
    List<Book> findBookByPid(Book book);

    //查询类目
    List<Category> findCategory(Book book);
    Category findOneCategory(Book book);

}
