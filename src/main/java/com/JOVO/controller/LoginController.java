package com.JOVO.controller;

import java.security.Principal;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Admin;
import com.JOVO.model.CourseType;
import com.JOVO.model.Teacher;
import com.JOVO.service.AdminService;
import com.JOVO.service.BulletinService;
import com.JOVO.service.CourseTypeService;
import com.JOVO.service.TeacherService;
import com.JOVO.shiro.UserLoginToken;
import com.JOVO.shiro.UserType;
import com.JOVO.util.Msg;
import com.JOVO.util.SMS;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "admin")
public class LoginController {

	private static StringBuffer codes;

	@Autowired
	AdminService adminService;

	@Autowired
	CourseTypeService courseTypeService;

	@Autowired
	BulletinService bulletinService;

	@RequestMapping(value = "/")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/main")
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam(value = "username", required = false) String aname,
			@RequestParam(value = "password", required = false) String apwd, HttpServletRequest request,
			HttpSession session, Model model) {
		
		String md5 = new Md5Hash(apwd, aname).toString();
		
		Subject currentAdmin = SecurityUtils.getSubject();
		
		//判断该用户是否在线，是的话强制退出用户
 		

		if (currentAdmin.getPrincipal() == null) {
			UserLoginToken token = new UserLoginToken(aname, md5,UserType.Admin);
			
			try {
				currentAdmin.login(token);
			} catch (AuthenticationException e) {
				return "redirect:/admin/";
			}
		}
		System.out.println("登录");

		List<CourseType> courseType = courseTypeService.getAll();
		model.addAttribute("courseType", courseType);

		return "index";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		// 登出操作  
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

	@RequestMapping(value = "/reigster")
	@ResponseBody
	public Msg register(@RequestParam(value = "username") String aname, @RequestParam(value = "password") String apwd,
			@RequestParam(value = "phone") String aid, HttpServletRequest request) {
		Admin admin = adminService.getOne(aid);
		if (admin != null) {
			return Msg.success().add("status", -1);
		}

		return Msg.success().add("status", adminService.Admin(new Admin(aid, aname, apwd)));
	}

	@RequestMapping(value = "/forgetpwd")
	@ResponseBody
	public Msg forgetpwd(@RequestParam(value = "password") String password, @RequestParam(value = "phone") String phone,
			HttpServletRequest request) {

		Admin admin = adminService.getOne(phone);
		if (admin == null) {
			return Msg.success().add("status", -1);
		}

		return Msg.success().add("status", adminService.updateone(new Admin(phone, password)));
	}

	@RequestMapping(value = "/code")
	@ResponseBody
	public Msg send(@RequestParam(value = "phone") String phone) {
		number(phone);
		System.out.println(codes);
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
}
