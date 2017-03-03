package com.jxy.futureforum.model;

import java.util.Date;

/*
 * 普通用户
 * 属性：id、头像路径、性别、年龄、注册时间、邮箱、联系电话
 */
public class Consumer extends User {
	private int userId;
	private String headImg;
	private String username;
	private String password;
	private String name;
	private String sex;
	private int age;
	private Date registerTime;
	private String email;
	private String tel;
	private int scanNum;//用户的总访问量
	private long replyNum;//用户评论的总条数
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}	
	public int getScanNum() {
		return scanNum;
	}
	public void setScanNum(int scanNum) {
		this.scanNum = scanNum;
	}
	
	public long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(long replyNum) {
		this.replyNum = replyNum;
	}
	@Override
	public String toString() {
		return "Consumer [userId=" + userId + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", sex=" + sex + ", age=" + age + ", registerTime=" + registerTime + ", email=" + email + ", tel="
				+ tel + "]";
	}	 
}
