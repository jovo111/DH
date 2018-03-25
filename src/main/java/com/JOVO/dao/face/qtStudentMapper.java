package com.JOVO.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;

public interface qtStudentMapper {
    Student myDetails(int sid);

	Student getOne(@Param("snum") String snum);
	
	StudentDetail selectOne(@Param("sid") int sid);
	
	List<StudentDetail> students(@Param("tid") int tid);
}