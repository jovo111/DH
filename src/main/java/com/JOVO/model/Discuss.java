package com.JOVO.model;

import java.util.Date;

public class Discuss {
    private Integer did;

    private Integer cid;

    private Integer sid;

    private String distime;

    private String discuss;
    
    private Student student;

    public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
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

    public String getDistime() {
        return distime;
    }

    public void setDistime(String distime) {
        this.distime = distime;
    }

    public String getDiscuss() {
        return discuss;
    }

    public void setDiscuss(String discuss) {
        this.discuss = discuss == null ? null : discuss.trim();
    }
}