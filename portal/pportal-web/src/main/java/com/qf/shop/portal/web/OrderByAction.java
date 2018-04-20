package com.qf.shop.portal.web;

import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderByAction {
    @Autowired
    private IBookService bookService;


    //根据销量排序
    @RequestMapping(value = "/orderBySell")
    public String orderBySell( HttpServletRequest request){

       List<Book> findBook =  bookService.findBookOrderBySell();
       request.setAttribute("findBook",findBook);
        return "proIndex";
    }

    //根据销量排序
    @RequestMapping(value = "/orderByPrice")
    public String orderByPrice( HttpServletRequest request){

        List<Book> findBook =  bookService.findBookOrderByPrice();
        request.setAttribute("findBook",findBook);
        return "proIndex";
    }
}
