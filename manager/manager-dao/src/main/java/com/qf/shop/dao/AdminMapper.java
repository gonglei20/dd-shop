package com.qf.shop.dao;

import com.qf.shop.pojo.TbAdmin;

public interface AdminMapper {
    //查找用户--登陆
    TbAdmin findAdmin(TbAdmin admin);
}
