package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.PageArgs;

public interface ArticleDao {
	public Boolean add(Article article);

	public Boolean remove(Article article);

	public Boolean update(Article article);

	// 根据userId查询最大页数
	public PageArgs getMaxPageByUserId(PageArgs pageArgs, Article article);

	// 根据条件condition查询最大页数
	public PageArgs getMaxPageByCondition(PageArgs pageArgs, String condition, String conditionCont);

	// 查询所有博客的最大页数
	public PageArgs getMaxPageAll(PageArgs pageArgs);

	// 查询所有博客（分页查询的第一页）
	public List<Article> seekAllArticle(List<Article> list);

	// 分页查询所有
	public List<Article> pageSeekAll(List<Article> list, PageArgs pageArgs);

	// 查询最新博客（分页查询的第一页）
	public List<Article> seekNewArticle(List<Article> list);

	// 根据userId分页查询
	public List<Article> pageSeekByUserId(List<Article> list, Article article, PageArgs pageArgs);

	// 根据条件分页查询
	public List<Article> pageSeekByCondition(List<Article> list, String condition, String conditionCont,
			PageArgs pageArgs);

	// 获得博客的内容
	public Article getArticleInfo(Article article);

	// 条件查询博客（分页查询的第一页）
	public List<Article> seekArtByCondition(List<Article> list, String condition, String conditionCont);
	
	//查询所有的博客
	public List<Article> seekAllArticles(List<Article> list);
	
	//根据userId获得用户所有的博客
	public List<Article> seeAllArtsByUserId(List<Article> list,int userId);
}
