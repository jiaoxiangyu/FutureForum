package com.jxy.futureforum.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.ScanDao;
import com.jxy.futureforum.model.Scan;

public class ScanDaoImpl implements ScanDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void add(Scan scan) {
		scan.setScanTime(new Date());
		try{
			sessionFactory.getCurrentSession().save(scan);
		}catch(HibernateException e){
			e.printStackTrace();
		}
	}

	@Override
	public List<Scan> seekByArticleId(List<Scan> list, int articleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Scan> seekByViewerId(List<Scan> list, int viewerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int seekViewerNum(int articleId) {
		int count=0;
		try{
			String hql="select count(*) from Scan scan where scan.articleId="+articleId;
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			count =Integer.valueOf(q.list().toArray()[0].toString());
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean removeByArticleId(int articleId) {
		Boolean bool=false;
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Scan> list=new ArrayList<Scan>();
			String hql="from Scan scan where scan.articleId="+articleId;
			Query q=session.createQuery(hql);
			list=q.list();
			for(Scan s:list){
				session.delete(s);
				bool=true;
			}
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return bool;
	}

}
