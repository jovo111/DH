package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.BulletinMapper;
import com.JOVO.model.Bulletin;

@Service
public class BulletinService {
	@Autowired
	private BulletinMapper bulletinMapper;
	
	public List<Bulletin> select(){
		return bulletinMapper.select();
	}
	
	public int update(Bulletin bulletin){
		return bulletinMapper.update(bulletin);
	}
	
	public int updateRelease(Bulletin bulletin){
		return bulletinMapper.updateRelease(bulletin);
	}
	
	public int delete(int bulletinid){
		return bulletinMapper.delete(bulletinid);
	}
	
	public int insert(Bulletin bulletin){
		return  bulletinMapper.insert(bulletin);
	}
	
	public List<Bulletin> bulletins(String aid){
		return bulletinMapper.bulletins(aid);
	}

}
