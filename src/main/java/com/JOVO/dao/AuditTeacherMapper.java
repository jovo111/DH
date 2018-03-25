package com.JOVO.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Teacher;

public interface AuditTeacherMapper {
	int delete(@Param("tid") Integer tid);

	int update(@Param("tid") Integer tid);

	List<Teacher> selectAll();

	Teacher selectOne(@Param("tid") Integer tid);
}
