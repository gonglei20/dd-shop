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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProductAction {
    @Autowired
    private IBookService bookService;
    @RequestMapping(value = "/computer")
    public String computer(Book book, HttpServletRequest request){
        List<Book> findBook = bookService.findBookByPid(book);
        List<Category> findCategory = bookService.findCategory(book);
        Category oneCategory = (Category) bookService.findOneCategory(book);
        request.setAttribute("findBook",findBook);
        request.setAttribute("findCategory",findCategory);
        request.setAttribute("oneCategory",oneCategory);
        return "proIndex";
    }
}
