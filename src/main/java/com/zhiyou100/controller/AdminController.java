package com.zhiyou100.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Admin;
import com.zhiyou100.model.Course;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Subject;
import com.zhiyou100.model.User;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.AdminService;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.service.SubjectService;
import com.zhiyou100.service.UserService;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.util.MD5Utils;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	
	@Autowired
	CourseService courseservice;
	
	@Autowired
	SpeakerService speakerservice;
	
	@Autowired
	VideoService videoservice;
	
	@Autowired
	SubjectService subjectservice;
	
	@Autowired
	UserService userservice;
	
	@RequestMapping("adminLogin.do")
	public String AdminLogin(HttpServletRequest req,HttpServletResponse resp) {
		return "backLogin";
	}	
	
	@RequestMapping("exit.do")
	public String exit(HttpServletRequest req,HttpServletResponse resp) {
		return "index";
	}	

	@RequestMapping("Loging.do")
	public String Login(String accounts,String password,HttpServletRequest req,HttpServletResponse resp) {
		Admin admin=adminservice.login(accounts, password);
		HttpSession session=req.getSession();
		if(admin!=null) {			
			session.setAttribute("accounts", accounts);		
			List<Speaker> allspeaker=speakerservice.select();
			req.getSession().setAttribute("allspeaker", allspeaker);	
			List<User> alluser=userservice.select();
			req.getSession().setAttribute("alluser", alluser);	
			List<Video> allvideo=videoservice.select();	
			req.getSession().setAttribute("allvideo", allvideo);
			List<Subject> allsubject=subjectservice.select();
			req.getSession().setAttribute("allsubject", allsubject);		
			return "redirect:courseShow.do";		
		}
		else {
			return "backLogin";
		}		
	}
	
	//判断用户是否存在
	@RequestMapping("validation.do")
	@ResponseBody
	public Object validation(String accounts,HttpServletRequest req,HttpServletResponse resp) {
		Admin admin=adminservice.selectOne(accounts);		
		if(admin==null) {
			return "0";
		}
		else {
		return "1";
		}
	}
	
	
}
