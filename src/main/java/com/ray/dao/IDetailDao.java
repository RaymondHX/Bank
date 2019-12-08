package com.ray.dao;

import com.ray.domain.Detail;

import java.util.List;

public interface IDetailDao {
    public void addInfo(String username, double in,double out);

    public List<Detail>  allDetails(String username);
}
