package com.jxy.futureforum.bo.impl;

import java.util.List;

import com.jxy.futureforum.bo.LoginBo;
import com.jxy.futureforum.dao.LoginDao;
import com.jxy.futureforum.model.User;

public class LoginBoImpl implements LoginBo {
    private LoginDao loginDao;
    
	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	@Override
	public List<User> login(User user) {
		return loginDao.login(user);		
	}

}
