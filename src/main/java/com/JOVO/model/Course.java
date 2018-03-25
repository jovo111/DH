package com.JOVO.model;

public class Course {
	private Integer cid;

	private Integer tid;

	private String cphone;

	private String cname;

	private String cinfo;

	private Integer typeid;

	private Float cprice;

	private String cphoto;

	private Integer stucount;

	private Integer count;
	
	private Integer ispass;
	
	private String createtime;

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Integer getIspass() {
		return ispass;
	}

	public void setIspass(Integer ispass) {
		this.ispass = ispass;
	}

	private CourseType courseType;

	private TeacherDetail teacherDetail;

	public Integer getStucount() {
		return stucount;
	}

	public void setStucount(Integer stucount) {
		this.stucount = stucount;
	}

	public TeacherDetail getTeacherDetail() {
		return teacherDetail;
	}

	public void setTeacherDetail(TeacherDetail teacherDetail) {
		this.teacherDetail = teacherDetail;
	}

	public CourseType getCourseType() {
		return courseType;
	}

	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
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

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone == null ? null : cphone.trim();
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}

	public String getCinfo() {
		return cinfo;
	}

	public void setCinfo(String cinfo) {
		this.cinfo = cinfo == null ? null : cinfo.trim();
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
		this.cphoto = cphoto == null ? null : cphoto.trim();
	}
}