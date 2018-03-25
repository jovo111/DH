package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.StudentDetail;
import com.JOVO.model.TeacherDetail;

public interface StudentDetailMapper {
    int insert(StudentDetail record);

    List<StudentDetail> select();
    
    StudentDetail studentDetailOne(int tid);

    int update(@Param("record") StudentDetail record);
}