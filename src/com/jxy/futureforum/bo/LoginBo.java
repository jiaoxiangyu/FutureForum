package com.jxy.futureforum.bo;

import java.util.List;

import com.jxy.futureforum.model.User;

public interface LoginBo {
	public List<User> login(User user);
}
