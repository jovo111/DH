package com.JOVO.model;

import java.util.Date;

public class MyCourse {
    private Integer mid;

    private Integer sid;

    private Integer cid;

    private String begin;

    private Float progress;
    
    private Course course;

    private Student student;
    
    private StudentDetail studentDetail;
    
    public StudentDetail getStudentDetail() {
		return studentDetail;
	}

	public void setStudentDetail(StudentDetail studentDetail) {
		this.studentDetail = studentDetail;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getBegin() {
        return begin;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public Float getProgress() {
        return progress;
    }

    public void setProgress(Float progress) {
        this.progress = progress;
    }
}