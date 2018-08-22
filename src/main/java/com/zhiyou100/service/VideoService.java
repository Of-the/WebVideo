package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Video;

public interface VideoService extends BaseService<Video>{

	List<Video> selectSome(Video video );
}
