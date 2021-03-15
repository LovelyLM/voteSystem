package com.leiming.mapper;

import com.leiming.entity.Course;

import java.util.List;

public interface CourseDao {
    List<Course> selectAll();
}
