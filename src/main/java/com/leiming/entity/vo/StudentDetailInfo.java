package com.leiming.entity.vo;

import java.util.List;

public class StudentDetailInfo {
    private int stuNo;
    private String name;
    private int courseSum;
    private List<String> courseName;
    private int noPassSum;
    private int avgGrade;
    private int sumGrade;
    private int sumCredit;
    private int getCredit;
    private int avgXueFenJi;
    private int avgJiDian;

    public void setStuNo(int stuNo) {
        this.stuNo = stuNo;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCourseSum(int courseSum) {
        this.courseSum = courseSum;
    }

    public void setCourseName(List<String> courseName) {
        this.courseName = courseName;
    }

    public void setNoPassSum(int noPassSum) {
        this.noPassSum = noPassSum;
    }

    public void setAvgGrade(int avgGrade) {
        this.avgGrade = avgGrade;
    }

    public void setSumGrade(int sumGrade) {
        this.sumGrade = sumGrade;
    }

    public void setSumCredit(int sumCredit) {
        this.sumCredit = sumCredit;
    }

    public void setGetCredit(int getCredit) {
        this.getCredit = getCredit;
    }

    public void setAvgXueFenJi(int avgXueFenJi) {
        this.avgXueFenJi = avgXueFenJi;
    }

    public void setAvgJiDian(int avgJiDian) {
        this.avgJiDian = avgJiDian;
    }

    public int getStuNo() {
        return stuNo;
    }

    public String getName() {
        return name;
    }

    public int getCourseSum() {
        return courseSum;
    }

    public List<String> getCourseName() {
        return courseName;
    }

    public int getNoPassSum() {
        return noPassSum;
    }

    public int getAvgGrade() {
        return avgGrade;
    }

    public int getSumGrade() {
        return sumGrade;
    }

    public int getSumCredit() {
        return sumCredit;
    }

    public int getGetCredit() {
        return getCredit;
    }

    public int getAvgXueFenJi() {
        return avgXueFenJi;
    }

    public int getAvgJiDian() {
        return avgJiDian;
    }
}
