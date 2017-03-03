package com.jxy.futureforum.dao.impl;


import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.ArticleDao;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.PageArgs;

public class ArticleDaoImpl implements ArticleDao {
    private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean add(Article article) {
	    Boolean bool=false;		    
	    article.setEmitTime(new Date());
	    article.setLastUpdateTime(new Date());	    	    
		try {				
			sessionFactory.getCurrentSession().save(article);
			bool=true;
		} catch (Exception e) {
			e.printStackTrace();			
		} 
		return bool;
	}

	@Override
	public Boolean remove(Article article) {
		Boolean bool=false;
		try{
			Session session=sessionFactory.getCurrentSession();
			String hql="from Article art where art.articleId="+article.getArticleId();
			Query q=session.createQuery(hql);
			article=(Article)q.list().toArray()[0];
			session.delete(article);
			session.flush();
			bool=true;
		} catch (Exception e) {
			e.printStackTrace();			
		} 
		return bool;
	}

	@Override
	public Boolean update(Article article) {
		Boolean bool=false;
		article.setLastUpdateTime(new Date());
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(article);
			bool=true;
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return bool;
	}

	//分页查询所有博客
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> pageSeekAll(List<Article> list,PageArgs pageArgs) {
		try{
			String hql="from Article art order by art.emitTime desc";
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult((pageArgs.getPageNum()-1)*pageArgs.getPageSize());
			q.setMaxResults(pageArgs.getPageSize());
			list=q.list();			
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	//根据userId分页查询
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> pageSeekByUserId(List<Article> list, Article article,PageArgs pageArgs) {					
		try{
			String hql="from Article art where art.userId="+article.getUserId()+"order by art.emitTime desc";		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult((pageArgs.getPageNum()-1)*pageArgs.getPageSize());
			q.setMaxResults(pageArgs.getPageSize());
			list=q.list();			
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	//获得根据userId查询博客的最大页数
	@Override
	public PageArgs getMaxPageByUserId(PageArgs pageArgs,Article article) {		
		try{
			String hql="select count(*) from Article art where art.userId="+article.getUserId();
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			long count =(long)q.list().toArray()[0];
			long max=count%pageArgs.getPageSize()==0 ? count/pageArgs.getPageSize():count/pageArgs.getPageSize()+1; 
			pageArgs.setMaxPage(max);
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return pageArgs;
	}
	
	//获得条件查询博客的最大页数
	@Override
	public PageArgs getMaxPageByCondition(PageArgs pageArgs, String condition, String conditionCont) {
		try{
			String hql="select count(*) from Article art where art."+condition+" like '%"+conditionCont+"%' ";
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			long count =(long)q.list().toArray()[0];
			long max=count%pageArgs.getPageSize()==0 ? count/pageArgs.getPageSize():count/pageArgs.getPageSize()+1; 
			pageArgs.setMaxPage(max);
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return pageArgs;
	}
		
	//获得查询所有博客的最大页数
	@Override
	public PageArgs getMaxPageAll(PageArgs pageArgs) {
		try{
			String hql="select count(*) from Article art ";
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			long count =(long)q.list().toArray()[0];
			long max=count%pageArgs.getPageSize()==0 ? count/pageArgs.getPageSize():count/pageArgs.getPageSize()+1; 
			pageArgs.setMaxPage(max);
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return pageArgs;
	}

	//查询最新发表的博客（分页查询的第一页）
	@SuppressWarnings("unchecked")
	@Override	
	public List<Article> seekNewArticle(List<Article> list) {
		try{
			String hql="from Article art order by art.emitTime desc";		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult(0);
			q.setMaxResults(4);
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	//获得文章的详细详细
	@Override
	public Article getArticleInfo(Article article) {
		try{
			String hql="from Article art where art.articleId="+article.getArticleId();
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			article=(Article)q.list().toArray()[0];
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return article;
	}

	//查询所有的博客（分页查询的第一页）
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> seekAllArticle(List<Article> list) {
		try{
			String hql="from Article art order by art.emitTime desc";		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult(0);
			q.setMaxResults(6);
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}
	
	//条件查询博客（分页查询的第一页）
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> seekArtByCondition(List<Article> list, String condition,String conditionCont) {
		try{
			String hql="from Article art where art."+condition+" like '%"+conditionCont+"%' order by art.emitTime desc";		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult(0);
			q.setMaxResults(6);
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	//分页条件查询
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> pageSeekByCondition(List<Article> list, String condition, String conditionCont,
			PageArgs pageArgs) {
		try{
			String hql="from Article art where art."+condition+" like '%"+conditionCont+"%' order by art.emitTime desc";	
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			q.setFirstResult((pageArgs.getPageNum()-1)*pageArgs.getPageSize());
			q.setMaxResults(pageArgs.getPageSize());
			list=q.list();			
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;				
	}
    
	//一次查询所有的博客
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> seekAllArticles(List<Article> list) {
		try{
			String hql="from Article art ";		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);			
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}
	
	//根据userId获得用户所有的博客
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> seeAllArtsByUserId(List<Article> list, int userId) {
		try{
			String hql="from Article art where art.userId="+userId;		
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			list=q.list();			
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	
}
