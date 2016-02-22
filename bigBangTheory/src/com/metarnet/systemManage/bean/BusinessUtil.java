package com.metarnet.systemManage.bean;

import org.apache.struts2.ServletActionContext;

import com.metarnet.base.util.PathUtil;
import com.metarnet.base.util.PropertiesUtil;



/**
 * @Description: 业务公共类
 * @author: lcgu
 * @date: 2013-3-20
 */
public class BusinessUtil {

	 public static String path = ServletActionContext.getServletContext().getRealPath("");
	
	 // 确认时间失效
	 public static String CONFIRM_TIME_OUT = "EMAILERROR";
	 
	 // 确认成功
	 public static String CONFIRM_EMAIL_SUCCESS = "EMAILSUCCESS";

}
