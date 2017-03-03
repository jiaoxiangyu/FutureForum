package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.User;

public interface LoginDao {
	public List<User> login(User user);
}
