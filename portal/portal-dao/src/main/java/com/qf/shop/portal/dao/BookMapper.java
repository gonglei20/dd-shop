package com.qf.shop.portal.dao;

import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;

import java.util.List;

public interface BookMapper {
    //通过pid查询大类下的图书信息
    List<Book> findBookByPid(Book book);
    //查询类目
    List<Category> findCategory(Book book);
    Category findOneCategory(Book book);

}
