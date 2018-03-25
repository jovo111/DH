package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.service.StudentService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class StudentController {
	@Autowired
	StudentService studentService;

	@RequestMapping(value = "/student")
	public String student() {
		return "student";
	}

	@RequestMapping("/students")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "example", defaultValue = "") String param,HttpServletRequest request) {
		HttpSession session= request.getSession();
		String example=(String)session.getAttribute("example");
		
		// 穿入页码和每页需要几条数据
		PageHelper.startPage(pn, 8);
		
		List<Student> list = null;
		
		if(example==null){
			example=new String();
			session.setAttribute("example", example);
		
			if(param ==null||"".equals(param)){
				list = studentService.getAll();
			}
		}
		
		
		if(param != null && !("".equals(param))){
            session.setAttribute("example", param);  
			list = studentService.queryAll(param);
		}else{
			session.setAttribute("example", param);  
			list = studentService.getAll();
		}
		
		// 传入连续的显示的页面
		PageInfo<Student> page = new PageInfo<Student>(list,5);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("/insertStudent")
	public String insertStudent(HttpServletRequest request,Student student,StudentDetail studentDetail){
	
		
		int i =studentService.insertStudent(student);
		studentDetail.setSid(student.getSid());
		int j =studentService.insertStudentDetail(studentDetail);
		if(i+j==2){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		return "student";
	}
	
	@RequestMapping("/updateStudent")
	public String updateStudent(HttpServletRequest request,Student student,StudentDetail studentDetail){
		
		int i=studentService.updateStudent(student);
		int j=studentService.updateStudentDetail(studentDetail);
		if(i+j==2){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		return "student";
	}
	
	@RequestMapping("/deleteStudent")
	public String deleteStudent(HttpServletRequest request,int sid){
		
		int i=studentService.deleteStudent(sid);
		if(i==1){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		return "student";
	}
}
