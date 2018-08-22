package com.zhiyou100.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseService<E> {
	void add(E e);
	void delete(int id);
	void update(E e);
	public E selectOne(String id);	
	List<E> select();
	void deleteAll(@Param("ids")Integer[] ids);
	E login(@Param("name")String name,@Param("password")String password);
}
