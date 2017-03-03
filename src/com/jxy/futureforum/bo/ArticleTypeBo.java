package com.jxy.futureforum.bo;

import java.util.List;

import com.jxy.futureforum.model.ArticleType;

/*
 * 增删改查业务层接口
 */
public interface ArticleTypeBo {
	public Boolean add(ArticleType articleType);
	public Boolean remove(ArticleType articleType);
	public Boolean update(ArticleType articleType);
	//查询所有
	public List<ArticleType> seekAll(List<ArticleType> list);
	//根据条件查询
	public List<ArticleType> seekbyCondition(List<ArticleType> list,ArticleType articleType);
}
