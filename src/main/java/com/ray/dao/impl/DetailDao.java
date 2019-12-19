package com.ray.dao.impl;

import com.ray.dao.IDetailDao;
import com.ray.domain.Detail;
import com.ray.domain.User;
import com.ray.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

public class DetailDao implements IDetailDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public void addInfo(String username, double in, double out) {
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        String time = timeStamp.toString();
        try{
            String sql = "insert into detail values (?,?,?,?)";
            int result = jdbcTemplate.update(sql,username,time,in,out);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Detail> allDetails(String username) {
        String sql = "select * from detail where username = ?";
        RowMapper<Detail> rowMapper=new BeanPropertyRowMapper<Detail>(Detail.class);
        List<Detail> details= jdbcTemplate.query(sql, rowMapper,username);

        return details;
    }


}
