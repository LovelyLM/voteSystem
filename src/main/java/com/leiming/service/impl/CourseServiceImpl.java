package com.leiming.service.impl;

import com.leiming.entity.Admin;
import com.leiming.entity.Course;
import com.leiming.mapper.AdminDao;
import com.leiming.mapper.CourseDao;
import com.leiming.service.AdminService;
import com.leiming.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    @Override
    public List<Course> selectAll() {
        return courseDao.selectAll();
    }
}
