package com.ray.service.impl;

import com.ray.dao.impl.UserDao;
import com.ray.domain.User;
import com.ray.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private UserDao userDao = new UserDao();

    @Override
    public User findUser(User user) {
        return userDao.findUser(user.getUsername(),user.getPassword());
    }

    @Override
    public int userBalance(User user) {
        return 0;
    }

    @Override
    public boolean transfer(String from, String to, double money) {
        return userDao.transfer(from,to,money);
    }

    @Override
    public boolean signupUser(String username, String password,String salt) {
        return userDao.signupUser(username,password,salt);
    }

    @Override
    public String getSalt(String username) {
        return userDao.getSalt(username);
    }


}
