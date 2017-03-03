package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.Consumer;

public interface ConsumerDao {
	public Boolean add(Consumer consumer);
	public Boolean remove(Consumer consumer);
	public Boolean update(Consumer consumer);
	public List<Consumer> seekAll(List<Consumer> list);//查询所有
	public List<Consumer> seekbyCondition(List<Consumer> list,Consumer consumer);//根据条件查询
	public Consumer seekbyId(Consumer consumer);//根据id查询用户个人信息
	
}
