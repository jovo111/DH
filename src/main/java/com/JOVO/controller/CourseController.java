package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Course;
import com.JOVO.model.Discuss;
import com.JOVO.model.Order;
import com.JOVO.model.Task;
import com.JOVO.model.TeacherDetail;
import com.JOVO.service.CourseService;
import com.JOVO.service.DiscussService;
import com.JOVO.service.MyCourseService;
import com.JOVO.service.OrderService;
import com.JOVO.service.TaskService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class CourseController {
	@Autowired
	CourseService courseService;

	@Autowired
	MyCourseService myCourseService;

	@Autowired
	TaskService taskService;

	@Autowired
	DiscussService discussService;

	@Autowired
	OrderService orderService;

	@RequestMapping("/course")
	public String toCourse() {
		return "course";
	}

	@RequestMapping(value = "/courseProfile")
	public String courseProfile(HttpServletRequest request, int cid, Model model) {
		Course course = courseService.selectOne(cid);
		List<Discuss> discuss = discussService.courseDiscuss(cid);
		List<Order> order = orderService.courseOrder(cid);
		List<Task> task = taskService.courseTask(cid);
		long studentCount = myCourseService.courseCount(cid);
		long taskCount = taskService.taskCount(cid);
		long discussCount = discussService.discussCount(cid);
		long orderCount = orderService.orderCount(cid);
		model.addAttribute("sCount", studentCount);
		model.addAttribute("tCount", taskCount);
		model.addAttribute("dCount", discussCount);
		model.addAttribute("oCount", orderCount);
		model.addAttribute("course", course);
		model.addAttribute("discuss", discuss);
		model.addAttribute("order", order);
		model.addAttribute("task", task);
		return "courseprofile";
	}

	@RequestMapping("/courses")
	@ResponseBody
	public Msg getSelectCourse(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "typeid") Integer typeid, HttpServletRequest request) {

		// 穿入页码和每页需要几条数据
		PageHelper.startPage(pn, 12);

		List<Course> list = courseService.selectType(typeid);
		// 传入连续的显示的页面
		PageInfo<Course> page = new PageInfo<Course>(list, 5);
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping("/task")
	public String Course(HttpServletRequest request, int typeid, Model model) {

		int i = courseService.selectTop(typeid);
		String n = courseService.selectTopName(typeid);
		model.addAttribute("Top", i);
		model.addAttribute("TopName", n);
		model.addAttribute("modelId", typeid);
		return "task";
	}

	@RequestMapping("/tasks")
	@ResponseBody
	public Msg Courses(HttpServletRequest request, int typeid, Model model) {

		List<Course> list = courseService.selectType(typeid);
		return Msg.success().add("course", list);
	}
}
