<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<link rel="stylesheet" type="text/css" href="css/consumerUpdate.css" />
<script type="text/javascript">
function checkpwd() {
	var p1=document.getElementById("pwd1").value;
	var p2=document.getElementById("pwd2").value;
	if(p1!=p2){
		document.getElementById("pwd").innerHTML="两次输入密码不一致，请重新输入";
		return false;
	}
	
}
</script>
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
		<div class="content">
			<div>
				<h4>>>修改个人信息</h4>
			</div>
			<div class="form_1">
				<form action="consumerAction_updateHeadImg.action" method="post"
					enctype="multipart/form-data">
					<input type="file" name="headImg" /><br />
					 <input type="submit" value="上传头像">
				</form>
			</div >
			<div class="form_2">
				<form action="consumerAction_updateInfo.action" method="post" onclick="return checkpwd()">
				<img name="consumer.headImg"
					src="${basePath}upload/${consumer.getHeadImg()}"
					style="height: 100px;width:100px;border: 1px solid;">
				<table>
					<tr>
						<td>用户名</td>
						<td>${consumer.getUsername()}</td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input name="consumer.name" type="text" required="required" style="line-height:1.8"
							value="${consumer.getName()}"></td>
					</tr>
					<c:choose>
						<c:when test="${consumer.getSex()=='男'}">

							<tr>
								<td>性&nbsp;&nbsp;别：</td>
								<td><input type="radio" name="consumer.sex" value='男'
									checked>男&nbsp; <input type="radio" name="consumer.sex"
									value='女'>女</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>性&nbsp;&nbsp;别：</td>
								<td><input type="radio" name="consumer.sex" value='男'>男&nbsp;
									<input type="radio" name="consumer.sex" value='女' checked>女</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td>年龄</td>
						<td><input name="consumer.age" type="number" min="0"
								max="140" step="1" size="2" style="line-height: 1.8"
							value="${consumer.getAge()}"></td>
					</tr>
					<tr>
						<td>email</td>
						<td><input name="consumer.email" type="email"
								required="required" style="line-height: 1.8"
							value="${consumer.getEmail()}"></td>
					</tr>
					<tr>
						<td>Tel</td>
						<td><input name="consumer.tel" type="tel"
								pattern="^1[3|4|5|7|8][0-9]\d{4,8}$" required="required" style="line-height:1.8"
							value="${consumer.getTel()}"></td>
					</tr>
					<tr>
						<td>新密码</td>
						<!-- pattern="^[a-zA-Z]\w{5,30}$" -->
						<td><input name="consumer.newpassword" id="pwd1" type="password" maxlength="12"
								required="required"  style="line-height: 1.8"
							value="${consumer.getPassword()}"></td>
						<td><h6 style="color:gray;">以字母开头，允许包含字母、数字、下划线，长度为6-18字母之间。</h6></td>
					</tr>
					<tr>
						<td>确认密码</td>
						<td><input name="consumer.password" id="pwd2" type="password" maxlength="12"
								required="required"  style="line-height: 1.8"
							value="${consumer.getPassword()}"></td>
					</tr>
					<tr class="button">
						<td><input type="reset" value=" 重      置 "></td>
						<td><input type="submit" value="确认修改"  >
					</tr>
				</table>
				<div style="padding-left:60px; padding-top:20px; color: red;">
					<label id="pwd"></label>
					<label>${updateConsumerMessage}</label> 
					<label>${updateHeadImgMsg}</label>
				</div>				
			</form>
			</div>			
		</div>

		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>

</body>
</html>