package com.JOVO.service.face;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtAuditCourseMapper;
import com.JOVO.model.Course;

@Service
public class qtAuditCourseService {
	@Autowired
	qtAuditCourseMapper auditCourseMapper;
	
	public int insert(Course auditCourse){
		return auditCourseMapper.insert(auditCourse);
	}
	
	public int update(Course auditCourse){
		return auditCourseMapper.update(auditCourse);
	}
}
