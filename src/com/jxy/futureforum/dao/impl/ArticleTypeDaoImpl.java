package com.jxy.futureforum.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.ArticleTypeDao;
import com.jxy.futureforum.model.ArticleType;

public class ArticleTypeDaoImpl implements ArticleTypeDao {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
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

	@SuppressWarnings("unchecked")
	public List<ArticleType> seekAll(List<ArticleType> list) {	
		try {
			String hql = " from ArticleType articleType";
			Query q =sessionFactory.getCurrentSession().createQuery(hql);			
			list = q.list();			
		} catch (Exception e) {
			e.printStackTrace();			
		} 		
		return list;
	}
	
	@Override
	public List<ArticleType> seekbyCondition(List<ArticleType> list,ArticleType articleType) {
		// TODO Auto-generated method stub
		return null;
	}
}
