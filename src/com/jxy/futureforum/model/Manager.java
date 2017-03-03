package com.jxy.futureforum.model;

import java.util.Date;

/*
 * 管理员类
 * 属性：id、性别、年龄、注册时间、邮箱、联系电话
 */
public class Manager extends User{
	private int managerId;
	private String name;
	private String sex;
	private int age;
	private Date registerTime;
	private String email;
	private String tel;
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
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
	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", name=" + name + ", sex=" + sex + ", age=" + age
				+ ", registerTime=" + registerTime + ", email=" + email + ", tel=" + tel + "]";
	}
}
