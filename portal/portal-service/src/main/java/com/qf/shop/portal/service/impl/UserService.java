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
    @Override
    public User findUserByNameAndPass(User user) {
       return userMapper.findUserByNameAndPass(user);
    }
}
