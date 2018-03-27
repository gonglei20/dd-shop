package com.qf.shop.portal.dao;


import com.qf.shop.portal.pojo.*;

public interface UserMapper {
    User findUserByNameAndPass(User user);
}
