package com.jxy.futureforum.bo.impl;

import java.util.ArrayList;
import java.util.List;

import com.jxy.futureforum.bo.ArticleBo;
import com.jxy.futureforum.bo.ConsumerBo;
import com.jxy.futureforum.bo.ReplyBo;
import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.dao.ConsumerDao;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.Consumer;

public class ConsumerBoImpl implements ConsumerBo {
    private ConsumerDao consumerDao;
    private ArticleBo articleBo;
    private ScanBo scanBo;
    private ReplyBo replyBo;
    
	public ConsumerDao getConsumerDao() {
		return consumerDao;
	}

	public void setConsumerDao(ConsumerDao consumerDao) {
		this.consumerDao = consumerDao;
	}
	
	public ArticleBo getArticleBo() {
		return articleBo;
	}

	public void setArticleBo(ArticleBo articleBo) {
		this.articleBo = articleBo;
	}
		
	public ScanBo getScanBo() {
		return scanBo;
	}

	public void setScanBo(ScanBo scanBo) {
		this.scanBo = scanBo;
	}

	public ReplyBo getReplyBo() {
		return replyBo;
	}

	public void setReplyBo(ReplyBo replyBo) {
		this.replyBo = replyBo;
	}

	@Override
	public Boolean add(Consumer consumer) {
		return consumerDao.add(consumer);
	}

	@Override
	public Boolean remove(Consumer consumer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean update(Consumer consumer) {
		
		return consumerDao.update(consumer);
	}

	@Override
	public List<Consumer> seekAll(List<Consumer> list) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Consumer> seekbyCondition(List<Consumer> list, Consumer consumer) {		
		return consumerDao.seekbyCondition(list, consumer);
	}

	@Override
	public Consumer seekbyId(Consumer consumer) {		
		return consumerDao.seekbyId(consumer);
	}
	//获得博客之星
		@Override
		public List<Consumer> seeAllConsumersByUserId(List<Consumer> list) {
			list=consumerDao.seekAll(list);
			System.out.println("consumerlist:"+list);
			List<Article> articleList=new ArrayList<Article>();
			for(Consumer c:list){
				articleList=articleBo.seeAllArtsByUserId(articleList, c.getUserId());
				int sum=0;//总访问量
			    for(Article a:articleList){
			    	int count =scanBo.seekViewerNum(a.getArticleId());
			    	sum+=count;
			    }
			    c.setScanNum(sum);
			}
			
			List<Consumer> newList=new ArrayList<Consumer>();
			Consumer newConsumer=new Consumer();
			for(int i=1;i<list.size();i++){
				for(int j=0;j<list.size()-i;j++){
					if(list.get(j).getScanNum()<list.get(j+1).getScanNum()){
						newConsumer=list.get(j);
						list.set(j, list.get(j+1));
						list.set(j+1, newConsumer);
					}
				}
				
			}
			if(list.size()>8){
				for(int k=0;k<8;k++){
					newList.add(list.get(k));
				}
				return newList;
			}
			else{
				return list;
			}
		}

		@Override
		public List<Consumer> seekMaxReplyConsumer(List<Consumer> list) {
			list=consumerDao.seekAll(list);
			long count=0;//评论条数
			for(Consumer c:list){
				count=replyBo.seekReplyNumByUserId(c.getUserId());
				c.setReplyNum(count);;
			}
			//排序
			List<Consumer> newList=new ArrayList<Consumer>();
			Consumer newConsumer=new Consumer();
			for(int i=1;i<list.size();i++){
				for(int j=0;j<list.size()-i;j++){
					if(list.get(j).getReplyNum()<list.get(j+1).getReplyNum()){
						newConsumer=list.get(j);
						list.set(j, list.get(j+1));
						list.set(j+1, newConsumer);
					}
				}
				
			}
			if(list.size()>8){
				for(int k=0;k<8;k++){
					newList.add(list.get(k));
				}
				return newList;
			}
			else{
				return list;
			}
		}

		
}
