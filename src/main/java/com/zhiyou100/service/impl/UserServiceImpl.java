package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.UserDao;
import com.zhiyou100.model.User;
import com.zhiyou100.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userdao;
	
	public void add(User e) {
		userdao.add(e);
	}

	public void delete(int id) {
		userdao.delete(id);
	}

	public void update(User e) {
		userdao.update(e);
	}
	
	public User login(String name, String password) {
		// TODO Auto-generated method stub
		return userdao.login(name, password);
	}

	public List<User> select() {
		List<User> alluser=userdao.select();
		return alluser;
	}

	public void deleteAll(Integer[] ids) {
		// TODO Auto-generated method stub
		userdao.deleteAll(ids);
	}

	public User selectOne(String id) {
		// TODO Auto-generated method stub
		return userdao.selectOne(id);
	}

	public User userLogin(String email, String password) {
		// TODO Auto-generated method stub
		return userdao.userLogin(email, password);
	}

	

	
}
