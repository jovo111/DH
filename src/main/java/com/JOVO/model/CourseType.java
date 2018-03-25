package com.JOVO.model;

import java.util.List;

public class CourseType {
    private Integer typeid;

    private String typename;
    
    private List<Course> courses;

    public Integer getTypeid() {
        return typeid;
    }

    public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }
}