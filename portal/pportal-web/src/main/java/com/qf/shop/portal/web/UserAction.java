package com.qf.shop.portal.web;


import com.qf.shop.portal.pojo.User;
import com.qf.shop.portal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class UserAction {
    @Autowired
   private IUserService userService;

    @RequestMapping(value = "/{page}",method = RequestMethod.GET)
    public String forwordOne(@PathVariable String page){
        return page;
    }

    //用户登陆
    @RequestMapping(value = "/checkLogin")
    public String checkLogin(User user, HttpSession session){
        User findUser = userService.findUserByNameAndPass(user);
        if(findUser!=null){
            System.out.println("succ");
            return "index";
        }else{
            System.out.println("fail");
            return "login";
        }

    }
    //用户注册
    @RequestMapping(value = "/toRegister")
    public String toRegister(User user, HttpSession session){
        User findUser = userService.findUserByNameAndPass(user);
        if(findUser!=null){
            System.out.println("succ");
        }else{
            System.out.println("fail");
        }
        return "index";
    }
}
