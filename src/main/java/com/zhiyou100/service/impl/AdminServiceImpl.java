package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.AdminDao;
import com.zhiyou100.model.Admin;
import com.zhiyou100.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao admindao;
	
	public void add(Admin e) {
		admindao.add(e);
	}

	public void delete(int id) {
		admindao.delete(id);
	}

	public void update(Admin e) {
		admindao.update(e);
	}

	public Admin login(String name, String password) {
		
		return admindao.login(name, password);
	}

	public List<Admin> select() {
		List<Admin> alladmin=admindao.select();
		return alladmin;
	}

	public void deleteAll(Integer[] ids) {
		admindao.deleteAll(ids);
		
	}

	public Admin selectOne(String id) {
		// TODO Auto-generated method stub
		return admindao.selectOne(id);
	}



}
