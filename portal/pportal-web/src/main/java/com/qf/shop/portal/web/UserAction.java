package com.qf.shop.portal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAction {
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }
}
