package com.ray.service;

import com.ray.domain.Detail;

import java.util.List;

public interface IDetailService {
    public void addInfo(String username, double in, double out);

    public List<Detail> allDetails(String username);
}
