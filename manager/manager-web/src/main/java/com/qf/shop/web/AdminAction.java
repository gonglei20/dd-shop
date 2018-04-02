package com.qf.shop.web;

import com.qf.shop.pojo.Book;
import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminAction {
    @Autowired
    private IAdminService adminService;

    //管理员登陆模块
    @RequestMapping(value="/tologin",produces="plain/text;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public String login(TbAdmin admin, HttpSession session){
        TbAdmin findAdmin = adminService.findAdmin(admin);
        if(findAdmin!=null){
            session.setAttribute("findAdmin", findAdmin);
            return "1";
        }else{
            return "0";
        }
    }
    //商品管理(查找所有商品)
    @RequestMapping(value = "/productList")
    public String findAll(HttpServletRequest request) {
        List<Book> allBook = adminService.findAllBook();
        request.setAttribute("allBook",allBook);
        return "/pages/"+"productList";
    }
    //编辑商品
    @RequestMapping(value = "/editProduct")
    public String edit(String bid,HttpServletRequest request){
        Book findBookByBid = adminService.findBookByBid(bid);
        request.setAttribute("findBookByBid",findBookByBid);
        return "/pages/"+"editProduct";
    }



}
