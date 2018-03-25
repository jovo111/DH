package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Course;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;

public interface qtTeacherMapper {
	List<Course> selectCourse(@Param("tid")Integer tid);
	
	TeacherDetail selectTeacher(@Param("tid")Integer tid);
	
	Teacher getOne(@Param("tnum") String tnum);
	
	int forget(Teacher teacher);
	
	int insertTeacher(Teacher teacher);
	
	int insertDetail(TeacherDetail teacherDetail);
	
	int isExist(@Param("tnum") String tnum);
	
	int updateTeacher(@Param("teacher") Teacher teacher,@Param("teacherDetail") TeacherDetail teacherDetail);
}
