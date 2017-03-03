<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排行榜</title>
<link rel="stylesheet" type="text/css" href="css/rankList.css" />

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
		<div class="content">
			<div>
				<h4>>>排行榜</h4>

			</div>
			<div class="left">
				<h3>最热博客</h3>
				<ol>
					<c:forEach items="${articleList}" var="a">
						<li><a href="articleAction_getArticleInfo.action?articleId=${a.getArticleId()}">${a.getTitle()}</a> &nbsp;
							<img src="images/scan.png"
									style="height: 10px; width: 15px; background: #0000000;">&nbsp;${a.getScanNum()}</li>
					</c:forEach>
				</ol>
			</div>
			<div class="right">
				<h3>评论之星</h3>
				<ol>
					<c:forEach items="${repyconsumerList}" var="r">
						<li><img src="${basePath}upload/${r.getHeadImg()}"
							style="height: 40px; width: 40px; border: 3px solid #ccc; border-radius: 50%">&nbsp;&nbsp;&nbsp;
							<a href="consumerAction_viewConsumerInfo.action?userId=${r.getUserId()}">${r.getUsername()}</a>
							&nbsp;&nbsp;&nbsp;<img src="images/reply.png"
									style="height: 20px; width: 20px; background: #0000000;">&nbsp;${r.getReplyNum()}
						</li>
					</c:forEach>
				</ol>
			</div>
			<div class="center">
				<div class="center_core">
					<h3 style="padding-top: 10px;">博客之星</h3>
					<ol>
						<c:forEach items="${consumerList}" var="c">
							<li>
								<img src="${basePath}upload/${c.getHeadImg()}"
								style="height: 40px; width: 40px; border: 3px solid #ccc; border-radius: 50%;">&nbsp;&nbsp;&nbsp;
								<a href="consumerAction_viewConsumerInfo.action?userId=${c.getUserId()}">${c.getUsername()}</a>
								&nbsp;&nbsp;&nbsp;<img src="images/scan.png"
									style="height: 10px; width: 15px; background: #0000000;">&nbsp;${c.getScanNum()}
							</li>
						</c:forEach>
					</ol>
				</div>
			</div>

		</div>
		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>

</body>
</html>