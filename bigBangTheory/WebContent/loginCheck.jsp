<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    HttpSession s = request.getSession(); 
    Object userName = s.getAttribute("userName");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
		if(userName!=null){
%>
				<span class="lr-item pull-right">
				   <a href="login_toLoginPage.action"><%=userName%></a>
				   <a href="login_cancel.action">注销</a>
				</span>
<%
		}else{
%>
				<span class="lr-item pull-right">
				   <a href="login_toLoginPage.action">登录</a>
				   <a href="login_toRegisterPage.action">注册</a>
				</span>
<%	  
		}
%>
</body>
</html>