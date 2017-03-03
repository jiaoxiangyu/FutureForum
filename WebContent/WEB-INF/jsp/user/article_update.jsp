<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改博客</title>
<link rel="stylesheet" type="text/css" href="css/addArticle.css" />
<!-- 加载编辑器的容器 -->
 <!-- 配置文件 -->
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 实例化编辑器 -->
<!-- <script type="text/javascript">
    function modifyContent() {
        var content = document.getElementById("content");

        var arr = [];

        arr.push(UE.getEditor('editor').getContent());

        content.value = arr;

    }
</script> -->
<script type="text/javascript">
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');

        function isFocus(e) {
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e) {
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }
        function getAllHtml() {
            alert(UE.getEditor('editor').getAllHtml())
        }
        function getContent() {
            var arr = [];

            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('editor').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
            }
        }

        function getLocalData() {
            alert(UE.getEditor('editor').execCommand("getlocaldata"));
        }

        function clearLocalData() {
            UE.getEditor('editor').execCommand("clearlocaldata");
            alert("已清空草稿箱")
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
				<h4>>>修改博客</h4>
			</div>
			<div class="form">
				<form action="articleAction_update.action" method="post">
					<div style="padding: 10px">
						标题：<input name="article.title" type="text" size="60" maxlength="22"
								value="${article.getTitle()}">
					</div>
					<div style="padding: 10px">
						类型:
						<select name="article.articleTypeName">
									<c:forEach items="${articleTypelist}" var="a">
										<option>${a}</option>
									</c:forEach>
						</select>
					</div>
					<div class="form_cont">
						内容:
						<textarea rows="10" cols="25" maxlength="10000" name="article.content"  id="editor"  style="width: 900px; height: 280px;">${article.getContent()}</textarea><br>             			        
					</div>								
					<div class="button">
						<input type="button" value="保      存"> 
						<input type="submit" value="确认修改">
					</div>
					<label>${updateArticleMessage}</label>
				</form>
			</div>
		</div>
		<div id="bottom"></div>
		<div id="footer">版权所有：未来工作室</div>
	</div>

</body>
</html>