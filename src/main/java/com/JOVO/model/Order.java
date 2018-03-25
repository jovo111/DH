package com.JOVO.model;

public class Order {
	private Integer oid;

	private Integer cid;

	private Integer sid;

	private String otime;

	private Integer isbuy;

	private Course course;

	private Student student;

	private StudentDetail studentDetail;

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public StudentDetail getStudentDetail() {
		return studentDetail;
	}

	public void setStudentDetail(StudentDetail studentDetail) {
		this.studentDetail = studentDetail;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getOtime() {
		return otime;
	}

	public void setOtime(String otime) {
		this.otime = otime;
	}

	public Integer getIsbuy() {
		return isbuy;
	}

	public void setIsbuy(Integer isbuy) {
		this.isbuy = isbuy;
	}
}