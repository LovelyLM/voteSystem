package com.leiming.entity;

import java.util.Date;

public class Course {
    private int id;
    private String courseName;
    private int credit;
    private int period;

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", courseName='" + courseName + '\'' +
                ", credit=" + credit +
                ", period=" + period +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getCourseName() {
        return courseName;
    }

    public int getCredit() {
        return credit;
    }

    public int getPeriod() {
        return period;
    }

    public Course() {
    }

    public Course(int id, String courseName, int credit, int period) {
        this.id = id;
        this.courseName = courseName;
        this.credit = credit;
        this.period = period;
    }
}
