package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtCourseTypeMapper;
import com.JOVO.model.CourseType;


@Service
public class qtCourseTypeService {
	
	@Autowired
	qtCourseTypeMapper courseTypeMapper;
	
	public List<CourseType> courses(){
		return courseTypeMapper.courses();
	}
	
	public List<CourseType> courseTypes(Integer baseid){
		return courseTypeMapper.courseTypes(baseid);
	}
	
	public List<CourseType> selectAll(){
		return courseTypeMapper.selectAll();
	}
}
