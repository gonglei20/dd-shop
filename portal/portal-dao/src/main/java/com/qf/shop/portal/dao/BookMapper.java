package com.qf.shop.portal.dao;

import com.qf.shop.portal.pojo.Book;

import java.util.List;

public interface BookMapper {
    List<Book> findBookByCid(Book book);
}
