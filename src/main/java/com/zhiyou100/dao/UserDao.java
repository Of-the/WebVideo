package com.zhiyou100.dao;

import org.apache.ibatis.annotations.Param;

import com.zhiyou100.model.User;

public interface UserDao extends BaseDao<User>{
	User userLogin(@Param("email")String email,@Param("password")String password);
}
