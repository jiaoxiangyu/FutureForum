package com.jxy.futureforum.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jxy.futureforum.bo.LoginBo;
import com.jxy.futureforum.model.User;
import com.jxy.futureforum.tool.Md5;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request; 
    private User user;
    private LoginBo loginBo;
    private Map<String,Object> session;
    
    //登录
    public String execute() throws Exception{
		List<User> list=new ArrayList<User>();
		String pwd=new Md5().md5(user.getPassword());
		user.setPassword(pwd);
		list=loginBo.login(user);				
		if(list.size()>0){	
			session.put("sort", user.getSort());
			session.put("username", list.get(0).getUsername());
			session.put("userId", list.get(0).getUserId());
			return SUCCESS;
		}else{
			request.setAttribute("message", "用户名或密码错误");
			
			return INPUT;
		}				
	}	
    
    public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public LoginBo getLoginBo() {
		return loginBo;
	}
	public void setLoginBo(LoginBo loginBo) {
		this.loginBo = loginBo;
	}		
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
