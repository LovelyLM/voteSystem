package com.leiming.entity.vo;

/**
 * @author LovelyLM
 * @date 2021-03-15 22:25
 */
public class GradeVo {
    private int id;
    private String courseName;
    private int credit;
    private int period;
    private int grade;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
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

    public void setGrade(int grade) {
        this.grade = grade;
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

    public int getGrade() {
        return grade;
    }
}
