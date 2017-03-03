package com.jxy.futureforum.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jxy.futureforum.bo.ReplyBo;
import com.jxy.futureforum.model.Reply;
import com.opensymphony.xwork2.ActionSupport;

public class ReplyAction extends ActionSupport implements SessionAware, ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private Reply reply;
	private ReplyBo replyBo;

	// 提交评论
	public String emitreply() throws Exception {
		int articleId = Integer.valueOf(request.getParameter("articleId"));
		reply.setUserId((Integer) session.get("userId"));
		reply.setArticleId(articleId);
		reply.setUsername((String) session.get("username"));
		Boolean bool = replyBo.add(reply);
		if (bool == true) {
			request.setAttribute("replyMessage", "评论发表成功");
		} else if (bool == false) {
			request.setAttribute("replyMessage", "评论发表失败");
		}
		// 获得评论信息(分页查询评论，开始显示三条)
		List<Reply> list = new ArrayList<Reply>();
		list = replyBo.seekByArticleId(list, articleId);
		// 显示部分评论内容
		/*Boolean bool2 = false;// 判断是否显示“显示全部评论”这个链接
*/		/*for (Reply r : list) {
			if (r.getContent().length() > 100) {
				r.setContent(r.getContent().substring(0, 100)+"...");
				bool2 = true;
			}
		}*/
		/*if (list.size() >= 3) {
			bool2 = true;
		}*/
		if (list.size() > 0) {
			request.setAttribute("replyList", list);
			/*request.setAttribute("bool", bool2);*/
		} else {
			request.setAttribute("emptyMessage", "暂时还没有评论");
		}

		return "emitreply";
	}

	/*
	 * 
	 * getters and setters
	 */
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

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public ReplyBo getReplyBo() {
		return replyBo;
	}

	public void setReplyBo(ReplyBo replyBo) {
		this.replyBo = replyBo;
	}
}
