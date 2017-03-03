package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.ArticleType;

public interface ArticleTypeDao {
	public Boolean add(ArticleType articleType);
	public Boolean remove(ArticleType articleType);
	public Boolean update(ArticleType articleType);
	public List<ArticleType> seekAll(List<ArticleType> list);//查询所有
	public List<ArticleType> seekbyCondition(List<ArticleType> list,ArticleType articleType);//根据条件查询
}
