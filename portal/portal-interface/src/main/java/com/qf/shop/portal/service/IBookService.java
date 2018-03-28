package com.qf.shop.portal.service;

import com.qf.shop.portal.pojo.Book;

import java.util.List;

public interface IBookService {
    List<Book> findBookByCid(Book book);
}
