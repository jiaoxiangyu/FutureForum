<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
	<div id="wrap">
		<div id="top">
			<h1>FZML</h1>
			<h2>你还有很多未完成的梦，还有什么理由停下脚步</h2>
		</div>
		
			<div class="form">
				<form action="loginAction.action" method="post">
				
					<table>
						<tr>
							<td>用户类型</td>
							<td><select name="user.sort" size="1" style="line-height: 1.8">
									<option>普通用户</option>
									<option>管理员</option>
							</select></td>
						</tr>
						<tr>
							<td>用户名</td>
							<td><input name="user.username" type="text"
								 style="line-height: 1.8"></td>
						</tr>
						<tr>
							<td>密 码</td>
							<td><input name="user.password" type="password" style="line-height: 1.8"></td>
						</tr>
						<tr class="button">													
							<td><input type="button" onclick="window.location='linkAction_getRegister.action'" value="   注       册     "> </td>
							<td><input type="submit" value="   登        录    " ></td>
						</tr>						
					</table>
				 	<label>${message}</label> 
					<label>${registerMsg}</label>
				</form>
			</div>
		

		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>
</body>
</html>