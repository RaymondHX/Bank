package com.ray.service;

import com.ray.domain.User;

import java.util.List;

public interface IUserService {



    public User findUser(User user);

    public int userBalance(User user);

    public boolean transfer(String from,String to,double money);

    public boolean signupUser(String username,String password);
}