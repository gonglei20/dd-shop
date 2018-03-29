package com.qf.shop.portal.service.impl;

import com.qf.shop.portal.dao.BookMapper;
import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookService implements IBookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<Book> findBookByPid(Book book) {
        return bookMapper.findBookByPid(book);
    }

    //查询类目
    @Override
    public List<Category> findCategory(Book book) {
        return bookMapper.findCategory(book);
    }

    @Override
    public Category findOneCategory(Book book) {
        return bookMapper.findOneCategory(book);
    }
}
