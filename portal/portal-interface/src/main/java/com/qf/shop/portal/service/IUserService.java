package com.qf.shop.portal.service;

import com.qf.shop.portal.pojo.User;

public interface IUserService {
    User findUserByNameAndPass(User user);
}
