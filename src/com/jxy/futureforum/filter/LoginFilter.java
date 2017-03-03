package com.jxy.futureforum.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter extends HttpServlet implements Filter {
	/**
	 * 
	 */
	/** 拦截请求并进行登录有效性验证 */
	/*
	 * public String intercept(ActionInvocation ai) throws Exception {
	 * //取得请求的URL String url =
	 * ServletActionContext.getRequest().getRequestURL().toString();
	 * HttpServletResponse response=ServletActionContext.getResponse();
	 * response.setHeader("Pragma","No-cache");
	 * response.setHeader("Cache-Control","no-cache");
	 * response.setHeader("Cache-Control", "no-store");
	 * response.setDateHeader("Expires",0); String username = null;
	 * //对登录与注销请求直接放行,不予拦截 if (url.indexOf("indexAction.action")!=-1 ||
	 * url.indexOf("loginAction.action")!=-1){ return ai.invoke(); } else{
	 * //验证Session是否过期
	 * if(!ServletActionContext.getRequest().isRequestedSessionIdValid()){
	 * //session过期,转向session过期提示页,最终跳转至登录页面 return "tologin"; } else{ username =
	 * (String)ServletActionContext.getRequest().getSession().getAttribute(
	 * "username"); //验证是否已经登录 if (username==null){ //尚未登录,跳转至登录页面 return
	 * "tologin"; }else{ return ai.invoke();
	 * 
	 * } } } }
	 * 
	 * @Override public void doFilter(ServletRequest arg0, ServletResponse arg1,
	 * FilterChain arg2) throws IOException, ServletException { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void init(FilterConfig arg0) throws ServletException {
	 * // TODO Auto-generated method stub
	 * 
	 * }
	 */

	private static final long serialVersionUID = 1L;

	public void destroy() {
	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain filterChain)
			throws IOException, ServletException {
	
		HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
		HttpSession session = request.getSession();
		String url = request.getServletPath();
		if (url.equals(""))
			url += "/";
		if ((!url.startsWith("/loginAction")) && (!url.startsWith("/indexAction")) && (!url.startsWith("/linkAction_getRegister"))  && (!url.startsWith("/css"))  && (!url.startsWith("/images"))   && (!url.startsWith("/consumerAction_register")) ) {// 若访问后台资源
			System.out.println("========>");																									// 过滤到login  
			String username = (String) session.getAttribute("username");

			/*if (!ServletActionContext.getRequest().isRequestedSessionIdValid()) {
				// session过期,转向session过期提示页,最终跳转至登录页面
				response.sendRedirect("indexAction.action");
				return;
			} else {*/
				if (username == null || username.equals("")) {// 转入管理员登陆页面
					response.sendRedirect("indexAction.action");
					return;
				}
			/*}*/
		}
		filterChain.doFilter(sRequest, sResponse);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}
}