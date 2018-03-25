package com.JOVO.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.JOVO.model.Course;
import com.JOVO.model.MyCourse;
import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;
import com.JOVO.service.TeacherService;
import com.JOVO.util.Msg;
import com.JOVO.util.Picture;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class TeacherController {
	@Autowired
	TeacherService teacherService;

	@RequestMapping(value = "/teacher")
	public String teacher() {
		return "teacher";
	}
	
	@RequestMapping(value = "/teacherprofile")
	public String teacherProfile(HttpServletRequest request,Model model,int tid){
		Teacher t = teacherService.selectOne(tid);
		List<MyCourse> students=teacherService.students(tid);
		List<Course> courses=teacherService.courses(tid);
		
		model.addAttribute("teacher", t);
		model.addAttribute("students", students);
		model.addAttribute("courses", courses);
		return "teacherprofile";
	}

	@RequestMapping("/teachers")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "example", defaultValue = "") String param, HttpServletRequest request,HttpServletResponse response) {
		response.setHeader("Content-type", "application/json;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String example = (String) session.getAttribute("example");

		// 穿入页码和每页需要几条数据
		PageHelper.startPage(pn, 8);

		List<Teacher> list = null;

		if (example == null) {
			example = new String();
			session.setAttribute("example", example);

			if (param == null || "".equals(param)) {
				list = teacherService.getAll();
			}
		}

		if (param != null && !("".equals(param))) {
			session.setAttribute("example", param);
			list = teacherService.queryList(param);
		} else {
			session.setAttribute("example", param);
			list = teacherService.getAll();
		}

		// 传入连续的显示的页面
		PageInfo<Teacher> page = new PageInfo<Teacher>(list, 5);
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping(value="/insertOne")
	public String insertOne(@RequestParam(value = "photo") MultipartFile photo,HttpServletRequest request,Teacher teacher,TeacherDetail teacherDetail) throws IOException{
		String filedir=Picture.upload(photo, request);
        System.out.println(filedir);
        
        teacherDetail.setTphoto(filedir);
		
		int i = teacherService.insertTeacher(teacher,teacherDetail);
		if(i==2){
			System.out.println("添加成功");
		}else{
			System.out.println("添加失败");
		}
		return "teacher";
	}
	
	@RequestMapping(value="/updateteacherDetail")
	public String updateteacherDetail(HttpServletRequest request,Teacher teacher,TeacherDetail teacherDetail){
		
		int j = teacherService.update(teacher);
		int i = teacherService.updateTeacherDetail(teacherDetail);
		
		if(i+j==2){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
		return "teacher";
	}
	
	@RequestMapping(value="/deleteTeacher")
	public String deleteTeacher(HttpServletRequest request,int tid){
		
		int i = teacherService.deleteTeacher(tid);
		if(i>=1){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败");
		}
		
		return "teacher";
	}

}
