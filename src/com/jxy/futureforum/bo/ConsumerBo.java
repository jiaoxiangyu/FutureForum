package com.jxy.futureforum.bo;

import java.util.List;

import com.jxy.futureforum.model.Consumer;

public interface ConsumerBo {
	public Boolean add(Consumer consumer);
	public Boolean remove(Consumer consumer);
	public Boolean update(Consumer consumer);
	//查询所有用户的个人信息
	public List<Consumer> seekAll(List<Consumer> list);
	//根据条件查询
	public List<Consumer> seekbyCondition(List<Consumer> list,Consumer consumer);
	//根据id查询用户个人信息
	public Consumer seekbyId(Consumer consumer);
	//获得博客之星
	public List<Consumer> seeAllConsumersByUserId(List<Consumer> list);
	//获得评论之星
	public List<Consumer> seekMaxReplyConsumer(List<Consumer> list);
}
