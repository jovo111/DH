package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.CourseType;
import com.JOVO.service.CourseService;
import com.JOVO.service.CourseTypeService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class CourseTypeController {
	
	@Autowired
	CourseTypeService courseTypeService;
	
	@Autowired
	CourseService courseSerivce;
	
	@RequestMapping("/courseType")
	public String courseType(){
		return "coursetype";
	}

	@RequestMapping("/courseTypes")
	@ResponseBody
	public Msg getSelectType(@RequestParam(value = "id",defaultValue="1") Integer id,HttpServletRequest request){
		List<CourseType> list = courseTypeService.getAll();
		// 传入连续的显示的页面
		return Msg.success().add("courseTypes", list).add("id", id);
	}
	
	@RequestMapping("/queryCount")
	@ResponseBody
	public Msg getCourseCount(@RequestParam(value = "typeid") Integer id,HttpServletRequest request){
		
		int count = courseSerivce.queryCount(id);
		
		return Msg.success().add("count", count);
	}
	
	@RequestMapping("/insertType")
	public String getInsertType(HttpServletRequest request,CourseType courseType){
		if(!courseType.getTypename().equals(""))
			courseTypeService.insertType(courseType);
		return "coursetype";
	}
	
	@RequestMapping("/getLikeAll")
	@ResponseBody
	public Msg getLikeAll(@RequestParam(value = "typename")String typename,HttpServletRequest request){
		List<CourseType> list = courseTypeService.getLikeAll(typename);
		return Msg.success().add("courseTypes", list);
	}
	
	@RequestMapping("/deleteType")
	public String deleteType(HttpServletRequest request,int typeid){
		
		courseTypeService.delete(typeid);
		return "coursetype";
	}
	
	@RequestMapping("/updateType")
	public String updateType(HttpServletRequest request,CourseType courseType){
		
		courseTypeService.update(courseType);
		return "coursetype";
	}


}
