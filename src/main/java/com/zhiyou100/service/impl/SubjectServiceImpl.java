package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SubjectDao;
import com.zhiyou100.model.Subject;
import com.zhiyou100.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	SubjectDao subjectdao;
	
	public void add(Subject e) {
		// TODO Auto-generated method stub
		subjectdao.add(e);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		subjectdao.delete(id);
	}

	public void update(Subject e) {
		// TODO Auto-generated method stub
		subjectdao.update(e);
	}

	

	public List<Subject> select() {
		List<Subject> subject=subjectdao.select();
		return subject;
	}

	public Subject login(String name, String password) {
		// TODO Auto-generated method stub
		return subjectdao.login(name, password);
	}

	public void deleteAll(Integer[] ids) {
		// TODO Auto-generated method stub
		subjectdao.deleteAll(ids);
	}

	public Subject selectOne(String id) {
		// TODO Auto-generated method stub
		return subjectdao.selectOne(id);
	}



}
