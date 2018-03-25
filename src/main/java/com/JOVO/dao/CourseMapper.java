package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Course;

public interface CourseMapper {

	int delete(int cid);

	int insert(Course record);

	List<Course> select();

	int querycount(int typeid);

	int update(@Param("record") Course record);

	List<Course> selectType(int typeid);

	int selectTop(int typeid);

	String selectTopName(int typeid);

	String selectTwo(int cid);
	
	Course selectOne(int cid);
	
	List<Course> selectCourses(@Param("tid") int tid);
}