package com.metarnet.systemManage.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.metarnet.base.action.CommandContext;
import com.metarnet.base.bean.UserBean;
import com.metarnet.base.constants.BaseConstants;

/**
 * @Description: 登陆拦截过滤器
 * @author: wubin
 * @date: 2013-5-24
 */
public class LoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		//判断用户是否登录
		 HttpServletResponse response = (HttpServletResponse) arg1;    
	     HttpServletRequest request=(HttpServletRequest)arg0;  
	     HttpSession session = request.getSession(true);  
	     
		 String url = request.getRequestURI();
		 arg2.doFilter(arg0, arg1);

//		if(url != null && url.toUpperCase().indexOf("LOGIN") > 0) {
//			
//			//如果登录，释放控制权
//			arg2.doFilter(arg0, arg1);
//		 } else {
//			
//			try {
//				if(session != null && session.getAttribute("userName") != null)
//				{
//					//如果登录，释放控制权
//					arg2.doFilter(arg0, arg1);
//				}else if(url.toUpperCase().indexOf("UPLOAD")>0){
//					
//					arg2.doFilter(arg0, arg1);
//
//				}
//				else
//				{
//					
//					//未登录，返回到登录页面
//					response.sendRedirect("timeout.jsp");
//				}
//			} catch (IllegalStateException e) {
//				
//				
//				// session 过期返回登陆页面
//				response.sendRedirect("timeout.jsp");
//			}
//		}
	}

	public void init(FilterConfig config) throws ServletException {
	}
}
