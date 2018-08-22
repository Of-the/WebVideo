package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.VideoDao;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoDao videodao;
	
	public void add(Video e) {
		videodao.add(e);
	}

	public void delete(int id) {
		videodao.delete(id);
		
	}

	public void update(Video e) {
		videodao.update(e);
	}

	public Video login(String name, String password) {
		// TODO Auto-generated method stub
		return videodao.login(name, password);
	}

	public List<Video> select() {
		List<Video> allvideo=videodao.select();
		return allvideo;
	}

	public void deleteAll(Integer[] ids) {
		// TODO Auto-generated method stub
		videodao.deleteAll(ids);
	}

	public Video selectOne(String id) {
		// TODO Auto-generated method stub
		return videodao.selectOne(id);
	}

	public List<Video> selectSome(Video video) {
		return videodao.selectSome(video);
	}

	


}
