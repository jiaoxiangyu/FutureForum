package com.jxy.futureforum.bo.impl;

import java.util.List;

import com.jxy.futureforum.bo.ArticleTypeBo;
import com.jxy.futureforum.dao.ArticleTypeDao;
import com.jxy.futureforum.model.ArticleType;

public class ArticleTypeBoImpl implements ArticleTypeBo {
    private ArticleTypeDao articleTypeDao;
    
	public ArticleTypeDao getArticleTypeDao() {
		return articleTypeDao;
	}

	public void setArticleTypeDao(ArticleTypeDao articleTypeDao) {
		this.articleTypeDao = articleTypeDao;
	}

	@Override
	public Boolean add(ArticleType articleType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean remove(ArticleType articleType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean update(ArticleType articleType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ArticleType> seekAll(List<ArticleType> list) {		
		return articleTypeDao.seekAll(list);
	}

	@Override
	public List<ArticleType> seekbyCondition(List<ArticleType> list,ArticleType articleType) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
