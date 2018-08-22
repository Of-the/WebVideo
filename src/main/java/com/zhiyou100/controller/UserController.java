package com.zhiyou100.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.zhiyou100.service.UserService;
import com.zhiyou100.util.MD5Utils;

@Controller
public class UserController {

	
	@Autowired
	UserService userservice;
	
	//前台登录
		@RequestMapping("qiantai.do")
		public String qiantai(HttpServletRequest req,HttpServletResponse resp) {
			List<User> alluser=userservice.select();
			req.getSession().setAttribute("alluser", alluser);	
			return "index";
		}
	//用户首页登录
		@RequestMapping("frontLogin.do")
		public String frontLogin(HttpServletRequest req,HttpServletResponse resp) {
			List<User> alluser=userservice.select();
			req.getSession().setAttribute("alluser", alluser);	
			return "frontLogin";
		}
		
	//前台登录后跳转
		@RequestMapping("userLogin.do")
		public String afterLogin(String email,String password,HttpServletRequest req,HttpServletResponse resp) {
			User user=userservice.userLogin(email, password);
			HttpSession session=req.getSession();
			if(user!=null) {			
				session.setAttribute("email", user);		
				return "index";
			}
			else {
				return "afterLogin";
			}				
		}
		
	//用户和密码
		@RequestMapping("judgeuser.do")
		public String userLogin(String email,String password,HttpServletRequest req,HttpServletResponse resp) {			
			User user=userservice.userLogin(email, password);
			HttpSession session=req.getSession();
			if(user!=null) {			
				session.setAttribute("email", user);		
				return "index";
			}
			else {
				return "redirect:qiantai.do";
			}	
		}

		//判断用户是否存在
		@RequestMapping("emaillogin.do")
		@ResponseBody
		public Object emaillogin(String id,HttpServletRequest req,HttpServletResponse resp) {
			User user=userservice.selectOne(id)	;
			if(user==null) {
				return "0";
			}
			else {
			return "1";
			}
		}
		
		
		//忘记密码的跳转
		@RequestMapping("forget.do")
		public String forget(String id,HttpServletRequest req,HttpServletResponse resp) {
			User user=userservice.selectOne(id);
			req.getSession().setAttribute("user", user);
			return "peopleCenter";
		}
		
		//修改资料的跳转
		@RequestMapping("updateziliao.do")
		public String updateziliao(String id,HttpServletRequest req,HttpServletResponse resp) {
			User user=userservice.selectOne(id);
			req.getSession().setAttribute("user", user);
			return "updateziliao";
		}
		
		
		//提交修改资料
		@RequestMapping("updateinfo.do")
		public String updateinfo(User user,HttpServletRequest req,HttpServletResponse resp) {
			List<User> alluser=userservice.select();
			req.getSession().setAttribute("alluser", alluser);
			userservice.update(user);
			return "peopleCenter";
		}
		
		//修改头像的跳转
		@RequestMapping("updatetouxiang.do")
		public String updatetouxiang(HttpServletRequest req,HttpServletResponse resp) {
			return "updatetouxiang";
		}
		
		//提交修改头像
		@RequestMapping("committouxiang.do")
		public String committouxiang(User user,HttpServletRequest req,HttpServletResponse resp) {
			user.setUserImgurl("./static/img/"+user.getUserImgurl());
			userservice.update(user);
			req.getSession().setAttribute("user", user);
			User user1 = userservice.selectOne(user.getUserEmail());
			req.getSession().setAttribute("user", user1);
			return "redirect:updateinfo.do";
		}

		//密码安全的跳转
		@RequestMapping("mima.do")
		public String mima(HttpServletRequest req,HttpServletResponse resp) {
			return "mima";
		}
		
		//提交修改密码
		@RequestMapping("commitmima.do")
		public String commitmima(User user,String password,HttpServletRequest req,HttpServletResponse resp) {
			userservice.update(user);
			return "peopleCenter";
		}
		

		//跳转到修改资料
		@RequestMapping("editoru.do")
		public String editoru(User user,String userEmail,HttpServletRequest req,HttpServletResponse resp) {
			req.setAttribute("user",userservice.selectOne(userEmail) );
			return "updateziliao";
		}
				
		//提交修改资料
		@RequestMapping("commitupdate.do")
		public String commitupdate(User user,HttpServletRequest req,HttpServletResponse resp) {
			userservice.update(user);
			return "redirect:forget.do";
		}
		
}
