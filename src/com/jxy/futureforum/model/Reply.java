package com.jxy.futureforum.model;

import java.util.Date;

/*
 * 文章回复信息类
 * 属性：Id、回复时间、回复内容、用户Id、文章Id
 */
public class Reply {
	private int replayId;
	private Date replyTime;
	private String content;
	private int userId;
	private String username;
	private int articleId;
	public int getReplayId() {
		return replayId;
	}
	public void setReplayId(int replayId) {
		this.replayId = replayId;
	}	
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	@Override
	public String toString() {
		return "Reply [replayId=" + replayId + ", replyTime=" + replyTime + ", content=" + content + ", userId="
				+ userId + ", username=" + username + ", articleId=" + articleId + "]";
	}    
}
