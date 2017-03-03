package com.jxy.futureforum.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.ReplyDao;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.model.Reply;

public class ReplyDaoImpl implements ReplyDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean add(Reply reply) {
		Boolean bool=false;
		try{
			reply.setReplyTime(new Date());
			System.out.println(reply);
			sessionFactory.getCurrentSession().save(reply);
			bool=true;
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return bool;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> seekByArticleId(List<Reply> list,int articleId) {
		try{
			String hql="from Reply reply where reply.articleId="+articleId+"order by reply.replyTime desc";
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			/*q.setFirstResult(0);
			q.setMaxResults(3);*/
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean removeByArticleId(int articleId) {
		Boolean bool=false;
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Reply> list=new ArrayList<Reply>();
			String hql="from Reply reply where reply.articleId="+articleId+"order by reply.replyTime desc";
			Query q=session.createQuery(hql);
			list=q.list();
			for(Reply r:list){
				session.delete(r);
				bool=true;
			}
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return bool;
	}

	@Override
	public List<Article> seekbyCondition(List<Article> list, Article article, PageArgs pageArgs) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Article getArticleInfo(Article article) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long seekReplyNumByUserId(int userId) {
		long count=0;
		try{
			String hql="select count(*) from Reply reply where reply.userId="+userId;
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			count=(long)q.list().toArray()[0]; 
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return count;
	}

}
