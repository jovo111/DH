package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.*;

public interface CourseInfoMapper {

	CourseInfo selectid(int cid);

	List<Task> stask(int cid);

	List<StudentDetail> students(int cid);

	List<Discuss> discussinfos(int cid);

	int insert(Discuss discuss);

	Task selectOne(@Param("taskid") int taskid);
}
