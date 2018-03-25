package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.DiscussMapper;
import com.JOVO.model.Discuss;

@Service
public class DiscussService {

	@Autowired
	DiscussMapper discussMapper;
	
	public long discussCount(int cid){
		return discussMapper.discussCount(cid);
	}
	
	public List<Discuss> courseDiscuss(int cid){
		return discussMapper.courseDiscuss(cid);
	}
}
