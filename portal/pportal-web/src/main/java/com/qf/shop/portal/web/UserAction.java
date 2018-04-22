package com.qf.shop.portal.web;


import com.qf.shop.portal.pojo.User;
import com.qf.shop.portal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UserAction {
    @Autowired
   private IUserService userService;

    @RequestMapping(value = "/{page}",method = RequestMethod.GET)
    public String forwordOne(@PathVariable String page){
        return page;
    }

    //用户登陆
    @RequestMapping(value = "/checkLogin",produces="plain/text;charset=UTF-8")
    @ResponseBody
    public String checkLogin(User user, HttpSession session, HttpServletResponse response) throws IOException {
        User findUser = userService.findUserByNameAndPass(user);
        if(findUser!=null){
            System.out.println("succ");
            session.setAttribute("user",findUser);
            return "1";
        }else{
            System.out.println("fail");
            return "0";
        }
    }

    //用户注销
    @RequestMapping(value = "/logout")
    public String logout(User user, HttpSession session){
        session.invalidate();
        return "redirect:index";
    }

    //用户注册
    @RequestMapping(value = "/checkRegister")
    public String toRegister(User user, HttpSession session){
       int i = userService.saveUser(user);
       if (i!=0){
           return "login";
       }else{
           return "register";
       }
    }

    //个人中心
    @RequestMapping(value = "/myCenter")
    public String myCenter(HttpSession session){
           if (session.getAttribute("user") !=null) {
               return "myCenter";
           }else{
               return "login";
           }
    }
    //提交个人信息
    @RequestMapping(value = "/personInfo")
    public String personInfo(User user,HttpSession session){
       userService.updateUser(user);
       return "myCenter";
    }

}
