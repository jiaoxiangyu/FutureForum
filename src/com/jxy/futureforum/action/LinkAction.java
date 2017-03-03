package com.jxy.futureforum.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jxy.futureforum.bo.ArticleBo;
import com.jxy.futureforum.bo.ArticleTypeBo;
import com.jxy.futureforum.bo.ConsumerBo;
import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.ArticleType;
import com.jxy.futureforum.model.Consumer;
import com.jxy.futureforum.model.PageArgs;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 链接控制层
 * 
 */
public class LinkAction extends ActionSupport implements SessionAware, ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private ArticleTypeBo articleTypeBo;
	private ArticleBo articleBo;
	private ConsumerBo consumerBo;
	private ScanBo scanBo;

	

	// 发表博客前，获得博客所有类型
	public String getAllArticleType() throws Exception {
		List<ArticleType> articleTypelist = new ArrayList<ArticleType>();
		articleTypelist = articleTypeBo.seekAll(articleTypelist);
		session.put("articleTypelist", articleTypelist);
		return "getAllArticleType";
	}
    
	//获得排行榜页面的信息
	public String rankList() throws Exception{
		//获得最热博客
		List<Article> articleList=new ArrayList<Article>();
		articleList=articleBo.seekAllArticles(articleList);
		request.setAttribute("articleList", articleList);
		//获得博客之星
		List<Consumer> consumerList=new ArrayList<Consumer>();
		consumerList=consumerBo.seeAllConsumersByUserId(consumerList);
		request.setAttribute("consumerList",consumerList);
		//获得评论之星
		List<Consumer> repyconsumerList=new ArrayList<Consumer>();
		repyconsumerList=consumerBo.seekMaxReplyConsumer(repyconsumerList);
		request.setAttribute("repyconsumerList",repyconsumerList);		
		return "rankList";
	}
	
	//分类的链接
	public String typeLink() throws Exception{
		int No=Integer.valueOf(request.getParameter("No"));
		String articleTypeName=null;
		if(No==1){
			articleTypeName="移动开发";
		}
		else if(No==2){
			articleTypeName="Web前端";
		}
		else if(No==3){
			articleTypeName="构架设计";
		}
		else if(No==4){
			articleTypeName="编程语言";
		}
		else if(No==5){
			articleTypeName="互联网";
		}
		else if(No==6){
			articleTypeName="数据库";
		}
		else if(No==7){
			articleTypeName="系统运维";
		}
		else if(No==8){
			articleTypeName="云计算";
		}
		else if(No==9){
			articleTypeName="研发管理";
		}
		else {
			articleTypeName="综合";
		}
		session.put("condition","articleTypeName");
		session.put("conditionCont", articleTypeName);
		PageArgs pageArgs = new PageArgs();
		pageArgs.setPageSize(6);
		pageArgs = articleBo.getMaxPageByCondition(pageArgs,"articleTypeName", articleTypeName);
		pageArgs.setPageNum(1);
		session.put("pageArgs", pageArgs);
		List<Article> list=new ArrayList<Article>();
		list = articleBo.seekArtByCondition(list, "articleTypeName", articleTypeName);
		request.setAttribute("articleList", list);
		return "typeLink";
	}
	
	// 链接到注册页面
	public String getRegister() throws Exception {
		return "getRegister";
	}

	// 退出登录
	public String logout() throws Exception {
		session.clear();		
		return "logout";
	}

	/*
	 * getters and setters
	 * 
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public ArticleTypeBo getArticleTypeBo() {
		return articleTypeBo;
	}

	public void setArticleTypeBo(ArticleTypeBo articleTypeBo) {
		this.articleTypeBo = articleTypeBo;
	}

	public ArticleBo getArticleBo() {
		return articleBo;
	}

	public void setArticleBo(ArticleBo articleBo) {
		this.articleBo = articleBo;
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
