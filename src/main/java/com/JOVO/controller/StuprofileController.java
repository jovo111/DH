package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.JOVO.model.MyCourse;
import com.JOVO.model.Order;
import com.JOVO.model.Student;
import com.JOVO.service.MyCourseService;
import com.JOVO.service.OrderService;
import com.JOVO.service.StudentService;

@Controller
@RequestMapping("admin")
public class StuprofileController {

	@Autowired
	MyCourseService myCourseService;
	
	@Autowired
	StudentService studentSerivce;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/studentProfile")
	public String studentProfile(HttpServletRequest request,Model model,int sid){
		List<MyCourse> myCourselist = myCourseService.getAll(sid);
		Student student = studentSerivce.selectOne(sid);
		List<Order> orderlist = orderService.oldOrder(sid);
		model.addAttribute("student", student);
		model.addAttribute("mycourseAll", myCourselist);
		model.addAttribute("orderAll", orderlist);
		return "studentprofile";
	}
}
