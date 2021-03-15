package com.leiming.entity;

public class Grade {

    private int id;
    private int courseId;
    private int grade;

    public void setId(int id) {
        this.id = id;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getId() {
        return id;
    }

    public int getCourseId() {
        return courseId;
    }

    public int getGrade() {
        return grade;
    }
}
