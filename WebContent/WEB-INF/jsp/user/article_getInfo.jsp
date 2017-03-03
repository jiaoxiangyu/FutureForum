<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客详情</title>
<link rel="stylesheet" type="text/css" href="css/articleInfo.css" />
</head>
<body onload="myfunction();">
	<div id="wrap">
		<div id="top">
			<h1>FZML</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="articleAction_seekNewArticle.action">首页</a></li>
				<li><a href="linkAction_rankList.action" >排行榜</a></li>
				<li><a href="consumerAction_seekMyInfo.action" >个人主页</a></li>
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

		<div class="main">
			<div class="left">
				<h3>个人信息</h3>
				<div class="mag">
					<img src="${basePath}upload/${consumer.getHeadImg()}"
						style="height: 100px; width: 100px; border: 3px solid #ccc;">
				</div>
				<div class="info">

					<ul>
						<li><h4><a href="consumerAction_viewConsumerInfo.action?userId=${consumer.getUserId()}">${consumer.getUsername()}</a></h4></li>
						<li>${consumer.getSex()}|${consumer.getAge()}</li>
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
				<div class="art_name">
					<h3>${article.getTitle()}</h3>
				</div>
				<div class="art_property">
					<h5>博客类型:&nbsp;&nbsp;${article.getArticleTypeName()}&nbsp;&nbsp;&nbsp;&nbsp;
						发表时间:&nbsp;&nbsp;${article.getEmitTime()}&nbsp;&nbsp;&nbsp;&nbsp;
						浏览次数:&nbsp;&nbsp;${article.getScanNum()}</h5>
				</div>
				<div>
					<div class="art_cont">
						${article.getContent()}
					</div>					
					<%-- <c:if test="${article.getContent().length()>1200}">
						<div style="text-align: center;"><a href="#">显示全部文章>></a></div>
					</c:if> --%>
				</div>
				<h4>评论内容:</h4>
				<div class="reply">
					<c:choose>
						<c:when test="${replyList==null}">
							<div>
								<h3>${emptyMessage }</h3>
							</div>
						</c:when>
						<c:otherwise>
							<div class="every_reply">
							    <c:forEach items="${replyList}" var="r">
								
									<div class="reply_property">
										<h5>&nbsp;&nbsp;评论人&nbsp;&nbsp;${r.getUsername()}&nbsp;&nbsp;&nbsp;&nbsp;
											评论时间&nbsp;&nbsp;${r.getReplyTime()}</h5>
									</div>
									<div class="reply_cont">
										<%-- <c:choose>
											<c:when test="${r.getContent().length()>100}">
												<p>${r.getContent().substring(0,100)}<a href="#">......</a></p>
											</c:when>
											<c:otherwise> --%>
												<p>${r.getContent()}</p>
										<%-- 	</c:otherwise>
										</c:choose>		 --%>																	
									</div>								
							    </c:forEach>
							   <%--  <c:if test="${bool==true}">
							    	<div style="text-align: center;"><a href="#">显示全部评论>></a></div>
							    </c:if>	 --%>							
							</div>
						</c:otherwise>
					</c:choose>					
				</div>
				<div>
					<form
						action="replyAction_emitreply.action?articleId=${article.getArticleId()}"
						method="post">
						<h4>发表评论:</h4>
						<div>
							<textarea name="reply.content" rows="8" cols="60" maxlength="200" placeholder="评论内容200字以内" style="border: 2px solid #d4d4d4"></textarea>
						</div>
						<div style="padding-top:10px; padding-left: 420px;">
							<input type="submit" value="发表评论">
						</div>	
						<div class="lable">
							<h4>${replyMessage}</h4>
						</div>										
					</form>
				</div>
			</div>
		</div>
		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>
	                     	
</body>
</html>