package com.qf.shop.portal.service;

import com.qf.shop.portal.pojo.User;

public interface IUserService {
    //用户登陆
    User findUserByNameAndPass(User user);

    //用户注册
    int saveUser(User user);

    //提交个人信息
    void updateUser(User user);
}
