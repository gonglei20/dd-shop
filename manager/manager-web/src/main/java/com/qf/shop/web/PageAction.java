package com.qf.shop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class PageAction {
//    @RequestMapping(value = "/{page}", method = RequestMethod.GET)
//    public String index(@PathVariable String page) {
//        return page;
//    }

    @RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
    public String page(@PathVariable String pageName) {
        return pageName;
    }

    @RequestMapping(value = "/{pageName1}/{pageName2}/{pageName3}", method = RequestMethod.GET)
    public String pageName1(@PathVariable String pageName3,@PathVariable String pageName2,@PathVariable String pageName1) {
        return pageName1+"/"+pageName2+"/"+pageName3;
    }
}
