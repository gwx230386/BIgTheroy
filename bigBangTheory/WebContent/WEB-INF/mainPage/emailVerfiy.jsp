<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>

<html>
<head>
<meta charset="utf-8">
<title>Insentek-邮箱确认</title>
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
</head>
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
<body>
	<header class="navbar istk-header navbar-fixed-top">
		<div class="navbar-inner">
			<a class="logo pull-left" href=""><img
				src="<%=path%>/images/insentek-logo-2.png"></a> <span
				class="lr-item pull-right"> <a
				href="login_toLoginPage.action">登录</a> <a
				href="login_toRegisterPage.action">注册</a>
			</span>
			<ul class="nav pull-left nav-link">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="about.jsp">我们</a></li>
				<li><a href="product.jsp">产品</a></li>
				<li><a href="partner.jsp">案例</a></li>
				<li><a href="device.jsp">我的设备</a></li>
			</ul>
		</div>
	</header>
	<div class="container-fluid istk-container">
				<form role="form" name="reg-form" action="" novalidate="novalidate">
					<s:if test="%{emailVerify=='EMAILERROR'}">
						<div class="loginbox">
							<div class="title">邮箱确认</div>
							<div class="content">
								<form role="form" name="reg-form" action=""
									novalidate="novalidate">
									<div class="reg-success" style="display: block;">
										<i class="fa fa-times fa-5x"></i>亲，链接失效了呢,重新注册一下吧。
									</div>
								</form>
							</div>
						</div>
					</s:if>
					<s:if test='%{emailVerify=="EMAILSUCCESS"}'>
						<div class="loginbox">
							<div class="title">邮箱确认</div>
							<div class="content">
								<form role="form" name="reg-form" action=""
									novalidate="novalidate">
									<div class="reg-success" style="display: block;">
										<i class="fa fa-check fa-5x"></i>亲，注册成功了呢.</br>
				                            <a href="index.jsp">点击转到主页</a>
									</div>
								</form>
							</div>
						</div>
					</s:if>
				</form>
	</div>
</body>
</html>