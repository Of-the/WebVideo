package com.zhiyou100.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou100.model.User;

public interface BaseDao<E> {
	void add(E e);
	void delete(int id);
	void update(E e);
	public E selectOne(String id);	
	List<E> select();
	void deleteAll(@Param("ids")Integer[] ids);
	E login(@Param("name")String name,@Param("password")String password);
}
