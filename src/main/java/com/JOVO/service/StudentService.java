package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.StudentDetailMapper;
import com.JOVO.dao.StudentMapper;
import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;

@Service
public class StudentService {
	@Autowired
	StudentMapper studentMapper;

	@Autowired
	StudentDetailMapper studentDetailMapper;

	public List<Student> getAll() {
		return studentMapper.select();
	}

	public List<Student> queryAll(String example) {
		return studentMapper.selectByExample(example);
	}

	public int insertStudent(Student record) {
		
		return studentMapper.insert(record);
	}

	public int insertStudentDetail(StudentDetail record) {
		return studentDetailMapper.insert(record);
	}

	public int updateStudent(Student record) {
		return studentMapper.update(record);
	}

	public int updateStudentDetail(StudentDetail record) {
		return studentDetailMapper.update(record);
	}

	public int deleteStudent(int sid) {
		return studentMapper.deleteStudent(sid);
	}
	
	public Student selectOne(int sid){
		return studentMapper.selectOne(sid);
	}
	
}
