package com.leiming.service.impl;

import com.leiming.entity.Admin;
import com.leiming.mapper.AdminDao;
import com.leiming.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    public Admin login(String username) {
        return adminDao.login(username);
    }
}
