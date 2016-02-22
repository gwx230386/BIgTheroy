package com.metarnet.systemManage.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.metarnet.base.bean.UserBean;
import com.metarnet.systemManage.bean.BusinessUtil;

/**
 * @Description: cookie
 * @author: lcgu
 * @date: 2014-5-14 上午10:41:45
 */
public class CookieUtil {
	/**
	 * 设置cookie
	 * @param response
	 * @param name  cookie名字
	 * @param value cookie值
	 */
	public static void addCookie(String name,String value){
		
		HttpServletResponse  response = ServletActionContext.getResponse();
		Cookie cookie = new Cookie(name,value);
	    response.addCookie(cookie);
	    
	}
	/**
	 * @Description: 根据名字获取cookie
	 * @author: lcgu
	 * @param name
	 * @return
	 * @date: 2014-5-23 上午11:59:16
	 */
	public static Cookie getCookieByName(String name){
		
		HttpServletRequest  request = ServletActionContext.getRequest();
	    Map<String,Cookie> cookieMap = ReadCookieMap(request);
	    if(cookieMap.containsKey(name)){
	        Cookie cookie = (Cookie)cookieMap.get(name);
	        return cookie;
	    }else{
	        return null;
	    }  
	}
	/**
	 * @Description: 封装cookie到map
	 * @author: lcgu
	 * @param request
	 * @return
	 * @date: 2014-5-23 上午11:58:39
	 */
	private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){ 
	    Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	    Cookie[] cookies = request.getCookies();
	    if(null!=cookies){
	        for(Cookie cookie : cookies){
	            cookieMap.put(cookie.getName(), cookie);
	        }
	    }
	    return cookieMap;
	}
}
