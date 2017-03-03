package com.jxy.futureforum.action;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jxy.futureforum.bo.ArticleBo;
import com.jxy.futureforum.bo.ConsumerBo;
import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.model.Article;
import com.jxy.futureforum.model.Consumer;
import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.tool.Md5;
import com.opensymphony.xwork2.ActionSupport;

public class ConsumerAction extends ActionSupport implements SessionAware, ServletRequestAware, Serializable {
	private static final long serialVersionUID = 1L;
	private Consumer consumer;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private ConsumerBo consumerBo;
	private ArticleBo articleBo;
	private ScanBo scanBo;
	private File headImg; // 用来封装头像图片
	private String headImgContantType; // 用来封装图片类型
	private String headImgFileName; // 用来封装图片类型

	// 获得普通用户个人信息 以便修改
	public String getInfo() throws Exception {
		Consumer consumer = new Consumer();
		consumer.setUserId((Integer) session.get("userId"));
		consumer = consumerBo.seekbyId(consumer);
		session.put("consumer", consumer);// 暂定用session
		return "getInfo";
	}

	// 查找用户个人信息（我的个人主页）
	public String seekMyInfo() throws Exception {
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
		return "seekMyInfo";
	}

	// 修改用户个人信息
	public String updateInfo() throws Exception {
		// 获得用户的原个人信息
		Consumer oldConsumer = (Consumer) session.get("consumer");
		consumer.setUserId(oldConsumer.getUserId());
		consumer.setHeadImg(oldConsumer.getHeadImg());
		consumer.setUsername(oldConsumer.getUsername());
		consumer.setRegisterTime(oldConsumer.getRegisterTime());
		// 修改个人信息
		if(!consumer.getPassword().equals(oldConsumer.getPassword())){
			String pwd=new Md5().md5(consumer.getPassword());
			consumer.setPassword(pwd);
		}
		Boolean bool = consumerBo.update(consumer);
		if (bool == true) {
			request.setAttribute("updateConsumerMessage", "修改成功");
		} else {
			request.setAttribute("updateConsumerMessage", "修改失败");
		}
		return "updateInfo";
	}

	// 上传头像
	public String updateHeadImg() throws Exception {
		try {
			// 处理头像
			if (headImg != null) {
				// 1、保存头像到upload/user
				// 获取保存路径的绝对地址
				String filePath = ServletActionContext.getServletContext().getRealPath("/upload/user");
				// 生成带格式的随机文件名称
				String fileName = UUID.randomUUID().toString()
						+ headImgFileName.substring(headImgFileName.lastIndexOf("."));
				File saveDir = new File(filePath);// 按照filePath路径构造一个file实例
				if (!saveDir.exists()) {// 判断路径是否存在，如果不存在就创建一个
					saveDir.mkdirs();
				}

				// 复制文件
				FileUtils.copyFile(headImg, new File(saveDir, fileName));
				// 2、设置用户头像路径
				Consumer oldconsumer = (Consumer) session.get("consumer");

				/*
				 * if(!oldconsumer.getHeadImg().equals("user/default.jpg")){
				 * String
				 * oldfilename=filePath+oldconsumer.getHeadImg().substring(5);
				 * File file=new File(oldfilename); file.delete(); }
				 */
				oldconsumer.setHeadImg("user/" + fileName);
				System.out.println(oldconsumer);
				session.put("consumer", oldconsumer);
				// 如果旧头像存在，把旧头像删除

				Boolean bool = consumerBo.update(oldconsumer);
				if (bool == true) {

					request.setAttribute("updateHeadImgMsg", "头像上传成功");
				} else {
					request.setAttribute("updateHeadImgMsg", "头像上传失败");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateHeadImg";
	}

	// 访问作者信息（个人主页）
	public String viewConsumerInfo() throws Exception {
		int userId = Integer.valueOf(request.getParameter("userId"));
		// 获得用户公开信息
		Consumer consumer = new Consumer();
		consumer.setUserId(userId);
		consumer = consumerBo.seekbyId(consumer);
		// 把作者私人信息设为null
		consumer.setPassword(null);
		consumer.setName(null);
		session.put("consumer", consumer);
		// 获得用户发表的博客
		List<Article> articleList = new ArrayList<Article>();
		Article article = new Article();
		// 获得用户的博客的总页数和设置pageSize大小
		PageArgs pageArgs = new PageArgs();
		article.setUserId(userId);
		pageArgs.setPageSize(4);
		pageArgs = articleBo.getMaxPageByUserId(pageArgs, article);
		articleList = articleBo.pageSeekByUserId(articleList, article, pageArgs);
		// 获得博客浏览次数
		for (Article a : articleList) {
			int count = scanBo.seekViewerNum(a.getArticleId());
			a.setScanNum(count);
		}
		request.setAttribute("articleList", articleList);
		pageArgs.setPageNum(1);// 设置首页的当前页数为1
		session.put("pageArgs", pageArgs);
		return "viewConsumerInfo";
	}

	// 注册普通用户
	public String register() throws Exception {
		String pwd=new Md5().md5(consumer.getPassword());
		consumer.setPassword(pwd);
		Boolean bool = consumerBo.add(consumer);		
		if (bool == true) {
			request.setAttribute("registerMsg", "注册成功");
		} else if (bool == false) {
			request.setAttribute("registerMsg", "注册失败，请重新注册");
		}
		return "register";
	}

	/*
	 * getters and settrs
	 */
	public Consumer getConsumer() {
		return consumer;
	}

	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}

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

	public ConsumerBo getConsumerBo() {
		return consumerBo;
	}

	public void setConsumerBo(ConsumerBo consumerBo) {
		this.consumerBo = consumerBo;
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

	public File getHeadImg() {
		return headImg;
	}

	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}

	public String getHeadImgContantType() {
		return headImgContantType;
	}

	public void setHeadImgContantType(String headImgContantType) {
		this.headImgContantType = headImgContantType;
	}

	public String getHeadImgFileName() {
		return headImgFileName;
	}

	public void setHeadImgFileName(String headImgFileName) {
		this.headImgFileName = headImgFileName;
	}
}
