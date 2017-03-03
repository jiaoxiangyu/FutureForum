<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询博客</title>
<link rel="stylesheet" type="text/css" href="css/seekAllArticle.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<h1>FZML</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="articleAction_seekNewArticle.action">首页</a></li>
				<li><a href="linkAction_rankList.action" >排行榜</a></li>				
				<li><a href="consumerAction_seekMyInfo.action" target="_blank">我的个人主页</a></li>
				<li><a href="articleAction_seekMyArticle.action"
					target="_blank">我的博客</a></li>
				<li><a href="linkAction_getAllArticleType.action"
					target="_blank">发表博客</a></li>
				<li><a href="linkAction_logout.action">退出登录</a></li>
				<li style="padding-left: 150px;">
					<form name="form1" action="articleAction_searchArticle.action?condition=title" method="post">			
						<input name="conditionCont" type="text" size="30"  style="line-height: 1.5; ">						
						<a href="#"  onclick="form1.submit();"><img src="${pageContext.request.contextPath}/images/search.png"  style="height: 20px;width: 20px;position: absolute;padding-top: 12px;padding-left: 2px;"></a>
					</form>
				</li>	
			</ul>
		</div>

		<div id="content">
			<div class="left">
				<div class="seek">
					<form name="Seekfrom" action="articleAction_searchArticle.action"
						method="post">
						<div>
							<b>搜索博客:</b>&nbsp;&nbsp; <select name="condition">
								<option>标题</option>
								<option>类型</option>
								<option>作者</option>
							</select>&nbsp; <input type="text" name="conditionCont" size="60"
								maxlength="22" style="line-height: 1.8" />&nbsp; <input
								type="submit" value="搜   索">
						</div>
					</form>
				</div>
				<c:choose>
					<c:when test="${articleList.size()>0}">
						<h4 style="line-height: 2.5;">最新博客</h4>
						<div class="cont_every">
							<c:forEach items="${articleList}" var="a">
								<div class="every_left">
									<div class="every_mag">
										<img src="${basePath}upload/${a.getHeadImg()}"
											style="height: 80px; width: 80px; border: 3px solid #ccc; border-radius: 50%">
									</div>
									<div class="every_name">
										<a
											href="consumerAction_viewConsumerInfo.action?userId=${a.getUserId()}">${a.getUsername()}</a>
									</div>
								</div>

								<div class="every_right">

									<div class="every_time">
										&nbsp;<img src="images/time.png">&nbsp;${a.getEmitTime()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;<img src="images/scan.png"
											style="height: 10px; width: 15px; background: #e6e6e6;">&nbsp;${a.getScanNum()}
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${a.getArticleTypeName()}
									</div>
									<div class="cont_artname">
										<h3>
											<a
												href="articleAction_getArticleInfo.action?articleId=${a.getArticleId()}">${a.getTitle()}</a>
										</h3>
									</div>
									<div class="every_cont">
										<c:choose>
											<c:when test="${a.getContent().length()>125}">
												<p>${a.getContent().substring(0,125)}<a
														href="articleAction_getArticleInfo.action?articleId=${a.getArticleId()}">......</a>
												</p>
											</c:when>
											<c:otherwise>
												<p>${a.getContent()}</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="pageseek">
							<c:choose>
								<c:when test="${conditionCont.length()>0}">						
									<form
										action="articleAction_pageSeekByCondition.action?page=0&userId=${consumer.getUserId()}"
										method="post">
										<table>
											<tr>
												<td><a href="articleAction_pageSeekByCondition.action?page=1">首页</a></td>
												<td><a
													href="articleAction_pageSeekByCondition.action?page=${pageArgs.getPrePage()}">上一页</a></td>
												<td>${pageArgs.getPageNum()}/${pageArgs.getMaxPage()}</td>
												<td><a
													href="articleAction_pageSeekByCondition.action?page=${pageArgs.getNextPage()}">下一页</a></td>
												<td><a
													href="articleAction_pageSeekByCondition.action?page=${pageArgs.getMaxPage()}">尾页</a></td>
												<td>跳到第<input name="pageNum" type="text" size="2">页
												</td>
												<td><input type="submit" value="GO"></td>
											</tr>
										</table>
									</form>
								</c:when>
								<c:otherwise>								
									<form
										action="articleAction_pageSeekAll.action?page=0&userId=${consumer.getUserId()}"
										method="post">
										<table>
											<tr>
												<td><a href="articleAction_pageSeekAll.action?page=1">首页</a></td>
												<td><a
													href="articleAction_pageSeekAll.action?page=${pageArgs.getPrePage()}">上一页</a></td>
												<td>${pageArgs.getPageNum()}/${pageArgs.getMaxPage()}</td>
												<td><a
													href="articleAction_pageSeekAll.action?page=${pageArgs.getNextPage()}">下一页</a></td>
												<td><a
													href="articleAction_pageSeekAll.action?page=${pageArgs.getMaxPage()}">尾页</a></td>
												<td>跳到第<input name="pageNum" type="text" size="2">页
												</td>
												<td><input type="submit" value="GO"></td>
											</tr>
										</table>
									</form>
								</c:otherwise>
							</c:choose>

						</div>
						
					</c:when>
					<c:otherwise>
						<h3 class="empty">对不起，没有找到你要的内容！</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="right">
				<div>
					<h2>博文分类</h2>
					<ul>
						<li><a href="linkAction_typeLink.action?No=1">移动开发 </a></li>
						<li><a href="linkAction_typeLink.action?No=2">Web前端 </a></li>
						<li><a href="linkAction_typeLink.action?No=3">构架设计</a></li>
						<li><a href="linkAction_typeLink.action?No=4">编程语言</a></li>
						<li><a href="linkAction_typeLink.action?No=5">互联网 </a></li>
						<li><a href="linkAction_typeLink.action?No=6">数据库</a></li>
						<li><a href="linkAction_typeLink.action?No=7">系统运维</a></li>
						<li><a href="linkAction_typeLink.action?No=1">云计算</a></li>
						<li><a href="linkAction_typeLink.action?No=9">研发管理</a></li>
						<li><a href="linkAction_typeLink.action?No=10">综合</a></li>
					</ul>
				</div>


				<div>
					<h2>热文排行榜</h2>
					<ul>
						<c:forEach items="${rankList}" var="r">
							<li style="height: 40px;"><a href="articleAction_getArticleInfo.action?articleId=${r.getArticleId()}">${r.getTitle()}</a> </li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<div id="footer">版权所有：未来工作室</div>
</body>
</html>