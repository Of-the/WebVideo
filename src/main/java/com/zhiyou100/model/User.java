package com.zhiyou100.model;

import java.sql.Timestamp;

public class User {
	private Integer userId;
	private String userEmail;
	private String userPhone;
	private String userPassword;
	private String userNickname;
	private String userSex;
	private String userBirthday;
	private String userAddress;
	private String userImgurl;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserImgurl() {
		return userImgurl;
	}
	public void setUserImgurl(String userImgurl) {
		this.userImgurl = userImgurl;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userPassword="
				+ userPassword + ", userNickname=" + userNickname + ", userSex=" + userSex + ", userBirthday="
				+ userBirthday + ", userAddress=" + userAddress + ", userImgurl=" + userImgurl + "]";
	}


	
}
