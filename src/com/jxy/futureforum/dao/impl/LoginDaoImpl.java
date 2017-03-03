package com.jxy.futureforum.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.jxy.futureforum.dao.LoginDao;
import com.jxy.futureforum.model.User;

public class LoginDaoImpl implements LoginDao {

	private SessionFactory sessionFactory;	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<User> login(User user){
    	List<User> list=new ArrayList<User>();
    	Session session=sessionFactory.getCurrentSession();
    	try {
    		String hql=null;
    		if(user.getSort().equals("管理员")){
    			 hql="from Manager man where man.username=? and man.password=?";	
    		}
    		else if(user.getSort().equals("普通用户")){
    			 hql="from Consumer con where con.username=? and con.password=?";
    		}			
			Query q=session.createQuery(hql);
			q.setParameter(0, user.getUsername());
			q.setParameter(1, user.getPassword());
			list=q.list();								
		} catch (Exception e) {
			e.printStackTrace();		
		}    	
    	return list;
    }

}
