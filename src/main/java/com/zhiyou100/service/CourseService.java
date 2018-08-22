package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseService extends BaseService<Course>{
	List<Course> selectCourse(String s_id);
}
