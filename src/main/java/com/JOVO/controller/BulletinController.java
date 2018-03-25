package com.JOVO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Bulletin;
import com.JOVO.service.BulletinService;
import com.JOVO.util.Msg;

@Controller
@RequestMapping("admin")
public class BulletinController {
	@Autowired 
	BulletinService bulletinService;
	
	@RequestMapping(value = "/bulletin")
	public String toBulletin(){
		return "bulletin";
	}
	
	
	@RequestMapping("/bulletins")
	@ResponseBody
	public Msg getSelectBulletin(){
		List<Bulletin> list=bulletinService.select();
		return Msg.success().add("bulletins",list);
	}
	
	@RequestMapping("/deleteBulletin")
	@ResponseBody
	public Msg delete(int bulletinid){
		return Msg.success().add("status", bulletinService.delete(bulletinid));
	}
	
	@RequestMapping("/updateBulletin")
	@ResponseBody
	public Msg update(Bulletin bulletin){
		return Msg.success().add("status", bulletinService.update(bulletin));
	}
	
	@RequestMapping("/insertBulletin")
	@ResponseBody
	public Msg insert(Bulletin bulletin){
		int i =bulletinService.insert(bulletin);
		Integer bulletinid=bulletin.getBulletinid();
		
		return Msg.success().add("status", i).add("bulletinid", bulletinid);
	}
	
	
	@RequestMapping("/updateBulletinRelease")
	@ResponseBody
	public Msg updateRelease(Bulletin bulletin){
		return Msg.success().add("status", bulletinService.updateRelease(bulletin));
	}
	
}
