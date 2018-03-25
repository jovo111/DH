package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Teacher;

public interface TeacherMapper {

    int deleteTeacher(int tid);

    int insert(Teacher record);
    
    List<Teacher> select();

    List<Teacher> selectByExample(@Param("example") String example);

    int updateByExample(@Param("record") Teacher record);
    
    int update(@Param("record") Teacher record);

	Teacher selectOne(int tid);
	
}