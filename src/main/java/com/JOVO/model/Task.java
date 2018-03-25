package com.JOVO.model;

public class Task {
    private Integer taskid;

    private Integer cid;

    private String videopath;

    private String task;

    public Task() {
	}

	public Task(Integer cid, String videopath, String task) {
		this.cid = cid;
		this.videopath = videopath;
		this.task = task;
	}

	public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getVideopath() {
        return videopath;
    }

    public void setVideopath(String videopath) {
        this.videopath = videopath == null ? null : videopath.trim();
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task == null ? null : task.trim();
    }
}