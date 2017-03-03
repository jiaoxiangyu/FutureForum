<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册普通用户</title>
<link rel="stylesheet" type="text/css" href="css/register.css" />
<script type="text/javascript">
function checkpwd() {
	/* alert("1"); */
	var p1=document.getElementById("pwd1").value;
	var p2=document.getElementById("pwd2").value;
	/* alert(p1+p2); */
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
			<h2>你还有很多未完成的梦，还有什么理由停下脚步</h2>
		</div>
		<div class="content">
			
			<div class="form">
			<div>
				<h4><a href="indexAction.action">登录</a>>>注册普通用户</h4>
			</div>
			<h5>提示：所有选项必填；<br>
			用户名: 以字母开头，允许包含字母、数字、下划线，长度为5-12字母之间<br>
				密码: 以字母开头，允许包含字母、数字、下划线，长度为6-18字母之间。</h5>
				<form action="consumerAction_register.action" method="post" onclick="return checkpwd()">
				
					<table>
						<tr>
							<td>用户名：</td>
							<td><input name="consumer.username" type="text"
								maxlength="12" required="required"
								pattern="^[a-zA-Z][a-zA-Z0-9_]{4,11}$" autofocus="autofocus"style="line-height:1.8">
								</td>
						</tr>
						<tr>
							<td>姓&nbsp;&nbsp;名:</td>
							<td><input name="consumer.name" type="text"
								required="required" style="line-height:1.8"></td>
						</tr>
						<tr>
							<td>性&nbsp;&nbsp;别:</td>
							<td><input type="radio" name="consumer.sex" value='男'
								checked>男&nbsp; <input type="radio" name="consumer.sex"
								value='女'>女</td>
						</tr>
						<tr>
							<td>年&nbsp;&nbsp;龄:</td>
							<td><input name="consumer.age" type="number" min="0"
								max="140" step="1" size="2" style="line-height: 1.8"></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><input name="consumer.email" type="email"
								required="required" style="line-height: 1.8"></td>
						</tr>
						<tr>
							<td>&nbsp;Tel:</td>
							<td><input name="consumer.tel" type="tel"
								pattern="^1[3|4|5|7|8][0-9]\d{4,8}$" required="required" style="line-height:1.8"></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;码:</td>
							<td><input name="password_1" id="pwd1" type="password" maxlength="12"
								required="required" pattern="^[a-zA-Z]\w{5,17}$" style="line-height: 1.8">
								</td>
						</tr>
						<tr>
							<td>确认密码:</td>
							<td><input name="consumer.password" id="pwd2" type="password"
								maxlength="12" required="required" pattern="^[a-zA-Z]\w{5,17}$" style="line-height: 1.8">
							</td>
						</tr>
						<tr class="button">
							<td><input type="reset" value="  重   置   "></td>
							<td><input type="submit" value="  提   交   "></td>
						</tr>
					</table>
					<label id="pwd" style="text-align: center; color: red;"></label>
				</form>
			</div>
		</div>
		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>

</body>
</html>