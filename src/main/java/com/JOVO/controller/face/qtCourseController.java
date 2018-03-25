package com.JOVO.controller.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Course;
import com.JOVO.service.face.qtCourseService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class qtCourseController {
	
	@Autowired
	qtCourseService courseService;

	@RequestMapping("/course")
	public String course(@RequestParam(value = "typeid") Integer typeid, Model model) {
		List<Course> fufeipaih = courseService.payRank(); // 付费排行
		List<Course> mianfeipaih = courseService.freeRank(); // 免费排行
		List<Course> isno = courseService.all(typeid);
		model.addAttribute("fufei", fufeipaih);
		model.addAttribute("mianfei", mianfeipaih);
		return "face/course";
	}

	@RequestMapping("fenye")
	@ResponseBody
	public Msg getfenye(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "example", defaultValue = "") String param,
			@RequestParam(value = "typeid") Integer typeid, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String example = (String) session.getAttribute("example");
		PageHelper.startPage(pn, 15);
		List<Course> fy = null;
		if (example == null) {
			example = new String();
			session.setAttribute("example", example);

			if (param == null || "".equals(param)) {
				fy = courseService.all(typeid);
			}
		}
		if (param.equals("1")) { // 升序查看人数
			session.setAttribute("example", param);
			fy = courseService.watchlist(typeid);
		} else if (param.equals("2")) // 查看免费
		{
			session.setAttribute("example", param);
			fy = courseService.freelist(typeid);
		} else if (param.equals("3")) // 查看付费
		{
			session.setAttribute("example", param);
			fy = courseService.paylist(typeid);
		} else {
			if (example.equals("1")) // 升序下一页
			{
				fy = courseService.watchlist(typeid);
			} else if (example.equals("2")) // 免费下一页
			{
				fy = courseService.freelist(typeid);
			} else if (example.equals("3")) // 付费下一页
			{
				fy = courseService.paylist(typeid);
			} else {
				fy = courseService.all(typeid);
			}
		}

		PageInfo<Course> page = new PageInfo<Course>(fy);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("courseList")
	public String courseList(String param,Model model){
		List<Course> course = null;
		
		if(param.equals("free")){
			course = courseService.notMoney(param);
		}else if(param.equals("pay")){
			course = courseService.isMoney(param);
		}else{
			course = courseService.selectCourse(param);
		}
		
		model.addAttribute("course", course);
		
		return "face/courseList";
	}

}
