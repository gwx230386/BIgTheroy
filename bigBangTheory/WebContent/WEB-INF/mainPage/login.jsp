<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta charset="utf-8">
<title>Insentek - 用户登录</title>
<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/prompt.js"></script>
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/main.css" rel="stylesheet">
<link href="<%=path%>/css/prompt.css" rel="stylesheet">
<style>
.loginbox {
	width: 680px;
	margin: 80px auto;
	margin-bottom: 10px;
	background-color: #fff;
	padding: 1px;
	border-radius: 2px 2px 2px 2px;
	border: solid 1px #AAA;
	background-color: #fff;
}

.loginbox .title {
	background-image: -webkit-linear-gradient(top, #f5f5f5, #Fff);
	border-bottom: solid 1px #f4f4f4;
	height: 40px;
	line-height: 40px;
	padding: 0 0 0 10px;
	font-size: 16px;
	border-radius: 2px 2px 0px 0px;
}

.loginbox .content {
	padding: 20px;
}

.content .captcha {
	width: 80px;
	height: 26px;
	top: 4px !important;
	right: 17px !important;
	cursor: pointer;
}

.acts {
	width: 400px;
	margin: 10px auto;
	text-align: center;
}

#login-submit,#reset-submit {
	padding: 6px 30px;
}

.alert {
	padding: 8px;
}
.errorhint
{
   height: 20px; 
   color: red; 
   position: relative;
   display: inline; 
   left: 250px; 
   width: 50px;
   bottom: 27px;
   padding-left: 5px;
}
</style>
</head>
<body>
	<header class="navbar istk-header navbar-fixed-top">
		<div class="navbar-inner">
		<a class="logo pull-left" href=""><img
				src="<%=path%>/images/insentek-logo-2.png"></a>
				<span class="lr-item pull-right">
				<a href="login_toLoginPage.action">登录</a>
				<a href="login_toRegisterPage.action">注册</a></span>
			<ul class="nav pull-left nav-link">
			    <li><a href="index.jsp">首页</a></li>
				<li><a href="about.jsp">我们</a></li>
				<li><a href="product.jsp">产品</a></li>
				<li><a href="partner.jsp">案例</a></li>
