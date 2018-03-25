package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtTeacherMapper;
import com.JOVO.model.Course;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;

@Service
public class qtTeacherService {
	@Autowired
	qtTeacherMapper teacherMapper;

	public List<Course> selectCourse(Integer tid) {
		return teacherMapper.selectCourse(tid);
	}
	
	
	public TeacherDetail selectTeacher(Integer tid){
		return teacherMapper.selectTeacher(tid);
	}
	
	public Teacher getOne(String tnum){
		return teacherMapper.getOne(tnum);
	}
	
	public int forget(Teacher teacher){
		return teacherMapper.forget(teacher);
	}
	
	public int insertTeacher(Teacher teacher,TeacherDetail teacherDetail){
		int i = teacherMapper.insertTeacher(teacher);
		teacherDetail.setTid(teacher.getTid());
		int j = teacherMapper.insertDetail(teacherDetail);
		
		return i+j;
	}
	
	public int isExist(String tnum){
		return teacherMapper.isExist(tnum);
	}
	
	public int updateTeacher(Teacher teacher,TeacherDetail teacherDetail){
		return teacherMapper.updateTeacher(teacher,teacherDetail);
	}
}
