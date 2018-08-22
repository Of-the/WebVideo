package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SpeakerDao;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService{
@Autowired
    SpeakerDao speakerdao;
	
	public void add(Speaker e) {
		speakerdao.add(e);
	}

	public void delete(int id) {
		speakerdao.delete(id);
	}

	public void update(Speaker e) {
		speakerdao.update(e);
	}

	public Speaker login(String name, String password) {
		// TODO Auto-generated method stub
		return speakerdao.login(name, password);
	}

	public List<Speaker> select() {
		List<Speaker> allspeaker=speakerdao.select();
		return allspeaker;
	}

	public void deleteAll(Integer[] ids) {
		// TODO Auto-generated method stub
		speakerdao.deleteAll(ids);
	}

	public Speaker selectOne(String id) {
		// TODO Auto-generated method stub
		return speakerdao.selectOne(id);
	}

}
