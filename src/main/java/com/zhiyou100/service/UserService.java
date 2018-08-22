package com.zhiyou100.service;

import org.apache.ibatis.annotations.Param;

import com.zhiyou100.model.User;

public interface UserService extends BaseService<User>{

	User userLogin(@Param("email")String email,@Param("password")String password);
	
	
}
