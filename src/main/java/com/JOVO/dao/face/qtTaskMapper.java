package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Task;

public interface qtTaskMapper {
	List<Task> courseTask(int cid);

	Long taskCount(int cid);

	int insert(Task task);

	Task selectOne(@Param("taskid") Integer taskid);

	Task update(Task task);

	int delete(@Param("taskid") Integer taskid);

	List<Task> tasks(@Param("cid") Integer cid);
}