package com.qf.shop.portal.service.impl;

import com.qf.shop.portal.dao.UserMapper;
import com.qf.shop.portal.pojo.User;
import com.qf.shop.portal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserMapper userMapper;

    //用户登陆
    @Override
    public User findUserByNameAndPass(User user) {
       return userMapper.findUserByNameAndPass(user);
    }

    //用户注册
    @Override
    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }

    //提交个人信息
    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }
}
