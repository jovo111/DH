package com.JOVO.dao;

import com.JOVO.model.MyCourse;
import com.JOVO.model.StudentDetail;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MyCourseMapper {

    int deleteByExample(int mid);

    int insert(MyCourse record);

    List<MyCourse> selectByExample(int sid);

    int updateByExample(@Param("record") MyCourse record);
    
    long courseCount(int cid);
    
    List<MyCourse> selectStudents(@Param("tid") int tid);
}