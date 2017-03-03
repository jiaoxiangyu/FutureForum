package com.jxy.futureforum.model;

import java.util.Date;

/*
 * 文章浏览信息类
 * 属性：Id、浏览时间、浏览文章Id
 */
public class Scan {
	private int scanId;
	private Date scanTime;
	private int articleId;
	private int viewerId;//浏览者id
	private String viewer;//浏览者
	public int getScanId() {
		return scanId;
	}
	public void setScanId(int scanId) {
		this.scanId = scanId;
	}
	public Date getScanTime() {
		return scanTime;
	}
	public void setScanTime(Date scanTime) {
		this.scanTime = scanTime;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}		
	public int getViewerId() {
		return viewerId;
	}
	public void setViewerId(int viewerId) {
		this.viewerId = viewerId;
	}
	public String getViewer() {
		return viewer;
	}
	public void setViewer(String viewer) {
		this.viewer = viewer;
	}
	@Override
	public String toString() {
		return "Scan [scanId=" + scanId + ", scanTime=" + scanTime + ", articleId=" + articleId + ", viewerId="
				+ viewerId + ", viewer=" + viewer + "]";
	}   
}
