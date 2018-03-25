package com.JOVO.model;

public class Student {
    private Integer sid;

    private String snum;

    private String spwd;
    
    private StudentDetail studentDetail;
    
    private String stunick;
    
    private String stuid;
    

	private String stuphoto;


	public StudentDetail getStudentDetail() {
		return studentDetail;
	}

	public void setStudentDetail(StudentDetail studentDetail) {
		this.studentDetail = studentDetail;
	}

	public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum == null ? null : snum.trim();
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd == null ? null : spwd.trim();
    }
    
    public String getStunick(){
		return studentDetail.getSnick();
    }

	public Integer getStuid() {
		return studentDetail.getSid();
	}
	
	public String getStuphoto() {
		return studentDetail.getSphoto();
	}
}