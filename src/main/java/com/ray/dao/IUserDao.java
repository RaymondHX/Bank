package com.ray.dao;

import com.ray.domain.User;

import java.util.List;

public interface IUserDao {
//    public List<User> findAll();
    public User findUser(String username, String password);

    public double userBalance(String username, String password);

    public boolean transfer (String from,String to,double money);

    public boolean signupUser(String username,String password,String salt);

    public String getSalt(String username);
}
