package com.JOVO.controller.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Course;
import com.JOVO.model.CourseType;
import com.JOVO.model.MyCourse;
import com.JOVO.model.Student;
import com.JOVO.model.Task;
import com.JOVO.service.face.qtCourseService;
import com.JOVO.service.face.qtCourseTypeService;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtStudentService;
import com.JOVO.util.Msg;

@Controller
public class IndexController {
	
	@Autowired
	qtCourseService courseService;
	
	@Autowired
	qtCourseTypeService courseTypeService;
	
	@Autowired
	qtMyCourseService myCourseService;
	
	@Autowired
	qtOrderService orderService;
	
	@Autowired
	qtStudentService studentService;
	
	@RequestMapping("/")
	public String index(HttpServletRequest request,Model model){
		Integer sid;
		Subject subject = SecurityUtils.getSubject();
		Object obj = subject.getPrincipal();

		if (subject.hasRole("student") && obj != null) {
			sid = ((Student) obj).getSid();
			long mycourseCount = myCourseService.mycourseCount(sid);
			long orderCount = orderService.orderCount(sid);
			Student student = studentService.myDetails(sid);
			List<MyCourse> mycourse = myCourseService.mycourse(sid);
			
			model.addAttribute("mycourseCount",mycourseCount);
			model.addAttribute("myorderCount",orderCount);
			model.addAttribute("student",student);
			model.addAttribute("mycourse",mycourse);
		} 
		
		
		List<Course> notCourse = courseService.notMoney(null);
		List<Course> isCourse = courseService.isMoney(null);
		List<Course> goodTeacher = courseService.goodTeacher();
		List<CourseType> courses = courseTypeService.courses();
		
		
		model.addAttribute("notCourse", notCourse);
		model.addAttribute("isCourse", isCourse);
		model.addAttribute("teacher", goodTeacher);
		model.addAttribute("oneToMany",courses);
		return "face/index";
	}
	
	@RequestMapping("courseTypes")
	@ResponseBody()
	public Msg courseType(int baseid){
		List<CourseType> list = courseTypeService.courseTypes(baseid);
		return Msg.success().add("courseType", list);
	}

}