package com.qf.shop.portal.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProductAction {
    @Autowired
    private IBookService bookService;

    //各个类别图书列表显示
   @RequestMapping(value = "/cat")
    public String cat(Book book, HttpServletRequest request){
        List<Book> findBook = bookService.findBookByPid(book);
        List<Category> findCategory = bookService.findCategory(book);
        Category oneCategory = (Category) bookService.findOneCategory(book);
        request.setAttribute("findBook",findBook);
        request.setAttribute("findCategory",findCategory);
        request.setAttribute("oneCategory",oneCategory);
        return "proIndex";
    }

    //各个类别图书列表显示
   @RequestMapping(value = "/listCat")
    public String listCat(Book book, HttpServletRequest request){
       List<Book> findBook = bookService.findBookByCid(book);
        request.setAttribute("findBook",findBook);
        return "proIndex";
    }

    //商品详情页
    @RequestMapping(value = "/proInfo")
    public String proInfo(Book book, HttpServletRequest request){

       Book findOneBook = bookService.findBookByBid(book);
        request.setAttribute("findOneBook",findOneBook);
        return "proInfo";
    }

}
