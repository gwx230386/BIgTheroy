<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
    HttpSession s = request.getSession(); 
    Object userName = s.getAttribute("userName");
%>

<html>
<head>
<title>Insentek - 我的设备</title>

<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/prompt.js"></script>
<script src="<%=path%>/js/app.core.js"></script>
<script src="<%=path%>/js/perfect-scrollbar.jquery.min.js"></script>
<script src="<%=path%>/js/app.device.list.js?v=28"></script>
<script src="<%=path%>/js/weChat.js"></script>
<link href="<%=path%>/css/prompt.css" rel="stylesheet">
<link href="<%=path%>/css/devicelist.css" rel="stylesheet">
<link href="<%=path%>/css/perfect-scrollbar.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/app.css" rel="stylesheet">

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="<%=path%>/js/fancyBox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<!-- Map-->
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=845f5781e2aa03e023dd86ccf21ad19a"></script> 

<style>
#device-info .sn {
	width: 150px;
}

#device-info .alias {
	width: 150px;
}

</style>
<link
	href="http://static.insentek.com/widgets/datepicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<%
		if(userName!=null){
%>
             <s:include value="deviceMap.jsp"></s:include>
<%
		}else{
%>
		<s:include value="/WEB-INF/mainPage/login.jsp"></s:include>
				
<%	  
		}
%>

</body>
</html>