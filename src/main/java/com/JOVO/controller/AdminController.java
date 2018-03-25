package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Admin;
import com.JOVO.model.Bulletin;
import com.JOVO.model.Course;
import com.JOVO.model.Teacher;
import com.JOVO.service.AdminService;
import com.JOVO.service.AuditCourseService;
import com.JOVO.service.AuditTeacherService;
import com.JOVO.service.BulletinService;
import com.JOVO.util.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	BulletinService bulletinService;

	@Autowired
	AuditCourseService auditCourseService;

	@Autowired
	AuditTeacherService auditTeacherService;

	@RequestMapping(value = "/admin")
	public String toAdmin() {
		return "admin";
	}

	@RequestMapping(value = "/adminProfile")
	public String adminProfile(HttpServletRequest request, Model model, String aid) {
		System.out.println(aid);
		Admin admin = adminService.getOne(aid);
		List<Bulletin> bulletins = bulletinService.bulletins(aid);
		List<Course> auditCoures = auditCourseService.selectAll();
		List<Teacher> auditTeachers = auditTeacherService.selectAll();
		
		model.addAttribute("admin", admin);
		model.addAttribute("bulletins", bulletins);
		model.addAttribute("auditCoures", auditCoures);
		model.addAttribute("auditTeachers", auditTeachers);
		return "adminprofile";
	}

	@RequestMapping("/admins")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "example", defaultValue = "") String param, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String example = (String) session.getAttribute("example");

		// 穿入页码和每页需要几条数据
		PageHelper.startPage(pn, 8);

		List<Admin> list = null;

		if (example == null) {
			example = new String();
			session.setAttribute("example", example);

			if (param == null || "".equals(param)) {
				list = adminService.getAll();
			}
		}

		if (param != null && !("".equals(param))) {
			session.setAttribute("example", param);
			list = adminService.queryAll(param);
		} else {
			session.setAttribute("example", param);
			list = adminService.getAll();
		}

		// 传入连续的显示的页面
		PageInfo<Admin> page = new PageInfo<Admin>(list, 5);
		return Msg.success().add("pageInfo", page);
	}

}
