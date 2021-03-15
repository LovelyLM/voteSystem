package com.leiming.entity;

public class Student {
    private int id;
    private int stuNo;
    private String name;
    private String className;

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
