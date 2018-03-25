package com.JOVO.dao;

import java.util.List;

import com.JOVO.model.Task;

public interface TaskMapper {
	int insert(Task record);

	List<Task> selectType(int cid);

	int delete(int taskid);

	int updateByExample(Task record);
	
	long taskCount(int cid);
	
	List<Task> courseTask(int cid);

}
