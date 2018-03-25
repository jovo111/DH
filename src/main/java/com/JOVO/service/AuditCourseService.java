package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.AuditCourseMapper;
import com.JOVO.model.Course;

@Service
public class AuditCourseService {
	@Autowired
	AuditCourseMapper auditCourseMapper;
	
	public List<Course> selectAll()
	{
		return auditCourseMapper.selectAll();
	}
}

