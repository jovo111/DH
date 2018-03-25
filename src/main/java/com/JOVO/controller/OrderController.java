package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Order;
import com.JOVO.service.OrderService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order")
	public String order(){
		return "order";
	}
	@RequestMapping("/select_one")
	@ResponseBody
	public Msg getOrder(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			 @RequestParam(value = "oid") int oids,HttpServletRequest request) {
		// ����ҳ���ÿҳ��Ҫ��������
		PageHelper.startPage(pn, 5); 
		
		List<Order> list = orderService.select_one(oids); 
		return Msg.success().add("list",list);
	} 
	@RequestMapping("/totime")
	@ResponseBody
	public Msg getOrder(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "starting") String startings,@RequestParam(value = "ending") String endings,HttpServletRequest request) {
		// ����ҳ���ÿҳ��Ҫ��������
		PageHelper.startPage(pn, 5); 
		if("".equals(endings)){
			 endings=null;
			}
		if("".equals(startings)){
			 startings=null;
			}
		
		List<Order> list = orderService.totime(startings, endings);
		// ������������ʾ��ҳ��
				PageInfo<Order> page = new PageInfo<Order>(list, 5);
		return Msg.success().add("pageInfo", page);
	} 
	
	@RequestMapping("/orderss") 
	@ResponseBody
	public Msg getOrders(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "oid") String oids,@RequestParam(value = "isbuy") String isbuys,@RequestParam(value = "snick") String snicks,@RequestParam(value = "cname") String cnames,HttpServletRequest request) {
		
	 
		List<Order> list; 
		// ����ҳ���ÿҳ��Ҫ��������
		PageHelper.startPage(pn, 5);
		oids=oids.trim();
		isbuys=isbuys.trim();
		snicks=snicks.trim();
		cnames=cnames.trim();
			if(oids==null){
			 oids="";
			}
			 list = orderService.queryselect(oids, isbuys, snicks, cnames);
			 System.out.println("ģ����ѯ");
		 
		// ������������ʾ��ҳ��
		PageInfo<Order> page = new PageInfo<Order>(list, 5);
		return Msg.success().add("pageInfo", page);
	} 
}
