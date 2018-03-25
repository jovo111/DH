package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.TeacherDetail;

public interface TeacherDetailMapper {
    int insert(TeacherDetail record);

    List<TeacherDetail> select();

    int update(@Param("record") TeacherDetail record);

}