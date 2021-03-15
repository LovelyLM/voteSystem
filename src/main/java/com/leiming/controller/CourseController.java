package com.leiming.controller;

import com.leiming.entity.Course;
import com.leiming.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @author LovelyLM
 * @date 2021-03-16 0:06
 */
@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    @GetMapping("courseList")
    public String getAllCourse(Model model){
        List<Course> course = courseService.selectAll();
        model.addAttribute("courses", course);
        return "/courses";
    }
}
