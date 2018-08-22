package com.zhiyou100.model;

public class Speaker {
	private Integer speakerId;
	private String speakerName;
	private String speakerDesc;
	private String speakerJob;
	private String speakerHeadUrl;
	
	public Integer getSpeakerId() {
		return speakerId;
	}
	public void setSpeakerId(Integer speakerId) {
		this.speakerId = speakerId;
	}
	public String getSpeakerName() {
		return speakerName;
	}
	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}
	public String getSpeakerDesc() {
		return speakerDesc;
	}
	public void setSpeakerDesc(String speakerDesc) {
		this.speakerDesc = speakerDesc;
	}
	public String getSpeakerJob() {
		return speakerJob;
	}
	public void setSpeakerJob(String speakerJob) {
		this.speakerJob = speakerJob;
	}
	public String getSpeakerHeadUrl() {
		return speakerHeadUrl;
	}
	public void setSpeakerHeadUrl(String speakerHeadUrl) {
		this.speakerHeadUrl = speakerHeadUrl;
	}
	@Override
	public String toString() {
		return "Speaker [speakerId=" + speakerId + ", speakerName=" + speakerName + ", speakerDesc=" + speakerDesc
				+ ", speakerJob=" + speakerJob + ", speakerHeadUrl=" + speakerHeadUrl + "]";
	}
	
	
}
