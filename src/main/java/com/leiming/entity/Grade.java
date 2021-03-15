package com.leiming.entity;

/**
 * @author 10796
 */
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

    public Grade() {
    }

    public Grade(int id, int courseId, int grade) {
        this.id = id;
        this.courseId = courseId;
        this.grade = grade;
    }
}
