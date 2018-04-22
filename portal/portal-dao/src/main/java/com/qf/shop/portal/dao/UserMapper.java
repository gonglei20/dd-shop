package com.qf.shop.portal.dao;


import com.qf.shop.portal.pojo.*;

public interface UserMapper {
    //用户登陆
    User findUserByNameAndPass(User user);
    //用户注册
    int saveUser(User user);
    //提交个人信息
    void updateUser(User user);
}
