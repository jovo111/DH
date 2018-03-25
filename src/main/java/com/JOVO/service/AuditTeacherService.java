package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.AuditTeacherMapper;
import com.JOVO.model.Teacher;

@Service
public class AuditTeacherService {
	@Autowired
	AuditTeacherMapper auditTeacherMapper;
	
	public List<Teacher> selectAll()
	{
		return auditTeacherMapper.selectAll();
	}
}
