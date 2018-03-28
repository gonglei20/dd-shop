package com.qf.shop.portal.service.impl;

import com.qf.shop.portal.dao.BookMapper;
import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookService implements IBookService {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Book> findBookByCid(Book book) {
        return bookMapper.findBookByCid(book);
    }
}
