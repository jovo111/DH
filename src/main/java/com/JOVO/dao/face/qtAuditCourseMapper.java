package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Course;

public interface qtAuditCourseMapper {
	
	List<Course> auditcourses(@Param("tid") Integer tid);
	
	int insert(Course auditCourse);
	
	int update(Course auditCourse);
}
