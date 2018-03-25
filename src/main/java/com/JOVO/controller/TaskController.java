package com.JOVO.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.JOVO.model.Task;
import com.JOVO.service.CourseService;
import com.JOVO.service.TaskService;
import com.JOVO.util.Msg;

@Controller
@RequestMapping("admin")
public class TaskController {
	@Autowired
	TaskService taskService;
	
	@Autowired
	CourseService courseService;
	
	//读出课时列表
	@RequestMapping("/taskinfo")
	@ResponseBody
	public Msg taskInfo(HttpServletRequest request,int cid){
		List<Task> list = taskService.selectType(cid);
		return Msg.success().add("task", list);
	}
	
	@RequestMapping("/insertTask")
	public String insertTask(HttpServletRequest request,Task task,Model model,int typeid){
		int i = taskService.insert(task);
		if(i>=1){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		String TopName = courseService.selectTwo(task.getCid());
		model.addAttribute("TopName",TopName);
		model.addAttribute("Top",task.getCid());
		model.addAttribute("modelId", typeid);
		return "task";
	}
	
	@RequestMapping("/updateTask")
	public String updateTask(HttpServletRequest request,Task task,Model model,int typeid){
		
		int i=taskService.update(task);
		if(i>=1){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		String TopName = courseService.selectTwo(task.getCid());
		model.addAttribute("TopName",TopName);
		model.addAttribute("Top",task.getCid());
		model.addAttribute("modelId", typeid);
		return "task";
	}
	
	@RequestMapping("/deleteTask")
	public String deleteTask(HttpServletRequest request,int taskid,int cid,int typeid,Model model){
		
		int i=taskService.delete(taskid);
		String TopName = courseService.selectTwo(cid);
		model.addAttribute("TopName",TopName);
		model.addAttribute("Top",cid);
		model.addAttribute("modelId", typeid);
		if(i>=1){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		return "task";
	}
}

