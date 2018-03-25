package com.JOVO.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Course;

public interface AuditCourseMapper {
	
	int delete(@Param("cid") Integer courseid);
	
	int update(Course auditCourse);
	
	List<Course> selectAll();
	
	Course selectOne(@Param("cid") Integer courseid);
}
