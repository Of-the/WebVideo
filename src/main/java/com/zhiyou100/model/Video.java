package com.zhiyou100.model;

public class Video {
	private Integer videoId;
	private String videoTitle;
	private String videoDesc;
	private Integer videoTime;
	private Integer speakerId;
	private Integer courseId;
	private String videoUrl;
	private String videoImgUrl;
	private String videoPlayNum;
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public String getVideoDesc() {
		return videoDesc;
	}
	public void setVideoDesc(String videoDesc) {
		this.videoDesc = videoDesc;
	}
	public Integer getVideoTime() {
		return videoTime;
	}
	public void setVideoTime(Integer videoTime) {
		this.videoTime = videoTime;
	}
	public Integer getSpeakerId() {
		return speakerId;
	}
	public void setSpeakerId(Integer speakerId) {
		this.speakerId = speakerId;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public String getVideoImgUrl() {
		return videoImgUrl;
	}
	public void setVideoImgUrl(String videoImgUrl) {
		this.videoImgUrl = videoImgUrl;
	}
	public String getVideoPlayNum() {
		return videoPlayNum;
	}
	public void setVideoPlayNum(String videoPlayNum) {
		this.videoPlayNum = videoPlayNum;
	}
	
}
