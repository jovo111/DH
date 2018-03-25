package com.JOVO.controller.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JOVO.model.CourseInfo;
import com.JOVO.model.Discuss;
import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.model.Task;
import com.JOVO.service.face.CourseInfoService;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;

@Controller
public class CourseInfoController {

	@Autowired
	CourseInfoService courseInfoService;
	
	@Autowired
	qtOrderService orderService;
	
	@Autowired
	qtMyCourseService myCourseService;

	@RequestMapping("/courseInfo")
	public String selectid(@RequestParam(value = "cid") Integer cid, HttpServletRequest request, Model model) {
		Integer sid,count=0;
		Subject subject = SecurityUtils.getSubject();
		Object obj = subject.getPrincipal();

		if (subject.hasRole("student") && obj != null) {
			sid = ((Student) obj).getSid();
			Integer i=orderService.select(sid, cid);
			Integer j=myCourseService.select(sid,cid);
			count=i+j;
		}
		
		CourseInfo cinfolist = courseInfoService.selectid(cid);
		List<Task> tasks = courseInfoService.stask(cid);
		List<StudentDetail> students = courseInfoService.students(cid);
		List<Discuss> discussinfos = courseInfoService.discussinfos(cid);
		model.addAttribute("cinfolist", cinfolist);
		model.addAttribute("tasklist", tasks);
		model.addAttribute("studnets", students);
		model.addAttribute("discussinfos", discussinfos);
		model.addAttribute("count", count);
		return "face/courseinfo";
	}
	
	@RequestMapping("/adddiscuss")
	public String add(Discuss discuss){
		discuss.setSid(((Student)SecurityUtils.getSubject().getPrincipal()).getSid());
		
		int count=courseInfoService.insert(discuss);
		return "redirect:/courseInfo?cid="+discuss.getCid();
		
	}
}
