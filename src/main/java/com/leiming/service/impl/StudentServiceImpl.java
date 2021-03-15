package com.leiming.service.impl;

import com.leiming.entity.Student;
import com.leiming.entity.vo.GradeVo;
import com.leiming.mapper.StudentDao;
import com.leiming.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LovelyLM
 * @date 2021-03-15 21:34
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Override
    public List<Student> findAll() {
        return studentDao.findAll();
    }

    @Override
    public Student findById(int id) {
        return studentDao.findById(id);
    }

    @Override
    public int deletePlayer(int id) {
        return studentDao.deletePlayer(id);
    }

    @Override
    public Student addPlayer(Student student) {
        return studentDao.addPlayer(student);
    }

    @Override
    public Student updatePlayer(Student student) {
        return studentDao.updatePlayer(student);
    }

    @Override
    public List<GradeVo> selectAllGrade() {
        return studentDao.selectAllGrade();
    }
}
