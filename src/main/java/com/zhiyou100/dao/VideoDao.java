package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Video;

public interface VideoDao extends BaseDao<Video>{

	List<Video> selectSome(Video video );
}
