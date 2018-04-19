package com.qf.shop.web;

import com.qf.shop.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AdminProjectAction {
    @Autowired
    private IAdminService adminService;
}
