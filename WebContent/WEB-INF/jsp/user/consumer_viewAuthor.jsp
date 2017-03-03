<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<link rel="stylesheet" type="text/css" href="css/myInfo.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<h1>FZML</h1>

		</div>
		<div id="menu">
			<ul>
				<li><a href="articleAction_seekNewArticle.action">首页</a></li>
				<li><a href="linkAction_rankList.action">排行榜</a></li>
				<li><a href="consumerAction_seekMyInfo.action">我的个人主页</a></li>
				<li><a href="articleAction_seekMyArticle.action">我的博客</a></li>
				<li><a href="linkAction_getAllArticleType.action">发表博客</a></li>
				<li><a href="linkAction_logout.action">退出登录</a></li>
				<li style="padding-left: 150px;">
					<form name="form1" action="articleAction_searchArticle.action?condition=title" method="post">			
						<input name="conditionCont" type="text" size="30"  style="line-height: 1.5; ">						
						<a href="#"  onclick="form1.submit();"><img src="${pageContext.request.contextPath}/images/search.png"  style="height: 20px;width: 20px;position: absolute;padding-top: 12px;padding-left: 2px;"></a>
					</form>
				</li>	
			</ul>

		</div>

		<div class="main">
			<div class="left">
				<h3>个人信息</h3>
				<div class="mag">
					<img src="${basePath}upload/${consumer.getHeadImg()}"
						style="height: 100px; width: 100px; border: 3px solid #ccc;">
				</div>
				<div class="info">

					<ul>
						<li><h4>${consumer.getUsername()}</h4></li>
						<li>${consumer.getSex()}| ${consumer.getAge()}</li>
						<li>${consumer.getEmail()}</li>
					</ul>
				</div>
				<h3>我的博客分类</h3>
				<div class="kinds">
					<ul>
						<li>Java</li>
						<li>Java web</li>
						<li>PHP</li>
						<li>其它</li>
					</ul>
				</div>
			</div>
			<div class="right">
				<h3>我的博客</h3>
				<c:choose>
					<c:when test="${articleList.size()>0}">
						<div class="cont_every">
							<c:forEach items="${articleList}" var="a">
								<div class="every">
									<div class="every_time">
										&nbsp;<img src="images/time.png">&nbsp;${a.getEmitTime()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;<img src="images/scan.png"
											style="height: 10px; width: 15px; background: #e6e6e6;">&nbsp;${a.getScanNum()}
									</div>
									<div class="cont_artname">
										<h3>
											<a
												href="articleAction_getArticleInfo.action?articleId=${a.getArticleId()}">${a.getTitle()}</a>
										</h3>
									</div>
									<div class="every_cont">
										<p>&nbsp;&nbsp;&nbsp;&nbsp;${a.getsubContent()}</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="pageseek">
							<form
								action="articleAction_pageSeekAuthorArticle.action?page=0&userId=${consumer.getUserId()}"
								method="post">
								<table>
									<tr>
										<td><a
											href="articleAction_pageSeekAuthorArticle.action?page=1&userId=${consumer.getUserId()}">首页</a></td>
										<td><a
											href="articleAction_pageSeekAuthorArticle.action?page=${pageArgs.getPrePage()}&userId=${consumer.getUserId()}">上一页</a></td>
										<td>${pageArgs.getPageNum()}/${pageArgs.getMaxPage()}</td>
										<td><a
											href="articleAction_pageSeekAuthorArticle.action?page=${pageArgs.getNextPage()}&userId=${consumer.getUserId()}">下一页</a></td>
										<td><a
											href="articleAction_pageSeekAuthorArticle.action?page=${pageArgs.getMaxPage()}&userId=${consumer.getUserId()}">尾页</a></td>
										<td>跳到第<input name="pageNum" type="text" size="2">页
										</td>
										<td><input type="submit" value="GO"></td>
									</tr>
								</table>
							</form>
						</div>						
					</c:when>
					<c:otherwise>
						<h3 class="empty">对不起，还没没有发表过博客！</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div style="clear: both;"></div>
		</div>


		<h5>${updateConsumerMessage}</h5>

		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>
</body>
</html>