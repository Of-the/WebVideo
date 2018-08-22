package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.CourseDao;
import com.zhiyou100.model.Course;
import com.zhiyou100.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseDao coursedao;
	
	public void add(Course e) {
		coursedao.add(e);
	}

	public void delete(int id) {
		coursedao.delete(id);
	}

	public void update(Course e) {
		coursedao.update(e);
	}


	public Course login(String name, String password) {
		// TODO Auto-generated method stub
		return coursedao.login(name, password);
	}

	public List<Course> select() {
		List<Course> allcourse=coursedao.select();
		return allcourse;
	}

	public void deleteAll(Integer[] ids) {
		// TODO Auto-generated method stub
		coursedao.deleteAll(ids);
	}

	public Course selectOne(String id) {
		// TODO Auto-generated method stub
		return coursedao.selectOne(id);
	}

	public List<Course> selectCourse(String s_id) {
		List<Course> course=coursedao.selectCourse(s_id);
		return course;
	}

	

}
