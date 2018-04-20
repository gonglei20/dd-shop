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

    //查询二级类目下的图书
    List<Book> findBookByCid(Book book);

    //通过Bid查询商品（用于商品详情页）
    Book findBookByBid(Book book);

    //购物车实现
    Book findBookByBidForCar(Book book);

    //按找销量排序
    List<Book> findBookOrderBySell();

    //按找价格排序
    List<Book> findBookOrderByPrice();

    //商品搜索
    List<Book> findBookBySearch(Book book);
}
