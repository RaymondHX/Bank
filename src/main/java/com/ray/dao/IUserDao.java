package com.ray.dao;

import com.ray.domain.User;

import java.util.List;

public interface IUserDao {

    /**
     * 根据用户名和密码找到用户
     * @param username 用户名
     * @param password 密码
     * @return 找到的用户，若没找到，为null
     */
    public User findUser(String username, String password);

    /**
     * 得到用户的账户余额
     * @param username 用户名
     * @param password 密码
     * @return 用户的账户余额
     */
    public double userBalance(String username, String password);

    /**
     * 转账
     * @param from 转账方
     * @param to 接收方
     * @param money 转账金额
     * @return 是否成功，true为成功，false为失败
     */
    public boolean transfer (String from,String to,double money);

    /**
     * 注册一个用户
     * @param username 用户名
     * @param password 密码
     * @param salt 盐值
     * @return 是否注册成功
     */
    public boolean signupUser(String username,String password,String salt);

    /**
     * 得到这个账户的盐值
     * @param username 用户名
     * @return 盐值
     */
    public String getSalt(String username);

    /**
     * 存钱
     * @param username 用户名
     * @param money 存入金额
     */
    public void deposit(String username, double money);

    /**
     * 扣款
     * @param username 用户名
     * @param money 扣款金额
     */
    public void  deduction(String username,double money);
}
