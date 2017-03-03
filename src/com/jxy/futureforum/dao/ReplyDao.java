package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.model.Reply;

public interface ReplyDao {
	public Boolean add(Reply reply);

	public List<Reply> seekByArticleId(List<Reply> list, int articleId);

	public Boolean removeByArticleId(int articleId);

	// 根据条件分页查询
	public List<Article> seekbyCondition(List<Article> list, Article article, PageArgs pageArgs);

	// 获得博客的内容
	public Article getArticleInfo(Article article);
	
	//根据userId查询评论条数
    public long seekReplyNumByUserId(int userId);
}
