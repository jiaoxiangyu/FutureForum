package com.jxy.futureforum.model;
/*
 * 文章类型信息类
 * 属性：Id、文章类型名称、文章类型描述
 */
public class ArticleType {
	private int articleTypeId;
	private String articleTypeName;
	private String articleTypeDescrip;
	
	public int getArticleTypeId() {
		return articleTypeId;
	}

	public void setArticleTypeId(int articleTypeId) {
		this.articleTypeId = articleTypeId;
	}

	public String getArticleTypeName() {
		return articleTypeName;
	}

	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}

	public String getArticleTypeDescrip() {
		return articleTypeDescrip;
	}

	public void setArticleTypeDescrip(String articleTypeDescrip) {
		this.articleTypeDescrip = articleTypeDescrip;
	}

	@Override
	public String toString() {
		return "ArticleType [articleTypeId=" + articleTypeId + ", articleTypeName=" + articleTypeName
				+ ", articleTypeDescrip=" + articleTypeDescrip + "]";
	}
	
}
