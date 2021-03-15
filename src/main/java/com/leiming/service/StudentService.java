package com.leiming.service;

import com.leiming.entity.Student;
import com.leiming.entity.vo.GradeVo;

import java.util.List;

public interface StudentService {
    List<Student> findAll();
    Student findById(int id);
    int deletePlayer(int id);
    Student addPlayer(Student student);
    Student updatePlayer(Student student);
    List<GradeVo> selectAllGrade();
}
