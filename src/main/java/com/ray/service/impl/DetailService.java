package com.ray.service.impl;

import com.ray.dao.IDetailDao;
import com.ray.dao.impl.DetailDao;
import com.ray.domain.Detail;
import com.ray.service.IDetailService;

import java.util.List;

public class DetailService implements IDetailService {
    private DetailDao detailDao = new DetailDao();
    @Override
    public void addInfo(String username, double in, double out) {
        detailDao.addInfo(username,in,out);
    }

    @Override
    public List<Detail> allDetails(String username) {
        return detailDao.allDetails(username);
    }
}
