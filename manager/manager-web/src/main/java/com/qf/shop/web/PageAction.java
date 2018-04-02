package com.qf.shop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageAction {
    @RequestMapping(value = "/{page}", method = RequestMethod.GET)
    public String index(@PathVariable String page) {
       return page;
   }
}
