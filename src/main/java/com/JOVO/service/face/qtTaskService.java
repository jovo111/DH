package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtTaskMapper;
import com.JOVO.model.Task;

@Service
public class qtTaskService {

	@Autowired
	qtTaskMapper taskMapper;
	
	public List<Task> courseTask(int cid){
		return taskMapper.courseTask(cid);
	}
	
	public Long taskCount(int cid){
		return taskMapper.taskCount(cid);
	}
	
}
