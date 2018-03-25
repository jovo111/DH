package com.JOVO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JOVO.dao.OrderMapper;
import com.JOVO.model.Order;

@Service
public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	//模糊查询时间
	public List<Order> totime(String starting,String ending){
		return orderMapper.totime(starting, ending);
	}
	//查询单行
	public List<Order> select_one(int oid){
		return orderMapper.select_one(oid);
	}
	
	public List<Order> queryselect(String oid ,String isbuy,String snick,String cname){
		return orderMapper.queryselect(oid, isbuy, snick, cname);
	}
	
	public List<Order> oldOrder(int sid){
		return orderMapper.oldOrder(sid);
	}
	
	public Long orderCount(int cid){
		return orderMapper.orderCount(cid);
	}
	
	public List<Order> courseOrder(int cid){
		return orderMapper.courseOrder(cid);
	}
}
