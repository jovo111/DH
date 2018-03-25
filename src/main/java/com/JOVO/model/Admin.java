package com.JOVO.model;

public class Admin {
    private String aid;

    private String aname;

    private String apwd;
    
    private String aphoto;

    public String getAphoto() {
		return aphoto;
	}

	public void setAphoto(String aphoto) {
		this.aphoto = aphoto;
	}

	public String getAid() {
        return aid;
    }

    public Admin(String aid,String aname, String apwd) {
    	this.aid=aid;
		this.aname = aname;
		this.apwd = apwd;
	}
    
    public Admin(String aid,String apwd) {
    	this.aid=aid;
		this.apwd = apwd;
	}

	public Admin() {
	}

	public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd == null ? null : apwd.trim();
    }
}