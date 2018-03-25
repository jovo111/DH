package com.JOVO.controller.face;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.JOVO.service.face.qtTeacherService;
import com.JOVO.util.Msg;
import com.JOVO.util.Picture;
import com.JOVO.model.Teacher;
import com.JOVO.model.TeacherDetail;

@Controller
public class AuditController {

	@Autowired
	qtTeacherService teacherService;

	private static StringBuffer codes;

	@RequestMapping("/audit")
	public String Audit() {
		return "face/audit";
	}

	@RequestMapping("/auditTeacher")
	public String AuditTeacher() {
		return "face/auditteacher";
	}

	@RequestMapping(value = "audit/code")
	@ResponseBody
	public Msg send(@RequestParam(value = "phone") String phone) {
		int a = teacherService.isExist(phone);
		System.out.println(phone + "a:" + a);
		if (a == 0) {
			number(phone);
		} else {
			codes = new StringBuffer("1");
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

	@RequestMapping("audit/add")
	@ResponseBody
	public Msg insertone(@RequestParam(value = "photo",required=true) MultipartFile photo, HttpServletRequest request,
			Teacher teacher,TeacherDetail teacherDetail) throws IOException {
		String md5 = new Md5Hash(teacher.getTpwd(), teacher.getTnum()).toString();
		teacher.setTpwd(md5);
		
		String filedir = Picture.upload(photo, request);
		teacherDetail.setTphoto(filedir);
		teacherService.insertTeacher(teacher,teacherDetail);
		return Msg.success();
	}

}
