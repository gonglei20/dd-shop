package com.qf.shop.portal.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.shop.portal.pojo.Book;
import com.qf.shop.portal.pojo.Category;
import com.qf.shop.portal.pojo.OrderItem;
import com.qf.shop.portal.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    //一级类别图书列表显示
  /* @RequestMapping(value = "/cat")
    public String cat(Book book, HttpServletRequest request){
        List<Book> findBook = bookService.findBookByPid(book);

        List<Category> findCategory = bookService.findCategory(book);
        Category oneCategory = (Category) bookService.findOneCategory(book);
        request.setAttribute("findBook",findBook);
        request.setAttribute("findCategory",findCategory);
        request.setAttribute("oneCategory",oneCategory);
        return "proIndex";
    }*/
    @RequestMapping( "/cat")
    public String cat(@RequestParam(value="pn", defaultValue="1")Integer pn, Book book, HttpServletRequest request){
        //在查询之前只需要调用。传入页码，以及每页大小
        PageHelper.startPage(pn,20);
        List<Book> findBook = bookService.findBookByPid(book);
        //pageInfo包装查询后的结果，只需要将pageINfo交给页面
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(findBook,5);

        List<Category> findCategory = bookService.findCategory(book);
        Category oneCategory = (Category) bookService.findOneCategory(book);
        //查询一级类目
        Category oneCategoryForPage = (Category) bookService.findOneCategoryForPage(book);
        request.setAttribute("oneCategoryForPage",oneCategoryForPage);

        request.setAttribute("pageInfo",page);
        request.setAttribute("findCategory",findCategory);
        request.setAttribute("oneCategory",oneCategory);
        return "proIndex";
    }

  /*  //二级类别图书列表显示
   @RequestMapping(value = "/listCat")
    public String listCat(Book book, HttpServletRequest request){
       List<Book> findBook = bookService.findBookByCid(book);
        request.setAttribute("findBook",findBook);
        return "proIndex";
    }*/

    //二级类别图书列表显示
    @RequestMapping(value = "/listCat")
    public String listCat(@RequestParam(value="pn", defaultValue="1")Integer pn,Book book, HttpServletRequest request){
        PageHelper.startPage(pn,20);
        List<Book> findBook = bookService.findBookByCid(book);
        PageInfo page = new PageInfo(findBook,5);
        request.setAttribute("pageInfo",page);
        //查询二级类目
        Category twoCategoryForPage = (Category) bookService.findTneCategoryForPage(book);
        request.setAttribute("twoCategoryForPage",twoCategoryForPage);

        //request.setAttribute("findBook",findBook);
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
        return "index";
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
   public String findSearch(@RequestParam(value="pn", defaultValue="1")Integer pn,Book book, HttpServletRequest request){
       PageHelper.startPage(pn,20);
       List<Book> result =  bookService.findBookBySearch(book);
       PageInfo page = new PageInfo(result,5);
       request.setAttribute("pageInfo",page);

       //request.setAttribute("findBook",result);
       return "/proIndex";
   }


}
