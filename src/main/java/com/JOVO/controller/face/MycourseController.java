package com.JOVO.controller.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.MyCourse;
import com.JOVO.model.Student;
import com.JOVO.model.Task;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtStudentService;
import com.JOVO.service.face.qtTaskService;
import com.JOVO.util.Msg;

@Controller
public class MycourseController {
	@Autowired
	qtMyCourseService myCourseService;

	@Autowired
	qtStudentService studentService;

	@Autowired
	qtOrderService orderService;

	@Autowired
	qtTaskService taskService;

	@RequestMapping("myCourse")
	public String qtMyCourse(HttpServletRequest request, Model model) {
		Integer sid;
        Subject subject = SecurityUtils.getSubject();
        Object obj=subject.getPrincipal();
		
		if(subject.hasRole("student")&&obj!=null){
			sid=((Student)obj).getSid();
		}else{
			return "face/login";
		}
		
		List<MyCourse> mycourse = myCourseService.mycourse(sid);
		Student student = studentService.myDetails(sid);
		long orderCount = orderService.orderCount(sid);
		long isOrder = orderService.isOrder(sid);
		long notOrder = orderService.notOrder(sid);
		long mycourseCount = myCourseService.mycourseCount(sid);
		long notMyCourse = myCourseService.notMyCourse(sid);
		long isMyCourse = myCourseService.isMyCourse(sid);
		long newMyCourse = myCourseService.newMyCourse(sid);
		Integer Topcid = myCourseService.Topcid(sid);
		model.addAttribute("mycourse", mycourse);
		model.addAttribute("student", student);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("isOrder", isOrder);
		model.addAttribute("notOrder", notOrder);
		model.addAttribute("mycourseCount", mycourseCount);
		model.addAttribute("notMyCourse", notMyCourse);
		model.addAttribute("isMyCourse", isMyCourse);
		model.addAttribute("newMyCourse", newMyCourse);
		model.addAttribute("Topcid", Topcid);
		return "face/mycourse";
	}

	@RequestMapping("/aTask")
	@ResponseBody
	public Msg courseTask(HttpServletRequest request, int cid) {

		List<Task> task = taskService.courseTask(cid);
		long taskCount = taskService.taskCount(cid);
		return Msg.success().add("Task", task).add("taskCount", taskCount);
	}

}
