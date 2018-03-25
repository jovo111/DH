package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.CourseTypeMapper;
import com.JOVO.model.CourseType;

@Service
public class CourseTypeService {
	@Autowired
	CourseTypeMapper courseTypeMapper;
	
	public List<CourseType> getAll(){
		List<CourseType> list = courseTypeMapper.getAll();
		return list;
	}
	
	public List<CourseType> getLikeAll(String typename){
		List<CourseType> list = courseTypeMapper.getLikeAll(typename);
		return list;
	}
	
	public int insertType(CourseType courseType){
		int i = courseTypeMapper.insert(courseType);
		return i;
	}
	
	public int delete(int typeid){
		int i = courseTypeMapper.delete(typeid);
		return i;
	}
	
	public int update(CourseType record){
		int i = courseTypeMapper.update(record);
		return i;
	}

	
}
