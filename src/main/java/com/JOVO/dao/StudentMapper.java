package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Student;

public interface StudentMapper {
    int deleteStudent(int sid);

    int insert(Student record);

    List<Student> select();
    
    List<Student> selectByExample(@Param("example") String example);

    int update(@Param("record") Student record);
    
    Student selectOne(int sid);

}