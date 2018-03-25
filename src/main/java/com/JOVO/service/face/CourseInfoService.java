package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.CourseInfoMapper;
import com.JOVO.model.*; 
  
@Service
public class CourseInfoService {
	@Autowired
	CourseInfoMapper courseInfoMapper;
	 
	public  CourseInfo  selectid(int cid){
		 CourseInfo  list = courseInfoMapper.selectid(cid);
		return list;
	}
	public List<Task> stask(int cid){
		return courseInfoMapper.stask(cid);
		
	}
	public Task selectOne(int taskid){
		return courseInfoMapper.selectOne(taskid);
	}
	
	
	public List<StudentDetail> students(int cid){
		return courseInfoMapper.students(cid);
	}
	public List<Discuss> discussinfos(int cid){
		return courseInfoMapper.discussinfos(cid);
	}
	
	public int insert(Discuss discuss){
		return courseInfoMapper.insert(discuss);
	}
}

