package com.JOVO.model;

public class CourseInfo {
	private Integer cid;
	private Integer tid;
	private String cname;
	private String cinfo;
	private Integer typeid;
	private Float cprice;
	private String cphoto;
	private Integer stucount;
	private TeacherDetail teacherdetail;
	private Task task;
	private MyCourse mycourse;
	private StudentDetail studentdetail;
	private Discuss discussinfo;

	public Discuss getDiscussinfo() {
		return discussinfo;
	}

	public void setDiscussinfo(Discuss discussinfo) {
		this.discussinfo = discussinfo;
	}

	public StudentDetail getStudentdetail() {
		return studentdetail;
	}

	public void setStudentdetail(StudentDetail studentdetail) {
		this.studentdetail = studentdetail;
	}

	public MyCourse getMycourse() {
		return mycourse;
	}

	public void setMycourse(MyCourse mycourse) {
		this.mycourse = mycourse;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public TeacherDetail getTeacherdetail() {
		return teacherdetail;
	}

	public void setTeacherdetail(TeacherDetail teacherdetail) {
		this.teacherdetail = teacherdetail;
	}

	public Integer getJoinnum() {
		return stucount;
	}

	public void setJoinnum(Integer stucount) {
		this.stucount = stucount;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCinfo() {
		return cinfo;
	}

	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public Float getCprice() {
		return cprice;
	}

	public void setCprice(Float cprice) {
		this.cprice = cprice;
	}

	public String getCphoto() {
		return cphoto;
	}

	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

}
