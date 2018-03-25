package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.CourseType;

public interface CourseTypeMapper {
	List<CourseType> getAll();
	
	List<CourseType> getLikeAll(@Param("typename")String typename);
	
    int delete(int typeid);

    int insert(CourseType record);

    int update(@Param("record") CourseType record);
}