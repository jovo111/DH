package com.JOVO.controller.face;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.JOVO.model.Course;
import com.JOVO.model.Plupload;
import com.JOVO.model.Teacher;
import com.JOVO.service.face.PluploadService;
import com.JOVO.service.face.qtAuditCourseService;
import com.JOVO.util.Msg;
import com.JOVO.util.Picture;

@Controller
public class CreateCourseController {
	
	@Autowired
	private PluploadService pluploadService;
	
	@Autowired
	private qtAuditCourseService auditCourseService;
	
	int courseid;
	
	
	@RequestMapping("/Upload")
	public void upload(Plupload plupload,HttpServletRequest request,HttpServletResponse response) {

        plupload.setRequest(request);//手动传入Plupload对象HttpServletRequest属性
        
        File dir = new File(request.getSession().getServletContext().getRealPath("/resource/video/"));
        
        System.out.println(request.getSession().getServletContext().getRealPath("/resource/video/") );
        if(!dir.exists()){
            dir.mkdirs();//可创建多级目录，而mkdir()只能创建一级目录
        }
        
        
        //开始上传文件
        pluploadService.upload(plupload, dir,courseid);
    }
	
	@RequestMapping("/createCourse")
	@ResponseBody
	public Msg createCourse(Course auditCourse,@RequestParam(value = "photo") MultipartFile photo,HttpServletRequest request) throws IllegalStateException, IOException{
		String filedir = Picture.upload(photo, request);
		auditCourse.setCphoto(filedir);
		
		auditCourse.setTid(((Teacher) SecurityUtils.getSubject().getPrincipal()).getTid());
		int count =auditCourseService.insert(auditCourse);
		courseid=auditCourse.getCid();
		
		return Msg.success().add("status", count);
	}

}
