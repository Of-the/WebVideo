package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseDao extends BaseDao<Course> {

	List<Course> selectCourse(String s_id);
}
