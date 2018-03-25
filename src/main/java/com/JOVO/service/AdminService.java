package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.AdminMapper;
import com.JOVO.model.Admin;

@Service
public class AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	public Admin getOne(Admin admin) {
		return adminMapper.selectOne(admin);
	}
	
	public Admin getOne(String name){
		return adminMapper.valitage(name);
	}
	
	public int Admin(Admin admin){
		return adminMapper.insert(admin);
	}
	
	public List<Admin> getAll() {
		return adminMapper.select();
	} 
	
	public List<Admin> queryAll(String example)
	{
		return adminMapper.selectByExample(example);
	}
	
	public int updateone(Admin admin)
	{
		return adminMapper.update(admin);
	}
}
