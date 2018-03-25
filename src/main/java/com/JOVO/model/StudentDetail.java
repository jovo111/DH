package com.JOVO.model;

public class StudentDetail {
    private Integer sid;

    private String sphoto;

    private String snick;

    private Float sbalance;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSphoto() {
        return sphoto;
    }

    public void setSphoto(String sphoto) {
        this.sphoto = sphoto == null ? null : sphoto.trim();
    }

    public String getSnick() {
        return snick;
    }

    public void setSnick(String snick) {
        this.snick = snick == null ? null : snick.trim();
    }

    public Float getSbalance() {
        return sbalance;
    }

    public void setSbalance(Float sbalance) {
        this.sbalance = sbalance;
    }
}