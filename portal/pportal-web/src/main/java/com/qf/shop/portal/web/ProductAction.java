package com.qf.shop.portal.web;

import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductAction {
    @Autowired
    private IBookService bookService;
    @RequestMapping(value = "/computer")
    public String computer(Book book){
        System.out.println(book.getCid());

        return "proIndex";
    }
}
