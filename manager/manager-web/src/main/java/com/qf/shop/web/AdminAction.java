package com.qf.shop.web;

import com.qf.shop.pojo.TbAdmin;
import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/admin")
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



}
