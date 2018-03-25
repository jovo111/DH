package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.CourseMapper;
import com.JOVO.dao.CourseTypeMapper;
import com.JOVO.model.Course;
import com.JOVO.model.CourseType;

@Service
public class CourseService {
	@Autowired
	CourseMapper courseMapper;
	
	
	
	public List<Course> selectType(int typeid){
		List<Course> ctype = courseMapper.selectType(typeid);
		return ctype;
	}
	
	public int queryCount(int typeid){
		return courseMapper.querycount(typeid);
	}
	
	public int selectTop(int typeid){
		return courseMapper.selectTop(typeid);
	}
	
	public String selectTopName(int typeid){
		return courseMapper.selectTopName(typeid);
	}
	
	public String selectTwo(int cid){
		return courseMapper.selectTwo(cid);
	}

	public Course selectOne(int cid){
		return courseMapper.selectOne(cid);
	}
	
}
