package com.JOVO.model;

import java.util.Date;

public class Bulletin {
    private Integer bulletinid;

    private String aid;

    private String title;

    private String releaseBegin;
    
    private String releaseEnd;

    private String content;
    
    public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	private Admin admin;

    public Integer getBulletinid() {
        return bulletinid;
    }

    public void setBulletinid(Integer bulletinid) {
        this.bulletinid = bulletinid;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getReleaseBegin() {
		return releaseBegin;
	}

	public void setReleaseBegin(String releaseBegin) {
		this.releaseBegin = releaseBegin;
	}

	public String getReleaseEnd() {
		return releaseEnd;
	}

	public void setReleaseEnd(String releaseEnd) {
		this.releaseEnd = releaseEnd;
	}

	public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}