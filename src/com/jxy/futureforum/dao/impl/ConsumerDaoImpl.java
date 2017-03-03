package com.jxy.futureforum.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.ConsumerDao;
import com.jxy.futureforum.model.Consumer;

public class ConsumerDaoImpl implements ConsumerDao {
    private SessionFactory sessionFactory;
    
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean add(Consumer consumer) {
		Boolean bool=false;
		consumer.setHeadImg("user/default.png");
		consumer.setRegisterTime(new Date());
		try{
			sessionFactory.getCurrentSession().save(consumer);
			bool=true;
		}catch(HibernateException e){
			e.printStackTrace();
		}		
		return bool;
	}

	@Override
	public Boolean remove(Consumer consumer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean update(Consumer consumer) {
		Boolean bool=false;		
		try{	
			sessionFactory.getCurrentSession().saveOrUpdate(consumer);
			sessionFactory.getCurrentSession().flush();
			bool=true;			
		}catch(HibernateException e){
			e.printStackTrace();
		}		
		return bool;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Consumer> seekAll(List<Consumer> list) {
		try{
			String hql="from Consumer consumer";
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Consumer> seekbyCondition(List<Consumer> list, Consumer consumer) {
		String hql=null;
		if(consumer.getUserId()!=0){
			hql="from Consumer consumer where consumer.userId="+consumer.getUserId();
		}
		try{
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			list=q.list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return list;
	}
	
	//根据id查询用户个人信息
	@Override	
	public Consumer seekbyId(Consumer consumer) {
		try{
			String hql="from Consumer consumer where consumer.userId="+consumer.getUserId();
			Query q=sessionFactory.getCurrentSession().createQuery(hql);
			consumer=(Consumer)q.list().toArray()[0];
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return consumer;
	}

	

}
