package com.zhiyou100.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou100.model.Course;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.service.VideoService;

@Controller
public class VideoController {
	
	@Autowired
	VideoService videoservice;
	
	@Autowired
	CourseService courseservice;
	
	@Autowired
	SpeakerService speakerservice;
	//展示页面
	@RequestMapping("videoShow.do")
	public String videoShow(String page,HttpServletRequest req,HttpServletResponse resp) {
		if(page == null) {
			page ="1";
		}
		Integer pages = Integer.valueOf(page); 
		
		PageHelper.startPage(pages, 5);
		List<Video> allvideo=videoservice.select();
		PageInfo<Video> pageInfo = new PageInfo<Video>(allvideo);
		long total = pageInfo.getTotal();
		int lastPage = pageInfo.getLastPage();
		int pageNum = pageInfo.getPageNum();
		req.getSession().setAttribute("allvideo", allvideo);
		req.getSession().setAttribute("total", total);
		req.getSession().setAttribute("lastPage", lastPage);
		req.getSession().setAttribute("pageNum", pageNum);
		return "video";
	}
	
	//根据id删除视频
		@RequestMapping("deletev.do")
		public String deletev(Integer id,HttpServletRequest req,HttpServletResponse resp) {
			videoservice.delete(id);
			return "redirect:videoShow.do";
		}
		
		//跳转到添加视频页
		@RequestMapping("addVideo.do")
		public String addVideo(Video video,HttpServletRequest req,HttpServletResponse resp) {
			return "addVideo";
		}
		
		//添加视频
				@RequestMapping("insertVideo.do")
				public String insertVideo(Video video,HttpServletRequest req,HttpServletResponse resp) {
					videoservice.add(video);
					return "redirect:videoShow.do";
				}
		
		//编辑视频
		@RequestMapping("editorv.do")
		public String editorv(Video video,String id,HttpServletRequest req,HttpServletResponse resp) {
//			req.setAttribute("video", videoservice.selectOne(id));
			req.getSession().setAttribute("video", videoservice.selectOne(id));
			return "editorVideo";
		}
		
		//提交编辑
		@RequestMapping("commitv.do")
		public String commitv(Video video,HttpServletRequest req,HttpServletResponse resp) {
			videoservice.update(video);
			return "redirect:videoShow.do";
		}
		
		//批量删除
		@RequestMapping("deleteVAll.do")
		public String deletevAll(Integer[] ids,HttpServletRequest req,HttpServletResponse resp) {
			if(ids == null) {
				return "redirect:videoShow.do";
			}
			videoservice.deleteAll(ids);
			return "redirect:videoShow.do";
		}
		
		//查询
		@RequestMapping("selectSome.do")
		public String selectSome(String page,Video video,HttpServletRequest req,HttpServletResponse resp) {
			if(page == null) {
				page ="1";
			}
			Integer pages = Integer.valueOf(page); 			
			PageHelper.startPage(pages, 5);
			List<Video> allvideo = videoservice.selectSome(video);
			req.getSession().setAttribute("allvideo", allvideo);
			PageInfo<Video> pageInfo = new PageInfo<Video>(allvideo);
			long total = pageInfo.getTotal();
			int lastPage = pageInfo.getLastPage();
			int pageNum = pageInfo.getPageNum();
			req.getSession().setAttribute("allvideo", allvideo);
			req.getSession().setAttribute("total", total);
			req.getSession().setAttribute("lastPage", lastPage);
			req.getSession().setAttribute("pageNum", pageNum);
			return "video";
		}
			
		
		/*//首页用户的视频列表
		@RequestMapping("webVideo.do")
		public String webVideo(Course course,Video video,HttpServletRequest req,HttpServletResponse resp) {
			List<Course> courses=courseservice.select();
			req.getSession().setAttribute("courses", courses);
			List<Video> videos=videoservice.select();
			req.getSession().setAttribute("videos", videos);
			List<Speaker> speakers=speakerservice.select();
			req.getSession().setAttribute("speakers", speakers);
			return "webVideo";
		}*/
		
	
		
}
