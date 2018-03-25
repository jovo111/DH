package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.TaskMapper;
import com.JOVO.model.Task;

@Service
public class TaskService {

	@Autowired
	TaskMapper taskMapper;
	
	
	public List<Task> selectType(int cid){
		return taskMapper.selectType(cid);
	}
	
	public int insert(Task task){
		return taskMapper.insert(task);
	}
	
	public int delete(int taskid){
		return taskMapper.delete(taskid);
	}
	
	public int update(Task record){
		return taskMapper.updateByExample(record);
	}
	
	public Long taskCount(int cid){
		return taskMapper.taskCount(cid);
	}
	
	public List<Task> courseTask(int cid){
		return taskMapper.courseTask(cid);
	}
	
}

