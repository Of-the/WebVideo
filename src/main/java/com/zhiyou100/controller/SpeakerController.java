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
import com.zhiyou100.service.SpeakerService;

@Controller
public class SpeakerController {

	@Autowired
	SpeakerService speakerservice;
	
	//主讲人展示
	@RequestMapping("speakerShow.do")
	public String speakerShow(String page,HttpServletRequest req,HttpServletResponse resp) {
		if(page == null) {
			page ="1";
		}
		Integer pages = Integer.valueOf(page); 
		
		PageHelper.startPage(pages, 5);
		List<Speaker> allspeaker=speakerservice.select();
		PageInfo<Speaker> pageInfo = new PageInfo<Speaker>(allspeaker);
		long total = pageInfo.getTotal();
		int lastPage = pageInfo.getLastPage();
		int pageNum = pageInfo.getPageNum();
		req.getSession().setAttribute("allspeaker", allspeaker);
		req.getSession().setAttribute("total", total);
		req.getSession().setAttribute("lastPage", lastPage);
		req.getSession().setAttribute("pageNum", pageNum);
		return "speaker";
	}
	
	//根据id删除主讲人
	@RequestMapping("deletes.do")
	public String deletes(Integer id,HttpServletRequest req,HttpServletResponse resp) {
		speakerservice.delete(id);
		return "redirect:speakerShow.do";
	}
	
	//添加主讲人
	@RequestMapping("addSpeaker.do")
	public String addSpeaker(Speaker speaker,String id,HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("speaker", speakerservice.selectOne(id));
		return "addSpeaker";
	}
	
	
	@RequestMapping("insertSpeaker.do")
	public String insertSpeaker(Speaker speaker,String id,HttpServletRequest req,HttpServletResponse resp) {
		speakerservice.add(speaker);
		return "redirect:speakerShow.do";
	}
	
	
	//编辑主讲人
	@RequestMapping("editorSpeaker.do")
	public String editorSpeaker(String id,HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("speaker", speakerservice.selectOne(id));
		return "editorSpeaker";
	}
	//提交编辑
	@RequestMapping("commits.do")
	public String commits(Speaker speaker,HttpServletRequest req,HttpServletResponse resp) {
		speakerservice.update(speaker);
		return "redirect:speakerShow.do";
	}
	
	
	//批量删除
	@RequestMapping("deletesAll.do")
	public String deleteAll(Integer[] ids,HttpServletRequest req,HttpServletResponse resp) {
		if(ids == null) {
			return "redirect:speakerShow.do";
		}
		speakerservice.deleteAll(ids);
		return "redirect:speakerShow.do";
	}
}
