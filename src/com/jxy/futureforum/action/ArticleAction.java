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
import com.jxy.futureforum.bo.ReplyBo;
import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.ArticleType;
import com.jxy.futureforum.model.Consumer;
import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.model.Reply;
import com.jxy.futureforum.model.Scan;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport implements SessionAware, ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Article article;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private ArticleBo articleBo;
	private ArticleTypeBo articleTypeBo;
	private ReplyBo replyBo;
	private ScanBo scanBo;
	private ConsumerBo consumerBo;

	// 首页、查询最新博客
	public String seekNewArticle() throws Exception {
		List<Article> list = new ArrayList<Article>();
		list = articleBo.seekNewArticle(list);		
		request.setAttribute("articleList", list);
		//获得最热博客排行榜
		List<Article> rankList = new ArrayList<Article>();
		rankList=articleBo.seekAllArticles(rankList);
		session.put("rankList", rankList);
		return "seekNewArticle";
	}

	// 链接到查询所有博客页面
	public String seekAllArticle()  throws Exception{
		// 获得所有博客最大页数
		PageArgs pageArgs = new PageArgs();
		pageArgs.setPageSize(6);
		pageArgs = articleBo.getMaxPageAll(pageArgs);
		pageArgs.setPageNum(1);
		session.put("pageArgs", pageArgs);
		// 获得所有博客（分页显示部分）
		List<Article> list = new ArrayList<Article>();
		list = articleBo.seekAllArticle(list);		
		request.setAttribute("articleList", list);
		session.put("conditionCont", null);		
		return "seekAllArticle";
	}

	// 分页查询所有的博客
	public String pageSeekAll()  throws Exception{
		// 获得当前页数和用户id
		int page = Integer.valueOf(request.getParameter("page"));
		// 获得页数的pageMax和pageSize
		PageArgs pageArgs = (PageArgs) session.get("pageArgs");
		// 判断当前页数是否为0，获得跳转页数
		if (page != 0) {
			// 获得要显示的页数
			pageArgs.setPageNum(page);
		} else if (page == 0) {
			// 获得跳转页数
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			pageArgs.setPageNum(pageNum);
		}
		List<Article> list = new ArrayList<Article>();
		list = articleBo.pageSeekAll(list, pageArgs);		
		request.setAttribute("articleList", list);		
		return "pageSeekAll";
	}

	// 条件搜索博客
	public String searchArticle()  throws Exception{
		String condition = request.getParameter("condition");
		String conditionCont = request.getParameter("conditionCont");
		System.out.println("condition"+condition+",conditionCont"+conditionCont);
		if (conditionCont.equals("") || conditionCont == null ||condition==null) {// 判断搜索内容是否为空
			return "retunSearchArticle";
		} else {
			// 保存搜索条件和内容
			session.put("condition", condition);
			session.put("conditionCont", conditionCont);
			// 获得最大页数
			PageArgs pageArgs = new PageArgs();
			pageArgs.setPageSize(6);
			pageArgs = articleBo.getMaxPageByCondition(pageArgs, condition, conditionCont);
			pageArgs.setPageNum(1);
			session.put("pageArgs", pageArgs);
			// 获得搜索的博客
			List<Article> list = new ArrayList<Article>();
			list = articleBo.seekArtByCondition(list, condition, conditionCont);			
			request.setAttribute("articleList", list);
			return "searchArticle";
		}
	}

	// 根据条件分页查询
	public String pageSeekByCondition()  throws Exception{
		// 获得当前页数
		int page = Integer.valueOf(request.getParameter("page"));
		// 获得页数的pageMax和pageSize
		PageArgs pageArgs = (PageArgs) session.get("pageArgs");
		// 判断当前页数是否为0，获得跳转页数
		if (page != 0) {
			// 获得要显示的页数
			pageArgs.setPageNum(page);
		} else if (page == 0) {
			// 获得跳转页数
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			pageArgs.setPageNum(pageNum);
		}
		//获得搜索条件和内容
		String condition=(String)session.get("condition");
		String conditionCont=(String)session.get("conditionCont");
		List<Article> list = new ArrayList<Article>();
		list = articleBo.pageSeekByCondition(list, condition, conditionCont, pageArgs);		
		request.setAttribute("articleList", list);
		return "pageSeekByCondition";
	}

	// 查找用户写的博客(我的博客)
	public String seekMyArticle() throws Exception {
		// 获得用户个人信息
		Consumer consumer = new Consumer();
		consumer.setUserId((Integer) session.get("userId"));
		consumer = consumerBo.seekbyId(consumer);
		session.put("consumer", consumer);
		// 获得用户的博客
		List<Article> list = new ArrayList<Article>();
		Article article = new Article();
		// 根据userId（用户id）查询所有博客章数
		PageArgs pageArgs = new PageArgs();
		article.setUserId((Integer) session.get("userId"));
		pageArgs.setPageSize(4);
		pageArgs = articleBo.getMaxPageByUserId(pageArgs, article);
		// 根据userId查询用户的博客
		list = articleBo.pageSeekByUserId(list, article, pageArgs);		
		request.setAttribute("articleList", list);
		pageArgs.setPageNum(1);
		session.put("pageArgs", pageArgs);
		return "seekMyArticle";
	}

	// 发表博客
	public String add() throws Exception {
		article.setUserId((Integer) session.get("userId"));
		article.setUsername((String) session.get("username"));
		Boolean bool = articleBo.add(article);
		if (bool == true) {
			request.setAttribute("message", "发表成功");
		} else {
			request.setAttribute("message", "发表失败");
		}
		return "add";
	}

	// 分页查询用户的发表的博客（我的博客）
	public String pageSeekMyArticle() throws Exception {
		// 获得当前页数和用户id
		int page = Integer.valueOf(request.getParameter("page"));
		// 获得页数的pageMax和pageSize
		PageArgs pageArgs = (PageArgs) session.get("pageArgs");
		// 判断当前页数是否为0，获得跳转页数
		if (page != 0) {
			// 获得要显示的页数
			pageArgs.setPageNum(page);
		} else if (page == 0) {
			// 获得跳转页数
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			pageArgs.setPageNum(pageNum);
		}
		// 获得用户的所有博客
		List<Article> list = new ArrayList<Article>();
		article = new Article();
		article.setUserId((Integer) session.get("userId"));
		list = articleBo.pageSeekByUserId(list, article, pageArgs);
		// 获得博客浏览次数
		for (Article a : list) {
			int count = scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);			
		}		
		request.setAttribute("articleList", list);
		return "pageSeekMyArticle";
	}

	// 分页查询用户的发表的博客（我的个人主页）
	public String pageSeekMyArticleForMyInfo() throws Exception {
		// 获得当前页数和用户id
		int page = Integer.valueOf(request.getParameter("page"));
		// 获得页数的pageMax和pageSize
		PageArgs pageArgs = (PageArgs) session.get("pageArgs");
		// 判断当前页数是否为0，获得跳转页数
		if (page != 0) {
			// 获得要显示的页数
			pageArgs.setPageNum(page);
		} else if (page == 0) {
			// 获得跳转页数
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			pageArgs.setPageNum(pageNum);
		}
		// 获得用户的所有博客
		List<Article> list = new ArrayList<Article>();
		article = new Article();
		article.setUserId((Integer) session.get("userId"));
		list = articleBo.pageSeekByUserId(list, article, pageArgs);
		// 获得博客浏览次数
		for (Article a : list) {
			int count = scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);			
		}
		request.setAttribute("articleList", list);
		return "pageSeekMyArticleForMyInfo";
	}

	// 获得该博客的详细信息以便修改
	public String getUpdateArticleInfo() throws Exception {
		int articleId = Integer.valueOf(request.getParameter("articleId"));
		article = new Article();
		article.setArticleId(articleId);
		article = articleBo.getArticleInfo(article);
		session.put("article", article);
		// 获得博客的类型,并显示该博客的文章类型
		List<ArticleType> articleTypelist = new ArrayList<ArticleType>();
		articleTypelist = articleTypeBo.seekAll(articleTypelist);
		List<String> newArticleTypelist = new ArrayList<String>();
		newArticleTypelist.add(article.getArticleTypeName());
		for (ArticleType at : articleTypelist) {
			if (!at.getArticleTypeName().equals(article.getArticleTypeName())) {
				newArticleTypelist.add(at.getArticleTypeName());
			}
		}
		request.setAttribute("articleTypelist", newArticleTypelist);
		return "getUpdateArticleInfo";
	}

	// 修改博客
	public String update() throws Exception {
		Article oldArticle = (Article) session.get("article");
		article.setArticleId(oldArticle.getArticleId());
		article.setEmitTime(oldArticle.getEmitTime());
		article.setUserId(oldArticle.getUserId());
		article.setUsername(oldArticle.getUsername());
		Boolean bool = articleBo.update(article);
		// 获得修改的博客类型
		List<ArticleType> articleTypelist = new ArrayList<ArticleType>();
		articleTypelist = articleTypeBo.seekAll(articleTypelist);
		List<String> newArticleTypelist = new ArrayList<String>();
		newArticleTypelist.add(article.getArticleTypeName());
		for (ArticleType at : articleTypelist) {
			if (!at.getArticleTypeName().equals(article.getArticleTypeName())) {
				newArticleTypelist.add(at.getArticleTypeName());
			}
		}
		request.setAttribute("articleTypelist", newArticleTypelist);
		if (bool == true) {
			request.setAttribute("updateArticleMessage", "成功修改博客");
		} else if (bool == false) {
			request.setAttribute("updateArticleMessage", "修改博客失败");
		}
		return "update";
	}

	// 获得该博客的详细信息
	public String getArticleInfo() throws Exception {

		// 获得博客信息
		int articleId = Integer.valueOf(request.getParameter("articleId"));
		article = new Article();
		article.setArticleId(articleId);
		article = articleBo.getArticleInfo(article);
		/*// 截取部分内容显示
		if (article.getContent().length() > 1200) {
			article.setContent(article.getContent().substring(0, 1200) + "...");
		}*/
		// 获得用户公开信息
		Consumer consumer = new Consumer();
		consumer.setUserId(article.getUserId());
		consumer = consumerBo.seekbyId(consumer);
		// 把作者私人信息设为null
		consumer.setPassword(null);
		consumer.setName(null);
		session.put("consumer", consumer);
		// 记录浏览者+1
		Scan scan = new Scan();
		scan.setArticleId(articleId);
		scan.setViewerId((Integer) session.get("userId"));
		scan.setViewer((String) session.get("username"));
		scanBo.add(scan);
		// 获得浏览次数
		int count = scanBo.seekViewerNum(articleId);
		article.setScanNum(count);
		session.put("article", article);
		// 获得评论信息
		List<Reply> list = new ArrayList<Reply>();
		list = replyBo.seekByArticleId(list, articleId);		
		if (list.size() > 0) {
			request.setAttribute("replyList", list);
		} else {
			request.setAttribute("emptyMessage", "暂时还没有评论");
		}
		return "getArticleInfo";
	}

	// 分页查询要访问的作者发表的博客
	public String pageSeekAuthorArticle() throws Exception {
		int page = Integer.valueOf(request.getParameter("page"));
		int userId = Integer.valueOf(request.getParameter("userId"));
		PageArgs pageArgs = (PageArgs) session.get("pageArgs");
		List<Article> list = new ArrayList<Article>();
		article = new Article();
		article.setUserId(userId);
		if (page != 0) {
			pageArgs.setPageNum(page);
		} else if (page == 0) {
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			pageArgs.setPageNum(pageNum);
		}
		article.setUserId(userId);
		list = articleBo.pageSeekByUserId(list, article, pageArgs);
		// 获得博客浏览次数
		for (Article a : list) {
			int count = scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);			
		}		
		request.setAttribute("articleList", list);
		return "pageSeekAuthorArticle";
	}

	// 删除博客
	public String delectArticle() throws Exception {
		int articleId = Integer.valueOf(request.getParameter("articleId"));
		article = new Article();
		article.setArticleId(articleId);
		// 删除文章
		Boolean bool_A, bool_S, bool_R;
		bool_A = articleBo.remove(article);
		// 删除浏览记录
		bool_S = scanBo.removeByArticleId(articleId);
		// 删除回复记录
		bool_R = replyBo.removeByArticleId(articleId);
		if (bool_A == true && bool_S == true && bool_R == true) {
			request.setAttribute("delectArticleMessage", "删除成功");
		} else {
			request.setAttribute("delectArticleMessage", "删除失败");
		}		
		// 获得用户的博客
		List<Article> list = new ArrayList<Article>();
		Article article = new Article();
		// 根据userId（用户id）查询所有博客章数
		PageArgs pageArgs = new PageArgs();
		article.setUserId((Integer) session.get("userId"));
		pageArgs.setPageSize(4);
		pageArgs = articleBo.getMaxPageByUserId(pageArgs, article);
		// 根据userId查询用户的博客
		list = articleBo.pageSeekByUserId(list, article, pageArgs);		
		request.setAttribute("articleList", list);
		pageArgs.setPageNum(1);
		session.put("pageArgs", pageArgs);

		return "delectArticle";
	}
	
	

	/*
	 * getters and setters
	 */
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArticleBo getArticleBo() {
		return articleBo;
	}

	public void setArticleBo(ArticleBo articleBo) {
		this.articleBo = articleBo;
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

	public ReplyBo getReplyBo() {
		return replyBo;
	}

	public void setReplyBo(ReplyBo replyBo) {
		this.replyBo = replyBo;
	}

	public ScanBo getScanBo() {
		return scanBo;
	}

	public void setScanBo(ScanBo scanBo) {
		this.scanBo = scanBo;
	}

	public ConsumerBo getConsumerBo() {
		return consumerBo;
	}

	public void setConsumerBo(ConsumerBo consumerBo) {
		this.consumerBo = consumerBo;
	}
}
