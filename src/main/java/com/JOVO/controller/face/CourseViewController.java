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
import com.JOVO.model.Task;
import com.JOVO.service.face.CourseInfoService;
import com.JOVO.service.face.qtCourseService;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtTaskService;

@Controller
public class CourseViewController {
	
	@Autowired
	CourseInfoService courseService;
	
	@Autowired
	qtMyCourseService myCourseService;
	
	
	@RequestMapping("/courseView")
	public String courseView(@RequestParam(value = "cid") Integer cid,@RequestParam(value = "taskid") Integer taskid, HttpServletRequest request, Model model){
		Integer sid,count=0;
		Subject subject = SecurityUtils.getSubject();
		Object obj = subject.getPrincipal();
		
		
		if (subject.hasRole("student") && obj != null) {
			sid = ((Student) obj).getSid();
			Integer j=myCourseService.select(sid,cid);
			if(j<1){
				return "redirect:/courseInfo?cid="+cid;
			}
		}else{
			return "face/login";
		}
		
		Task task=courseService.selectOne(taskid);
		List<Task> tasklist = courseService.stask(cid);
		List<Discuss> discusslist = courseService.discussinfos(cid);
		CourseInfo course=courseService.selectid(cid);
		
		
		model.addAttribute("course", course);
		model.addAttribute("discuss", discusslist);
		model.addAttribute("tasks", tasklist);
		model.addAttribute("task", task);
		return "face/courseview";
	}

}
