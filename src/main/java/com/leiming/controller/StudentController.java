package com.leiming.controller;


import com.leiming.entity.Student;
import com.leiming.entity.vo.GradeVo;
import com.leiming.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller("")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @GetMapping("index")
    public String getStudent(Model model){
        List<Student> studentList = studentService.findAll();
        List<GradeVo> gradeVos = studentService.selectAllGrade();
        Set<String> courseList = new HashSet<>();
        studentList.forEach(student -> {
            List<GradeVo> list = new ArrayList<>();

            gradeVos.forEach(gradeVo -> {
                courseList.add(gradeVo.getCourseName());
                if (gradeVo.getId() == student.getId()){
                    list.add(gradeVo);
                    student.setSumCredit(student.getSumCredit() + gradeVo.getCredit());
                    if (gradeVo.getGrade() < 60){
                        student.setNoPassSum(student.getNoPassSum() + 1);
                        gradeVo.setCredit(0);
                    }
                    student.setGetCredit(student.getGetCredit() + gradeVo.getCredit());
                }
            });
            student.setGradeVoList(list);
        });
        studentList.forEach(student -> student.setAvgGrade(new BigDecimal((float)student.getSumGrade()/courseList.size()).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
        model.addAttribute("students", studentList);
        model.addAttribute("courseList", courseList);
        return "/index2";
    }
}
