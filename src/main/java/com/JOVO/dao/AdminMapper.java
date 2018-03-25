package com.JOVO.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.JOVO.model.Admin;

public interface AdminMapper {
	
    int delete(@Param("aid") String aid);

    int insert(Admin admin);

    List<Admin> select();
    
    List<Admin> selectByExample(@Param("example") String example);

    int update(@Param("record") Admin record);
    
    Admin selectOne(Admin admin);
    
    Admin valitage(@Param("aid") String aid);
}