package com.ray.dao.impl;

import com.ray.dao.IUserDao;
import com.ray.domain.User;
import com.ray.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class UserDao implements IUserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User findUser(String username, String password) {
        try {
            String sql = "select * from account where username = ? and password = ?  ";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username, password);
//            System.out.println("查询后的结果："+user.toString());
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public double userBalance(String username, String password) {
        try{
            String sql = "select balance from account where username = ? and password = ?";
            double balance  = jdbcTemplate.queryForObject(sql, new Object[]{username,password}, Double.class);
            return balance;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public boolean transfer(String from, String to, double money) {
        try{
            String sql = "select balance from account where username = ?";
            double balance  = jdbcTemplate.queryForObject(sql, new Object[]{from}, Double.class);
            double left = balance-money;
            int num1 = jdbcTemplate.update("UPDATE account SET balance = ? WHERE username = ?", new Object[] {left, from});
            double balance2 = jdbcTemplate.queryForObject(sql, new Object[]{to}, Double.class);
            double get = balance+money;
            int num2 = jdbcTemplate.update("UPDATE account SET balance = ? WHERE username = ?", new Object[] {get, to});
            if(num1==1&&num2==1)
                return true;
            else
                return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean signupUser(String username, String password,String salt) {
        try{
            String sql = "insert into account values (?,?,?,?)";
            int result = jdbcTemplate.update(sql,username,password,0,salt);
            if(result==1)
                return true;
            else
                return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public String getSalt(String username) {
        try {
           // System.out.println("user"+username);
            String sql = "select * from account where username = ? ";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
          //  System.out.println("查询后的结果："+user.getSalt().length());
            return user.getSalt();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void deposit(String username, double money) {
        try {
            String sql = "select * from account where username = ? ";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
            double total = user.getBalance()+money;
            jdbcTemplate.update("UPDATE account SET balance = ? WHERE username = ?", new Object[] {total, username});
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deduction(String username, double money) {
        try {
            String sql = "select * from account where username = ? ";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
            double total = user.getBalance()-money;
            jdbcTemplate.update("UPDATE account SET balance = ? WHERE username = ?", new Object[] {total, username});
        }catch (Exception e){

        }
    }


}
