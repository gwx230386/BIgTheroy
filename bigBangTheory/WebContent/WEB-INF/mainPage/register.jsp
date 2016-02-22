<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta charset="utf-8">
<title>Insentek - 用户注册</title>
<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery.validate.js"></script>
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
	width: 500px;
	margin: 40px auto;
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

.alert {
	margin-bottom: 0px;
	padding: 0px;
	background-color: #fff;
	border-color: #fff
}

.form-group {
	margin-bottom: 10px;
}

.reg-success {
	line-height: 76px;
	padding-left: 20px;
	margin: 30px 0px;
	display: none
}

.reg-success i.fa {
	color: green;
	float: left
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
				<a href="login_toRegisterPage.action">注册</a>
				</span>
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
			<div class="title">用户注册</div>
			<div class="content">
				<form role="form" name="reg-form" action="" novalidate="novalidate">
					<div class="form-group">
						<label class="control-label">*邮箱：</label> <input type="text"
							class="form-control" name="email" id="registerEmail">
					</div>
					<div class="form-group">
						<label class="control-label">*密码：</label> <input type="password"
							class="form-control" name="password" id="password">
					</div>
					<div class="form-group">
						<label class="control-label">*确认密码：</label> <input type="password"
							class="form-control" name="password_confirm">
					</div>
					<div class="form-group">
						<label class="control-label">企业名：</label> <input type="text"
							class="form-control" name="organization">
					</div>
					<div class="form-group">
						<label class="control-label">*姓名：</label> <input type="text"
							class="form-control" name="userName" placeholder="请输入您的真实姓名">
					</div>
					<div class="form-group">
						<label class="control-label">*手机号：</label> <input type="text"
							class="form-control" name="mobile" placeholder="请输入您的联系手机号">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block"
							style="margin-top: 30px;">确认注册</button>
					</div>
					<div class="reg-success">
						<i class="fa fa-check fa-5x"></i>激活邮件已经发送到您的注册邮箱，请登录您的邮箱确认！
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(
						function() {

							var form = document.forms["reg-form"];
							$(form).validate(
											{
												rules : {
													email : {
														required : true,
														email : true,
														remote : function() {
															return {
																url : "login_checkEmail.action?_t="+ Math.random(),
																type : "post",
															    dataType: "json",           //接受数据格式   
																data: {                     //要传递的数据
																	registerEmail: function() {
																            return $("#registerEmail").val();
																      }
																}
															};
														}
													},
													password : {
														required : true
													},
													password_confirm : {
														required : form.password.value !== "",
														equalTo : "#password"
													},
													organization : {
														required : false
													},
													name : {
														required : true
													},
													mobile : {
														required : true,
														mobile : true
													}
												},
												messages : {
													email : {
														required : "请输入您的联系邮箱!",
														email : "请输入合法的邮箱地址!",
														remote : "该邮箱已存在!"
													},
													password : {
														required : "请输入密码！"
													},
													password_confirm : {
														equalTo : "两次密码请输入一致！"
													},
													name : {
														required : "请输入您的真实姓名"
													},
													mobile : {
														required : "请输入手机号!",
														mobile : "您的手机号不符合格式，请重试！"
													}
												},
												highlight : function(e,
														errorClass, validClass) {
													$(e).parent().find(".alert").show();
												},
												unhighlight : function(e,
														errorClass, validClass) {
													$(e).parent().find(".alert").hide();
												},
												errorPlacement : function(
														error, e) {
													e.parent().find(".alert").remove();
													var div = "<div class='alert alert-danger'><i class='fa fa-minus-circle'></i>"
															+ error.html()
															+ "</div>";
													var error_div = $(div);
													e.parent().append(error_div);
												},
												submitHandler : function(f) {
													$(f).find("button").attr("disabled","disabled");
										
													$.ajax({
														type : 'POST',
														url : 'login_register.action',
														dataType : 'text',
														async: true,
														data:$(f).serialize(),
														success : function(text) {
															if(text=='true')
															{
																$(".form-group").remove();
																$(".reg-success").show();	
															}

														}
													});
												}
											});
						});
	</script>


	<div
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>