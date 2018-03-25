package com.JOVO.controller.face;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JOVO.model.Student;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtStudentService;

@Controller
public class NewsController {
	@Autowired
	qtMyCourseService myCourseService;

	@Autowired
	qtStudentService studentService;

	@Autowired
	qtOrderService orderService;
	
	@RequestMapping("News")
	public String news(HttpServletRequest request,Model model) {
		Integer sid;
        Subject subject = SecurityUtils.getSubject();
        Object obj=subject.getPrincipal();
		
		if(subject.hasRole("student")&&obj!=null){
			sid=((Student)obj).getSid();
		}else{
			return "face/login";
		}
		
		Student student = studentService.myDetails(sid);
		long orderCount = orderService.orderCount(sid);
		long isOrder = orderService.isOrder(sid);
		long notOrder = orderService.notOrder(sid);
		long mycourseCount = myCourseService.mycourseCount(sid);
		
		model.addAttribute("student", student);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("isOrder", isOrder);
		model.addAttribute("notOrder", notOrder);
		model.addAttribute("mycourseCount", mycourseCount);
		return "face/news";
	}
}