<!-- 				<li class="blog"><a href="http://blog.insentek.com">博客</a></li> -->
				<li><a href="device.jsp">我的设备</a></li>
			</ul>
		</div>
	</header>
	<div class="container-fluid istk-container">
		<div class="loginbox">
			<div class="title">用户登录</div>
			<div class="content">
				<form role="form" class="form-horizontal" name="login-form">
					<input type="hidden" name="com.insentek.cloud.Token"
						value="HzI1XDXkcH_J8ClUH7-6uDlVTdZZW*ZF">
					<div class="form-group has-error">
						<label class="col-sm-4 control-label">Email：</label>

						<div class="col-sm-5">
							<input type="text" id="email" class="form-control" name="u">
							<ul class='errorhint'></ul>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">密码：</label>

						<div class="col-sm-5">
							<input type="password" id="password" class="form-control" name="p">
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-4 control-label">验证码：</label>

						<div class="col-sm-5">
							<input type="text" class="form-control" id="captcha" name="code"
								maxlength="4"> <img src="checkCode_getAuthCode.action"
								class="form-control-feedback captcha" alt="">
							<ul class='errorhint'></ul>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button type="button" class="btn btn-success" id="login-submit">登录</button>
						</div>
					</div>
				</form>
				<form role="form" class="form-horizontal hide" name="reset-form">
					<input type="hidden" name="com.insentek.cloud.Token"
						value="HzI1XDXkcH_J8ClUH7-6uDlVTdZZW*ZF">
					<div class="alert alert-info" id="notice">
						重设密码需要您注册时所填邮箱地址，我们将会给您发送一封确认邮件协助您重设新的密码。</div>
					<div class="form-group">
						<div class="col-sm-5 col-sm-offset-2">
							<input type="text" class="form-control" id="registerEmail"
								placeholder="请输入您的注册邮箱">
						</div>
						<div class="col-sm-4">
							<a class="btn btn-success" id="reset-submit">确认发送</a> <a
								href="javascript:;" class="control-label pull-left hide"
								id="retry">没有收到？点击重试</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="acts">
			<a href="#" id="forget">忘记密码？</a> | <a href="login_toRegisterPage.action">注册新帐号</a>
		</div>
	</div>
	<script>
		$(document).ready(
						function() {
							PromptConfig.addMask("liveblur", ".istk-container");
							var rt = "";
					
							$(document).on("blur, keyup", ".form-group input",
									function() {
										check(this);
									});
		
							checkAuthCode();
							
							$("input").keydown(function(e) {
								if (e.keyCode === 13 || e.charCode === 13) {
									$("#login-submit").trigger("click");
								}
							});
							$("img.captcha").click(
									function() {
										$(this)[0].src = "checkCode_getAuthCode.action?t="+ Math.random();
										$("#captcha").val("");
									});
							$("#forget").click(
									function() {
										$("form[name='login-form']").remove();
										$("form[name='reset-form']")
												.removeClass("hide");
										$(".loginbox .title").text("密码重设");
									});
							resetSubmit();
							loginSubmit();
						});
	<%--验证码校验--%>
	function check(obj) 
	{
			var val = obj.value;
			if($.trim(val) === "") 
			{
			   $(obj).parent().parent().removeClass("has-success").addClass("has-error");
			}
			else 
			{
			   $(obj).parent().parent().removeClass("has-error").addClass("has-success");
			}
	}
		
	<%--验证码校验--%>
	function checkAuthCode()
	{
		$("#captcha").keyup(function(e) {
					if ($(this).val().length == 4)
					{
						$.ajax({
							type : 'GET',
							url : 'checkCode_checkAuthCode.action',
							dataType : 'text',
							async: true,
							data:"captcha="+$(this).val(),
							success : function(text) {
								if(text=='SUCCESS')
								{
								     $("#captcha").parent().find("ul").text("");
								}
								else
								{
									$("#captcha").parent().find("ul").text("验证码输入错误");
									$("img.captcha").trigger("click");
									$("#captcha").val("");
								}
							}
						});
					}
				});
	}
	<%--登录提交--%>
	function loginSubmit()
	{
		var form = document.forms["login-form"];
		form.focus();
		$("#login-submit").click(
				function() {
					$(form).find(".form-group input").each(
							function() {
								check(this);
							});
					if ($(".has-error").length > 0) {
						return false;
					}
					
					var email = $("#email").val();
					var password = $("#password").val();

					var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
					if (!reg.test(email)) {
						$("#email").parent().find("ul").text("请输入正确格式邮箱地址");
						return;
					}
					
					if ($("#captcha").val().length < 4) {
						$("#captcha").parent().find("ul").text("验证码输入错误");
						$("img.captcha").trigger("click");
						$("#captcha").val("");
						return false;
					}
	
					$.ajax({
						type : 'GET',
						url : 'login_userLogin.action',
						dataType : 'text',
						async: true,
						data : "userBean.email="+email+"&userBean.password="+password,
						success : function(text) {
							if (text == "true") 
							{
								location.href = 'index.jsp';
							}
							else if(text =="NOEMAILCONFIRM")
							{
								$.prompt("亲,您还没有完成邮箱确认了呢,马上去验证吧.");
								$("img.captcha").trigger("click");
								$("#captcha").val("");
							}
							else
							{
								$.prompt("亲,您的邮箱或密码输入不正确呢.");
								$("img.captcha").trigger("click");
								$("#captcha").val("");
							}
						}
					});
					
					return false;

				});
	}
	<%--重新邮件--%>
	function resetSubmit()
	{
		$("#reset-submit, #retry").click(function() 
				{
						var email = $("#registerEmail").val();
						var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
						if (!reg.test(email)) {
							$.prompt("请输入正确格式邮箱地址");
							return;
						}
						$.ajax({
							type : 'GET',
							url : 'login_confirmSend.action',
							dataType : 'text',
							async: true,
							data : "registerEmail="+email,
							success : function(text) {
								if (text == "true") 
								{
									$.prompt({
										text : "邮件已经成功发送，请登录您的邮箱查收，如果无法正常接收，请检查邮件是否被屏蔽或重新发送。",
										icon : "success"
										});
										$("#email").attr("readonly","readonly");
										$("#reset-submit").hide();
										$("#retry").removeClass("hide").show();
								}
								else if(text == "NOEMAIL")
								{
									$.prompt("亲,您输入的邮箱不存在呢.");
								}
								else
								{
									$("#notice").text(data).attr("class","alert alert-success");

								}
							}
						});
					
					});
	}
	</script>


	<div
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>