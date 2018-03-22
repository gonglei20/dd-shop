package com.qf.shop.service;

import com.qf.shop.pojo.TbAdmin;

public interface IAdminService {
    //查找用户--登陆
    TbAdmin findAdmin(TbAdmin admin);
}
