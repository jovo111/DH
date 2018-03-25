package com.JOVO.service.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtStudentMapper;
import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;

@Service
public class qtStudentService {

	@Autowired
	qtStudentMapper studentMapper;

	public Student myDetails(int sid) {
		return studentMapper.myDetails(sid);
	}
	
	public Student getOne(@Param("snum") String snum){
		return studentMapper.getOne(snum);
	}
	
	public StudentDetail selectOne(int sid){
		return studentMapper.selectOne(sid);
	}
	
	public List<StudentDetail> students(int tid){
		return studentMapper.students(tid);
	}
}
