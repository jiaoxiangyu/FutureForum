package com.jxy.futureforum.bo.impl;


import java.util.ArrayList;
import java.util.List;

import com.jxy.futureforum.bo.ArticleBo;
import com.jxy.futureforum.bo.ConsumerBo;
import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.dao.ArticleDao;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.Consumer;
import com.jxy.futureforum.model.PageArgs;

public class ArticleBoImpl implements ArticleBo {
    private ArticleDao articleDao;
    private ConsumerBo consumerBo;
    private ScanBo scanBo;
	
	@Override
	public Boolean add(Article article) {			
		return articleDao.add(article);
	}

	@Override
	public Boolean remove(Article article) {
		return articleDao.remove(article);
	}

	@Override
	public Boolean update(Article article) {		
		return articleDao.update(article);
	}

	@Override
	public List<Article> pageSeekAll(List<Article> list,PageArgs pageArgs) {
		list=articleDao.pageSeekAll(list, pageArgs);
		for(Article a:list){
			//获得浏览次数
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
			//获得作者头像
			Consumer consumer=new Consumer();
			consumer.setUserId(a.getUserId());
			consumer=consumerBo.seekbyId(consumer);
			a.setHeadImg(consumer.getHeadImg());			
		}
		return list;
	}

	@Override
	public List<Article> pageSeekByUserId(List<Article> list, Article article,PageArgs pageArgs) {
		list=articleDao.pageSeekByUserId(list, article,pageArgs);
		//获得博客浏览次数
		for(Article a:list){
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
		}
		return list;
	}

	@Override
	public PageArgs getMaxPageByUserId(PageArgs pageArgs,Article article) {		
		return articleDao.getMaxPageByUserId(pageArgs, article);
	}
	
	@Override
	public PageArgs getMaxPageByCondition(PageArgs pageArgs, String condition, String conditionCont) {
		String newcondition=judge(conditionCont);
		/*if(condition.equals("标题")){
			newcondition="title";			
		}
		else if(condition.equals("作者")){
			newcondition="username";			
		}
		else if(condition.equals("类型")){
			newcondition="articleTypeName";			
		}
		else if(condition.equals("title")){
			newcondition="title";
		}
		else{
			newcondition="articleTypeName";		
		}*/
		return articleDao.getMaxPageByCondition(pageArgs, newcondition, conditionCont);
	}

	@Override
	public PageArgs getMaxPageAll(PageArgs pageArgs) {		
		return articleDao.getMaxPageAll(pageArgs);
	}
	
	@Override
	public List<Article> seekAllArticle(List<Article> list) {
		list=articleDao.seekAllArticle(list);
		for(Article a:list){
			//获得浏览次数
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
			//获得作者头像
			Consumer consumer=new Consumer();
			consumer.setUserId(a.getUserId());
			consumer=consumerBo.seekbyId(consumer);
			a.setHeadImg(consumer.getHeadImg());			
		}
		return list;
	}

	
	//获得最新博客
	@Override
	public List<Article> seekNewArticle(List<Article> list) {
		list=articleDao.seekNewArticle(list);
		for(Article a:list){
			int count=scanBo.seekViewerNum(a.getArticleId());//获得浏览次数
			a.setScanNum(count);
			//获得作者头像
			Consumer consumer=new Consumer();
			consumer.setUserId(a.getUserId());
			consumer=consumerBo.seekbyId(consumer);
			a.setHeadImg(consumer.getHeadImg());			
		}
		return list;
	}

	@Override
	public Article getArticleInfo(Article article) {	
		return articleDao.getArticleInfo(article);
	}
	
	
	@Override
	public List<Article> seekArtByCondition(List<Article> list, String condition,String conditionCont) {
		String newcondition=judge(conditionCont);
		/*if(condition.equals("标题")){
			newcondition="title";			
		}
		else if(condition.equals("作者")){
			newcondition="username";			
		}
		else if(condition.equals("类型")){
			newcondition="articleTypeName";			
		}	
		else if(condition.equals("title")){
			newcondition="title";
		}
		else{
			newcondition="articleTypeName";		
		}*/
		list=articleDao.seekArtByCondition(list, newcondition, conditionCont);
		for(Article a:list){
			//获得浏览次数
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
			//获得作者头像
			Consumer consumer=new Consumer();
			consumer.setUserId(a.getUserId());
			consumer=consumerBo.seekbyId(consumer);
			a.setHeadImg(consumer.getHeadImg());			
		}
		return list;
	}
	
	@Override
	public List<Article> pageSeekByCondition(List<Article> list, String condition, String conditionCont,
			PageArgs pageArgs) {
		String newcondition=judge(conditionCont);
		/*if(condition.equals("标题")){
			newcondition="title";			
		}
		else if(condition.equals("作者")){
			newcondition="username";			
		}
		else if(condition.equals("类型")){
			newcondition="articleTypeName";			
		}
		else if(condition.equals("title")){
			newcondition="title";
		}
		else{
			newcondition="articleTypeName";		
		}*/
		list=articleDao.pageSeekByCondition(list, newcondition, conditionCont, pageArgs);
		for(Article a:list){
			//获得浏览次数
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
			//获得作者头像
			Consumer consumer=new Consumer();
			consumer.setUserId(a.getUserId());
			consumer=consumerBo.seekbyId(consumer);
			a.setHeadImg(consumer.getHeadImg());			
		}
		return list;
	}
	
	//获得最热博客
	@Override
	public List<Article> seekAllArticles(List<Article> list) {
		//获得所有博客
		list=articleDao.seekAllArticles(list);
		for(Article a:list){
			//获得浏览次数
			int count=scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
			if(a.getTitle().length()>8){
				a.setTitle(a.getTitle().substring(0,8)+"...");
			}
		}
		//根据浏览量排序
		List<Article> newList=new ArrayList<Article>();
		Article newArticle=new Article();
		for(int i=1;i<list.size();i++){
			for(int j=0;j<list.size()-i;j++){
				if(list.get(j).getScanNum()<list.get(j+1).getScanNum()){
					newArticle=list.get(j);
					list.set(j, list.get(j+1));
					list.set(j+1, newArticle);
				}
			}
			
		}
		if(list.size()>9){
			for(int k=0;k<10;k++){
				newList.add(list.get(k));
			}
			return newList;
		}
		else{
			return list;
		}
		
	}
	@Override
	public List<Article> seeAllArtsByUserId(List<Article> list, int userId) {		
		return articleDao.seeAllArtsByUserId(list, userId);
	}

	
	/*
	 * tool
	 */
	public String  judge(String condition){
		String newcondition=null;
		if(condition.equals("标题")){
			newcondition="title";			
		}
		else if(condition.equals("作者")){
			newcondition="username";			
		}
		else if(condition.equals("类型")){
			newcondition="articleTypeName";			
		}
		else if(condition.equals("title")){
			newcondition="title";
		}
		else{
			newcondition="articleTypeName";		
		}
		return newcondition;
	}
	/*
	 * getters and setters
	 * 
	 */
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public ConsumerBo getConsumerBo() {
		return consumerBo;
	}

	public void setConsumerBo(ConsumerBo consumerBo) {
		this.consumerBo = consumerBo;
	}

	public ScanBo getScanBo() {
		return scanBo;
	}

	public void setScanBo(ScanBo scanBo) {
		this.scanBo = scanBo;
	}

	

	

	

	


	
	
}
