package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.TeacherMapper;
import com.JOVO.dao.CourseMapper;
import com.JOVO.dao.MyCourseMapper;
import com.JOVO.dao.TeacherDetailMapper;
import com.JOVO.model.Course;
import com.JOVO.model.MyCourse;
import com.JOVO.model.StudentDetail;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;

@Service
public class TeacherService {
	@Autowired
	TeacherMapper teacherMapper;
	
	@Autowired
	TeacherDetailMapper teacherDetailMapper;
	
	@Autowired
	MyCourseMapper myCourseMapper;
	
	@Autowired
	CourseMapper courseMapper;
	
	public List<Teacher> getAll() {
		return teacherMapper.select();
	}

	public Teacher selectOne(int tid) {
		return teacherMapper.selectOne(tid);
	}
	
	public List<Teacher> queryList(String example){
		return teacherMapper.selectByExample(example);
	}
	
	public int insertTeacher(Teacher teacher,TeacherDetail teacherDetail){
		int i = teacherMapper.insert(teacher);
		teacherDetail.setTid(teacher.getTid());
		int j = teacherDetailMapper.insert(teacherDetail);
		return i+j;
	}
	
	public int updateTeacherDetail(TeacherDetail teacherDetail){
		
		int i = teacherDetailMapper.update(teacherDetail);
		return i;
	}
	
	public int update(Teacher teacher){
		int i = teacherMapper.update(teacher);
		return i;
	}
	
	public int deleteTeacher(int tid){
		int i = teacherMapper.deleteTeacher(tid);
		return i;
	}
	
	public List<MyCourse> students(int tid){
		return myCourseMapper.selectStudents(tid);
	}
	
	public List<Course> courses(int tid){
		return courseMapper.selectCourses(tid);
	}

}
