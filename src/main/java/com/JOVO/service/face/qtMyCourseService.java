package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.MyCourseMapper;
import com.JOVO.dao.face.qtMyCourseMapper;
import com.JOVO.model.MyCourse;

@Service
public class qtMyCourseService {

	@Autowired
	qtMyCourseMapper myCouserMapper;
	
	public List<MyCourse> mycourse(int sid){
		return myCouserMapper.mycourse(sid);
	}
	
	public Long mycourseCount(int sid){
		return myCouserMapper.mycourseCount(sid);
	}
	public Long notMyCourse(int sid){
		return myCouserMapper.notMyCourse(sid);
	}
	public Long isMyCourse(int sid){
		return myCouserMapper.isMyCourse(sid);
	}
	public Long newMyCourse(int sid){
		return myCouserMapper.newMyCourse(sid);
	}
	public Integer Topcid(int sid){
		return myCouserMapper.Topcid(sid);
	}

	public Integer select(Integer sid, Integer cid) {
		return myCouserMapper.selectcount(sid, cid);
	}
}
