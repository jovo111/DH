package com.JOVO.controller.face;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.model.Teacher;
import com.JOVO.service.StudentService;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtStudentService;
import com.JOVO.shiro.UserLoginToken;
import com.JOVO.shiro.UserType;
import com.JOVO.util.Msg;
import com.JOVO.util.Picture;

@Controller
public class StudentDetailController {
	@Autowired
	qtMyCourseService myCourseService;

	@Autowired
	qtStudentService studentService;

	@Autowired
	qtOrderService orderService;

	@Autowired
	StudentService stuService;

	@RequestMapping("login")
	public String login(@RequestParam(value = "snum", required = false) String snum,
			@RequestParam(value = "spwd", required = false) String spwd, HttpServletRequest request,
			HttpSession session, Model model) {
		String md5 = new Md5Hash(spwd, snum).toString();
		Subject currentAdmin = SecurityUtils.getSubject();

		// 判断该用户是否在线，是的话强制退出用户

		if (currentAdmin.getPrincipal() == null) {
			UserLoginToken token = new UserLoginToken(snum, md5, UserType.Student);

			try {
				currentAdmin.login(token);
			} catch (AuthenticationException e) {
				return "redirect:/";
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping("/studentLogout")
	public String logout(HttpSession session) {
		session.removeAttribute("student");
		// 登出操作  
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/";
	}

	@RequestMapping("register")
	public String register(Student student) {
		UUID id=UUID.randomUUID();
        String[] idd=id.toString().split("-");
		
        String md5=new Md5Hash(student.getSpwd(),student.getSnum()).toString();
        student.setSpwd(md5);
		int i=stuService.insertStudent(student);
		
		
		StudentDetail stuDetail=new StudentDetail();
		stuDetail.setSid(student.getSid());
		stuDetail.setSnick(idd[0]);
		int j=stuService.insertStudentDetail(stuDetail);
		
		
		if(i+j==2){
			Subject currentAdmin = SecurityUtils.getSubject();

			if (currentAdmin.getPrincipal() == null) {
				UserLoginToken token = new UserLoginToken(student.getSnum(), md5, UserType.Student);

				try {
					currentAdmin.login(token);
				} catch (AuthenticationException e) {
					return "redirect:/";
				}
			}
		}
		return "redirect:/";
	}

	@RequestMapping("studentDetail")
	public String studentDetail(HttpServletRequest request, Model model) {
		Integer sid;
		Subject subject = SecurityUtils.getSubject();
		Object obj = subject.getPrincipal();

		if (subject.hasRole("student") && obj != null) {
			sid = ((Student) obj).getSid();
		} else {
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
		return "face/studentdetail";
	}

	@RequestMapping("updateStudent")
	@ResponseBody
	public Msg update(Student student, StudentDetail studentDetail,
			@RequestParam(value = "photo",required=true) MultipartFile photo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String filedir = Picture.upload(photo, request);
		studentDetail.setSphoto(filedir);
		
		String salt=((Student)SecurityUtils.getSubject().getPrincipal()).getSnum();
		String md5 = new Md5Hash(student.getSpwd(), salt).toString();
		student.setSpwd(md5);

		int i=stuService.updateStudent(student);
		int j=stuService.updateStudentDetail(studentDetail);
		return Msg.success().add("status", i+j);
	}

}
