package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.MyCourseMapper;
import com.JOVO.model.MyCourse;

@Service
public class MyCourseService {

	@Autowired
	MyCourseMapper myCourseMapper;
	
	public List<MyCourse> getAll(int sid){
		return myCourseMapper.selectByExample(sid);
	}
	
	public Long courseCount(int cid){
		return myCourseMapper.courseCount(cid);
	}
	
}
