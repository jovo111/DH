package com.JOVO.model;

public class Teacher {
    private Integer tid;

    private String tnum;

    private String tpwd;
    
    private String tname;

	public String getTname() {
		return tname;
	}

	private TeacherDetail teacherDetail;

    public TeacherDetail getTeacherDetail() {
		return teacherDetail;
	}

	public void setTeacherDetail(TeacherDetail teacherDetail) {
		this.teacherDetail = teacherDetail;
	}

	public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTnum() {
        return tnum;
    }

    public void setTnum(String tnum) {
        this.tnum = tnum == null ? null : tnum.trim();
    }

    public String getTpwd() {
        return tpwd;
    }

    public void setTpwd(String tpwd) {
        this.tpwd = tpwd == null ? null : tpwd.trim();
    }
}