<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>枫之木落博客首页</title>
<link rel="stylesheet" type="text/css" href="css/mian.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<h1>FZML</h1>			
			<h2>你还有很多未完成的梦，还有什么理由停下脚步</h2>
		</div>
		<div id="menu">
			<ul>
				<li><a href="articleAction_seekNewArticle.action">首页</a></li>
				<li><a href="linkAction_rankList.action" >排行榜</a></li>							
				<li><a href="consumerAction_seekMyInfo.action" >我的个人主页</a></li>
				<li><a href="articleAction_seekMyArticle.action" >我的博客</a></li>
				<li><a href="linkAction_getAllArticleType.action" >发表博客</a></li>				
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
				<h4>最新博客</h4>
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
										<p>${a.getContent().substring(0,125)}<a href="articleAction_getArticleInfo.action?articleId=${a.getArticleId()}">......</a></p>
									</c:when>
									<c:otherwise>
										<p>${a.getContent()}</p>
									</c:otherwise>
								</c:choose>						
							</div>
						</div>
						<!-- <div style="clear: both;display: none"></div> -->
					</c:forEach>
				</div>
				<div class="con_more">
					<a href="articleAction_seekAllArticle.action"> 更多>> </a>
				</div>
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
		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>
	
</body>
</html>