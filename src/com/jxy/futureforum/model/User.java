package com.jxy.futureforum.model;

/*
 * 用户信息类
 * 属性：id、用户名、登录密码、
 */
public class User {
	private int userId;
	private String username;
	private String password;
	private String sort;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", sort=" + sort + "]";
	}
			
}
