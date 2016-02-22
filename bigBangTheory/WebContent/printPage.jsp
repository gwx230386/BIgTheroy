<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
			String url = request.getParameter("url");
		
		%>
		<title>打印页面</title>
        <script src="<%=request.getContextPath()%>/js/common/jquery-1.8.0.js"
			type="text/javascript"></script>
			<script type="text/javascript">
			$(function(){
				
				setTimeout(hideButton,1500);
			});
			function hideButton(){

				var obj = $("#resourceFormIframe").contents().find(".ui-button");
				obj.hide();
			}
			</script>
	</head>

	<body style="background-color:#E5EDEF;margin:0px auto">
	
	  <div style="height:auto;width:100%;text-align:center">
		<iframe name="resourceFormIframe" id="resourceFormIframe"
			src="<%=request.getParameter("url")%>" scrolling="no"
			frameborder="0" width="900px" height="1200px"></iframe>
	 </div>
	</body>
</html>
