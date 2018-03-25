package com.JOVO.controller.face;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.JOVO.model.Course;
import com.JOVO.model.CourseType;
import com.JOVO.model.Student;
import com.JOVO.model.StudentDetail;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;
import com.JOVO.service.AuditCourseService;
import com.JOVO.service.face.qtCourseService;
import com.JOVO.service.face.qtCourseTypeService;
import com.JOVO.service.face.qtStudentService;
import com.JOVO.service.face.qtTeacherService;
import com.JOVO.shiro.UserLoginToken;
import com.JOVO.shiro.UserType;
import com.JOVO.util.Msg;
import com.JOVO.util.Picture;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class qtTeacherController {
	
	@Autowired
	qtTeacherService teacherService;
	
	@Autowired
	qtStudentService studentService;
	
	@Autowired
	qtCourseService courseService;
	
	@Autowired
	qtCourseTypeService courseTypeService;
	
	private static StringBuffer codes;

	@RequestMapping("teacher")
	public String teacher(@RequestParam(value = "tid") Integer tid, Model model) {
		TeacherDetail teacher=teacherService.selectTeacher(tid);
		model.addAttribute("teacher", teacher);
		return "face/teacher";
	}
	
	@RequestMapping("teacherManager")
	public String teacherManager(Model model){
		Integer tid ;
		Subject subject = SecurityUtils.getSubject();
        Object  obj= subject.getPrincipal();
		
		if(obj!=null && subject.hasRole("teacher")){
			tid=((Teacher)obj).getTid();
			List<StudentDetail> students=studentService.students(tid);
			TeacherDetail teacher=teacherService.selectTeacher(tid);
			List<Course> courses=teacherService.selectCourse(tid);
			List<Course> auditCourse=courseService.auditCourse(tid);
			List<CourseType> courseType=courseTypeService.selectAll();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("teacher", teacher);
			model.addAttribute("auditCourse", auditCourse);
			model.addAttribute("type", courseType);
			
			return "face/teachermanager";
		}else{
			return "redirect:/toLogin";
		} 
	}

	@RequestMapping("tfenye")
	@ResponseBody
	public Msg gettfenye(@RequestParam(value = "tid") Integer tid,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		
		PageHelper.startPage(pn, 10);
		List<Course> list = teacherService.selectCourse(tid);
		PageInfo<Course> page = new PageInfo<Course>(list);
		return Msg.success().add("pageInfo", page);
	}
	
	@RequestMapping("toLogin")
	public String login(){
		return "face/teacherlogin";
	}
	
	@RequestMapping(value = "/teacherLogout")
	public String logout(HttpSession session) {
		session.removeAttribute("teacher");
		// 登出操作  
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/toLogin";
	}
	
	@RequestMapping("teacherLogin")
	public String teacherLogin(@RequestParam(value="phone") String phone,@RequestParam(value="password") String pwd){
		
		
		String md5 = new Md5Hash(pwd, phone).toString();
		Subject currentAdmin = SecurityUtils.getSubject();

		// 判断该用户是否在线，是的话强制退出用户

		if (currentAdmin.getPrincipal() == null) {
			UserLoginToken token = new UserLoginToken(phone, md5, UserType.Teacher);

			try {
				currentAdmin.login(token);
			} catch (AuthenticationException e) {
				e.printStackTrace();
				return "redirect:/toLogin";
			}
		}
		return "redirect:/teacherManager";
	}
	
	@RequestMapping("teacherForget")
	public String teacherForget(Teacher teacher){
		String md5 = new Md5Hash(teacher.getTpwd(), teacher.getTnum()).toString();
		teacher.setTpwd(md5);
		teacherService.forget(teacher);
		
		System.out.println("登录");
		return "face/teacherlogin";
	}
	
	@RequestMapping(value = "qtteacher/code")
	@ResponseBody
	public Msg send(@RequestParam(value = "phone") String phone) {
		int a = teacherService.isExist(phone);
		System.out.println(phone + "a:" + a);
		if (a == 0) {
			codes = new StringBuffer("1"); 
		} else {
			number(phone);
		}
		System.out.println("codes" + codes);
		return Msg.success().add("code", codes);
	}

	public static void number(String phoneNumber) {
		Random random = new Random();
		StringBuffer code = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			code.append(random.nextInt(10));
		}
		codes = code;
		// SMS.sendPhonenumber(phoneNumber,code.toString());
	}
	
	@RequestMapping("updateTeacher")
	public String updateTeacher(@RequestParam(value = "photo") MultipartFile photo,Teacher teacher,TeacherDetail teacherDetail,HttpServletRequest request) throws IllegalStateException, IOException{
		String md5 = new Md5Hash(teacher.getTpwd(), teacher.getTnum()).toString();
		teacher.setTpwd(md5);
		String filedir = Picture.upload(photo, request);
		
		teacherDetail.setTphoto(filedir);
		teacherService.updateTeacher(teacher,teacherDetail);
		
		return "redirect:/toLogin";
	}
}
