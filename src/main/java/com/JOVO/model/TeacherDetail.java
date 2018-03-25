package com.JOVO.model;

public class TeacherDetail {
    private Integer tid;
    
    private String tname;
    
	private String tphoto;

    public String getTbalance() {
		return tbalance;
	}

	public void setTbalance(String tbalance) {
		this.tbalance = tbalance;
	}

	private String tphone;

    private String tinfo;

    private String tsource;
    
    private String tbalance;
    
    private String ispass;

    public String getIspass() {
		return ispass;
	}

	public void setIspass(String ispass) {
		this.ispass = ispass;
	}

	public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

	public String getTphoto() {
		return tphoto;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone == null ? null : tphone.trim();
    }

    public String getTinfo() {
        return tinfo;
    }

    public void setTinfo(String tinfo) {
        this.tinfo = tinfo == null ? null : tinfo.trim();
    }

    public String getTsource() {
        return tsource;
    }

    public void setTsource(String tsource) {
        this.tsource = tsource == null ? null : tsource.trim();
    }
    
    public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}
}