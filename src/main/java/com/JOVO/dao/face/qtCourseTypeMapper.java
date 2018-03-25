package com.JOVO.dao.face;

import com.JOVO.model.CourseType;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface qtCourseTypeMapper {
    
	List<CourseType> courses();
	
	List<CourseType> courseTypes(@Param("baseid") Integer baseid);
	
	List<CourseType> selectAll();
}