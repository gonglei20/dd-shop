package com.qf.shop.portal.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;
import com.qf.shop.portal.pojo.OrderItem;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductAction {
    @Autowired
    private IBookService bookService;
    List<Book> bookList = new ArrayList<Book>();

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

    //加入购物车
    @RequestMapping(value = "/addCat")
    public String addCat(Book book, HttpServletRequest request,HttpSession session){

        if (session.getAttribute("user")!=null){


        }else{
           Book findBookByBidForCar = bookService.findBookByBidForCar(book);
           bookList.add(findBookByBidForCar);
            session.setAttribute("userCar",bookList);
        }
        return "/proInfo";
    }
   /* @RequestMapping(value = "/addCat")
    public String addCat(OrderItem orderItem, HttpServletRequest request, HttpSession session){

        if (session.getAttribute("user")!=null){


        }else{
            Book findBookByBidForCar = bookService.findBookByBidForCar(book);
            bookList.add(findBookByBidForCar);
            session.setAttribute("userCar",bookList);
        }
        return "/proInfo";
    }*/

   //商品搜索
   @RequestMapping(value = "/findSearch")
   public String findSearch(Book book, HttpServletRequest request){
       System.out.println("++++++++++");
        System.out.println(book.getBname());
       List<Book> result =  bookService.findBookBySearch(book);
       request.setAttribute("findBook",result);
       return "/proIndex";
   }


}
