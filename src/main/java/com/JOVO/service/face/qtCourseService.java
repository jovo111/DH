package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtAuditCourseMapper;
import com.JOVO.dao.face.qtCourseMapper;
import com.JOVO.dao.face.qtCourseTypeMapper;
import com.JOVO.model.Course;

@Service
public class qtCourseService {

	@Autowired
	qtCourseMapper courseMapper;
	
	@Autowired
	qtCourseTypeMapper qtCourseType;
	
	@Autowired
	qtAuditCourseMapper auditCourseMapper;
	
	public List<Course> free(){
		return courseMapper.free();
	}
	
	public List<Course> pay(){
		return courseMapper.pay();
	}
	
	public List<Course> payRank()
	{
		return courseMapper.payRank();
	}
	
	public List<Course> freeRank()
	{
		return courseMapper.freeRank();
	}
	
	public List<Course> all(Integer typeid)
	{
		return courseMapper.all(typeid);
	}
	
	public List<Course> watchlist(Integer typeid)
	{
		return courseMapper.watchlist(typeid);
	}
	
	public List<Course> freelist(Integer typeid)
	{
		return courseMapper.freelist(typeid);
	}
	
	public List<Course> paylist(Integer typeid)
	{
		return courseMapper.paylist(typeid);
	}
	
	public List<Course> notMoney(String example){
		return courseMapper.notMoney(example);
	}
	
	public List<Course> isMoney(String example){
		return courseMapper.isMoney(example);
	}
	
	public List<Course> goodTeacher(){
		return courseMapper.goodTeacher();
	}
	
	public List<Course> auditCourse(int tid){
		return auditCourseMapper.auditcourses(tid);
	}

	public List<Course> selectCourse(String param) {
		return courseMapper.selectCourse(param);
	}

}
