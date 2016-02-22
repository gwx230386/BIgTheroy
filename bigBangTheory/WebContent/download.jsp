<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.net.URLEncoder"/>
<jsp:directive.page import="java.io.FileInputStream"/>
<jsp:directive.page import="java.io.File"/>
<jsp:directive.page import="java.io.PrintWriter"/>
<%
	//下载文件
	response.reset();//可以加也可以不加
	response.setContentType("application/OCTET-STREAM;");

	String uploadName = request.getParameter("uploadname");
	String fileName = request.getParameter("filename");
	
	String savePath = "attachments\\";
	String filePath = getServletContext().getRealPath("/") + savePath
			+ uploadName;

	System.out.println("filePath:" + filePath);
	System.out.println("fileName:" + fileName);

	//fileName = URLEncoder.encode(fileName, "UTF-8");

	response.addHeader("Content-Disposition", "attachment;filename="
			+ fileName);

	FileInputStream is = null;
	try {
		File file = new File(filePath);
		is = new FileInputStream(file);

		int b = 0;

		PrintWriter pw = response.getWriter();
		while ((b = is.read()) != -1) {
			pw.write(b);
		}

		pw.close();
		response.flushBuffer();
		out.clear();
		out = pageContext.pushBody();
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>