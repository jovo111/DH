package com.JOVO.controller.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JOVO.model.Order;
import com.JOVO.model.Student;
import com.JOVO.service.face.qtMyCourseService;
import com.JOVO.service.face.qtOrderService;
import com.JOVO.service.face.qtStudentService;
import com.JOVO.shiro.UserType;

@Controller
public class qtOrderController {
	
	@Autowired
	qtMyCourseService myCourseService;

	@Autowired
	qtStudentService studentService;

	@Autowired
	qtOrderService orderService;
		
	 
	@RequestMapping("/Order")
	public String select(HttpServletRequest request,Model model){
		Integer sid;
        Subject subject = SecurityUtils.getSubject();
        Object obj=subject.getPrincipal();
		
		if(subject.hasRole(UserType.Student)&&obj!=null){
			sid=((Student)obj).getSid();
		}else{
			return "face/login";
		}
		
		Student student = studentService.myDetails(sid);
		long orderCount = orderService.orderCount(sid);
		long isOrder = orderService.isOrder(sid);
		long notOrder = orderService.notOrder(sid);
		long mycourseCount = myCourseService.mycourseCount(sid);
		List<Order> unpaid = orderService.select(sid);
		List<Order> paid = orderService.select_on(sid);
		model.addAttribute("student", student);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("isOrder", isOrder);
		model.addAttribute("notOrder", notOrder);
		model.addAttribute("mycourseCount", mycourseCount);
		model.addAttribute("order_order",unpaid);
		model.addAttribute("order",paid);
		return "face/order";
	} 
	
	
	@RequestMapping("/order_delete")
	public String delete(@RequestParam(value = "oid") Integer oid,@RequestParam(value = "sid") Integer sid,HttpServletRequest request,Model model){
		int num = orderService.delete(oid);
		System.out.println(num);
		List<Order> order = orderService.select(sid);
		System.out.println(order.size());
		model.addAttribute("order_order",order);
		return "face/order";
	}

}
