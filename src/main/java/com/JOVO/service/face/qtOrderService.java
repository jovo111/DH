package com.JOVO.service.face;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.face.qtOrderMapper;
import com.JOVO.model.Order;

@Service
public class qtOrderService {

	@Autowired
	qtOrderMapper orderMapper;

	public Long orderCount(int sid) {
		return orderMapper.orderCount(sid);
	}

	public Long isOrder(int sid) {
		return orderMapper.isOrder(sid);
	}

	public Long notOrder(int sid) {
		return orderMapper.notOrder(sid);
	}

	public List<Order> select(int sid) {
		return orderMapper.select(sid);
	}

	public List<Order> select_on(int sid) {
		return orderMapper.select_on(sid);
	}

	public int delete(int oid) {
		return orderMapper.delete(oid);
	}
	
	public Integer select(int sid,int cid){
		return orderMapper.selectcount(sid,cid);
	}
}
