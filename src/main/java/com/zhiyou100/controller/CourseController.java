package com.zhiyou100.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou100.model.Course;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Subject;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.service.SubjectService;
import com.zhiyou100.service.VideoService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseservice;
	
	@Autowired
	VideoService videoservice;
	
	@Autowired
	SubjectService subjectservice;
	
	@Autowired 
	SpeakerService speakerservice;
	
	//展示course
	@RequestMapping("courseShow.do")
	public String courseShow(String page, HttpServletRequest req,HttpServletResponse resp) {
		if(page == null) {
			page ="1";
		}
		Integer pages = Integer.valueOf(page); 	
		PageHelper.startPage(pages, 5);
		List<Course> allcourse=courseservice.select();
		PageInfo<Course> pageInfo = new PageInfo<Course>(allcourse);
		long total = pageInfo.getTotal();
		int lastPage = pageInfo.getLastPage();
		int pageNum = pageInfo.getPageNum();
		req.getSession().setAttribute("allcourse", allcourse);
		req.getSession().setAttribute("total", total);
		req.getSession().setAttribute("lastPage", lastPage);
		req.getSession().setAttribute("pageNum", pageNum);
		return "course";
	}
	//根据id删除用户信息
	@RequestMapping("deletec.do")
	public String deletec(Integer id,HttpServletRequest req,HttpServletResponse resp) {
		courseservice.delete(id);			
		return "redirect:courseShow.do";
	}
	//添加用户信息
	@RequestMapping("addCourse.do")
	public String addCourse(Course course,String id,HttpServletRequest req,HttpServletResponse resp) {		
		req.setAttribute("course", courseservice.selectOne(id));
		return "addCourse";
	}
	@RequestMapping("insertCourse.do")
	public String insertCourse(Course course,String id,HttpServletRequest req,HttpServletResponse resp) {		
		courseservice.add(course);		
		return "course";
	}
	//编辑页面
	@RequestMapping("editorc.do")
	public String editorc(String id,HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("course", courseservice.selectOne(id));		
		return "editorCourse";
	}
	//提交编辑
	@RequestMapping("commit.do")
	public String commit(Course course,HttpServletRequest req,HttpServletResponse resp) {
		courseservice.update(course);
		return "redirect:courseShow.do";
	}
	
	//批量删除
	@RequestMapping("deletecAll.do")
	public String deletecAll(Integer[] ids,HttpServletRequest req,HttpServletResponse resp) {
		if(ids == null) {
			return "redirect:courseShow.do";
		}
		courseservice.deleteAll(ids);
		return "redirect:courseShow.do";
	}
	
	//首页用户的课程列表
	@RequestMapping("webCourse.do")
	public String webCourse(String s_id,String id,HttpServletRequest req,HttpServletResponse resp) {
		//Video video=videoservice.selectOne(id);
		List<Course> courses=courseservice.selectCourse(s_id);		
		req.getSession().setAttribute("courses", courses);		
		List<Video> videos=videoservice.select();
		req.getSession().setAttribute("videos", videos);	
//		Speaker speaker=speakerservice.selectOne(Integer.toString(video.getSpeakerId()));
//		req.getSession().setAttribute("speaker", speaker);
		return "afterLogin";
	}
	
	//首页用户的视频列表
		@RequestMapping("webVideo.do")
		public String webVideo(String id,HttpServletRequest req,HttpServletResponse resp) {		
			Video video=videoservice.selectOne(id);
			req.getSession().setAttribute("video", video);		
			Course course=courseservice.selectOne(Integer.toString(video.getCourseId()));
			req.getSession().setAttribute("course", course);
			Speaker speaker=speakerservice.selectOne(Integer.toString(video.getSpeakerId()));
			req.getSession().setAttribute("speaker", speaker);
			List<Video> allvideo=videoservice.select();
			req.getSession().setAttribute("allvideo", allvideo);
			return "webVideo";
		}

	
}
