package com.leiming.entity;

import com.leiming.entity.vo.GradeVo;

import java.util.List;

public class Student {
    private int id;
    private int stuNo;
    private String name;
    private String className;
    private List<GradeVo> gradeVoList;
    private int noPassSum = 0;
    private double avgGrade;
    private int sumGrade;
    private int sumCredit = 0;
    private int getCredit = 0;
    private double avgXueFenJi;

    public void setNoPassSum(int noPassSum) {
        this.noPassSum = noPassSum;
    }

    public void setAvgGrade(double avgGrade) {
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

    public int getNoPassSum() {
        return noPassSum;
    }

    public double getAvgGrade() {
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

    public double getAvgXueFenJi() {
        return avgXueFenJi;
    }

    public void setGradeVoList(List<GradeVo> gradeVoList) {
        this.gradeVoList = gradeVoList;
    }

    public List<GradeVo> getGradeVoList() {
        return gradeVoList;
    }

    public Student() {
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", stuNo=" + stuNo +
                ", name='" + name + '\'' +
                ", className='" + className + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStuNo(int stuNo) {
        this.stuNo = stuNo;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getStuNo() {
        return stuNo;
    }

    public String getName() {
        return name;
    }

    public String getClassName() {
        return className;
    }

    public Student(int id, int stuNo, String name, String className) {
        this.id = id;
        this.stuNo = stuNo;
        this.name = name;
        this.className = className;
    }
}
