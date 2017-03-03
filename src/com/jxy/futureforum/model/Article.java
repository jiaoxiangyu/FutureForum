package com.jxy.futureforum.model;

import java.util.Date;

/*
 * 文章信息类
 * 属性：Id、文章标题、文章内容、发表时间、最后更新时间、文章类型名称、用户Id；
 */
public class Article {
	private int articleId;
	private String title;
	private String content;
	private Date emitTime;
	private Date lastUpdateTime;
	private String articleTypeName;
	private int userId;
	private String username;
	private int scanNum;//浏览次数
	private String headImg;//临时变量：作者的头像路径
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public String getsubContent(){
		if(content.length()>125){
			return content.substring(0, 125)+"...";
		}
		else{
			return content;
		}
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEmitTime() {
		return emitTime;
	}
	public void setEmitTime(Date emitTime) {
		this.emitTime = emitTime;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public String getArticleTypeName() {
		return articleTypeName;
	}
	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
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
	public int getScanNum() {
		return scanNum;
	}
	public void setScanNum(int scanNum) {
		this.scanNum = scanNum;
	}	
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", title=" + title + ", content=" + content + ", emitTime="
				+ emitTime + ", lastUpdateTime=" + lastUpdateTime + ", articleTypeName=" + articleTypeName + ", userId="
				+ userId + ", username=" + username + ", scanNum=" + scanNum + "]";
	}	
}
