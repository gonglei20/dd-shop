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

    @Override
    public Category findOneCategoryForPage(Book book) {
        return bookMapper.findOneCategoryForPage(book);
    }

    @Override
    public Category findTneCategoryForPage(Book book) {
        return bookMapper.findTneCategoryForPage(book);
    }

    //查询二级类目下的图书
    @Override
    public List<Book> findBookByCid(Book book) {
        return bookMapper.findBookByCid(book);
    }

    //通过Bid查询商品（用于商品详情页）
    @Override
    public Book findBookByBid(Book book) {
        return bookMapper.findBookByBid(book);
    }

    //购物车实现
    @Override
    public Book findBookByBidForCar(Book book) {
        return bookMapper.findBookByBidForCar(book);
    }

    //按照销量排序
    @Override
    public List<Book> findBookOrderBySell() {
        return bookMapper.findBookOrderBySell();
    }

    //按照价格排序
    @Override
    public List<Book> findBookOrderByPrice() {
        return bookMapper.findBookOrderByPrice();
    }

    //商品搜索
    @Override
    public List<Book> findBookBySearch(Book book) {
        return bookMapper.findBookBySearch(book);
    }
}
