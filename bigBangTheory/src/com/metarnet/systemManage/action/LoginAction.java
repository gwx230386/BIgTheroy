package com.metarnet.systemManage.action;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.alibaba.fastjson.JSON;
import com.metarnet.base.action.BaseAction;
import com.metarnet.base.util.WebUtils;
import com.metarnet.systemManage.bean.BusinessUtil;
import com.metarnet.systemManage.bean.UserBean;
import com.metarnet.systemManage.service.LoginService;
import com.metarnet.systemManage.util.CodeUtil;
import com.metarnet.systemManage.util.DateUtil;
import com.metarnet.systemManage.util.MD5Util;
import com.metarnet.systemManage.util.NumberUtil;

/**
 * @Description: 主页面action
 * @author: lcgu
 * @date: 2015-10-8 下午5:10:40
 */
public class LoginAction extends BaseAction
{

    private static Logger logger = Logger.getLogger(LoginAction.class);  

	private String email;
	 
	private String userName;
	 
	private String password;
	 
	private String password_confirm;
	 
    private String organization;
	
    private String mobile;
    
    private String userId;
    
    // 域名
    private String domainName;
	/**
	 * 用户bean
	 */
	private UserBean userBean;
	/**
	 * 主界面service
	 */
	private LoginService loginService;
	
	/**
	 * spring邮件发送器
	 */
	private JavaMailSenderImpl mailSender;
	
	/**
	 * 请求Map
	 */
	private Map<String, String> requestMap;

	/**
	 * 返回map
	 */
	private Map<String, String> reponseMap;
	
	/**
	 * 注册邮箱
	 */
	private String registerEmail;
	
	/**
	 * 邮箱注册
	 */
	private String emailVerify;
	
	private HttpServletRequest request = ServletActionContext.getRequest();


	/**
	 * @Description: 转向用户登录页面
	 * @author: lcgu
	 * @date: 2013-11-4 上午11:27:54
	 */
	public String toLoginPage()
	{

		return "toLoginPage";
	}
	
	/**
	 * @Description: 转向注册页面
	 * @author: lcgu
	 * @date: 2013-11-4 上午11:27:54
	 */
	public String toRegisterPage()
	{

		return "toRegisterPage";
	}

	/**
	 * @Description: 用户登录判断
	 * @author: lcgu
	 * @throws UnsupportedEncodingException
	 * @date: 2013-11-4 下午01:25:17
	 */
	public void userLogin()
	{
		userBean.setPassword(MD5Util.convertMD5(userBean.getPassword()));
	    reponseMap = loginService.getUser(userBean);
	    
	    logger.info(reponseMap.toString());
	    if(reponseMap.size()>0)
	    {
			HttpSession session = request.getSession(true);
		
			if("01".equals(reponseMap.get("status")))
			{
				session.setAttribute("userName", reponseMap.get("userName"));
				session.setAttribute("userId", reponseMap.get("userId"));
				WebUtils.write("true");
			}
			else if("02".equals(reponseMap.get("status")))
			{
				WebUtils.write("NOEMAILCONFIRM");
			}
	    }
	    else
	    {
			WebUtils.write("false");
	    }

	    
	}

	/**
	 * @Description: 注册
	 * @author: lcgu
	 * @date: 2015-10-14 下午3:51:58
	 */
	public void register()
	{	
		userBean = new UserBean();
		userBean.setEmail(email);
		userBean.setMobile(mobile);
		userBean.setUserName(userName);
		userBean.setPassword(MD5Util.convertMD5(password));
		userBean.setOrganization(organization);
		userBean.setUserId(NumberUtil.getRandomKey());
	    String register = loginService.register(userBean);
        
	    if("true".equals(register))
	    {
	    	MimeMessage mimeMessage = mailSender.createMimeMessage();  
	    	try
			{
				MimeMessageHelper  mimeMessageHelper= new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setFrom(mailSender.getUsername());
		        mimeMessageHelper.setTo(userBean.getEmail());  
		        mimeMessageHelper.setSubject("用户注册确认");  
		        StringBuffer body = new StringBuffer();
		        body.append(" 亲:"+userBean.getUserName()+":</br>");
		        body.append(" 您正在进行邮箱绑定，请点击以下链接完成验证.</br>");
		        body.append(domainName);
		        body.append("/login_emailVerify.action?");
		        
		        StringBuffer urlParams = new StringBuffer();

		        urlParams.append("&"+MD5Util.convertMD5(DateUtil.formatDayTime(new Date()))+"");
		        urlParams.append("&"+MD5Util.convertMD5(userBean.getUserId())+"");
		        urlParams.append("&"+MD5Util.convertMD5(userBean.getUserName())+"");
		        String encodeUrl = CodeUtil.encode(urlParams.toString());
		   
		        body.append(encodeUrl);
		        body.append(" </br>");
		        body.append(" (该链接在24小时内有效，24小时后需要重新获取验证邮件)</br>");
		        body.append(" 如果该链接无法点击，请将其复制粘贴到你的浏览器地址栏中访问.</br>");
		        body.append(" 如果这不是您的邮件，请忽略此邮件.</br>");
		        mimeMessageHelper.setText(body.toString(), true);  
		        mailSender.send(mimeMessage);  
		        
			}
			catch (MessagingException e)
			{
				logger.error(e);
			}
	    	finally
	    	{
	    		logger.debug(userBean.toString());
			}
	    }
		WebUtils.write(register);
	}
	
	/**
	 * @Description: 邮箱确认
	 * @author: lcgu
	 * @return
	 * @throws ParseException 
	 * @date: 2015-10-29 下午2:56:54
	 */
	public String emailVerify() throws ParseException
	{
		String url = CodeUtil.decode(request.getQueryString());
		
		String emailVerifyCode[] =url.split("&");
		Date currentDate = new Date();
		Date registerDate = DateUtil.parse(MD5Util.convertMD5(emailVerifyCode[1]));
		
		long diff = currentDate.getTime() - registerDate.getTime();   
		long hours = diff / (1000 * 60 * 60); 
		
		// 时间逾期判断
		if(hours>24)
		{
			emailVerify = BusinessUtil.CONFIRM_TIME_OUT;
		}
		else
		{
			emailVerify = BusinessUtil.CONFIRM_EMAIL_SUCCESS;
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", MD5Util.convertMD5(emailVerifyCode[2]));
			session.setAttribute("userName", MD5Util.convertMD5(emailVerifyCode[3]));

		    String resetPassWord = loginService.updateUserStatus(MD5Util.convertMD5(emailVerifyCode[2]),"01");

		}
		return "emailVerify";
	}
	/**
	 * @Description: 注销
	 * @author: lcgu
	 * @date: 2015-10-23 下午2:07:17
	 */
	public String cancel()
	{
		HttpSession session = request.getSession(true);
		session.removeAttribute("userId");
		session.removeAttribute("userName");

		return "toIndex";
	}
	/**
	 * @Description: 校验邮箱是否存在
	 * @author: lcgu
	 * @date: 2015-10-14 下午4:04:08
	 */
	public void checkEmail()
	{
	   Map<String, String> registerEmailMap = loginService.checkEmail(registerEmail);
        
	    if(registerEmailMap.size()>0)
	    {
			WebUtils.write("false");
	    }
	    else
	    {
			WebUtils.write("true");
	    }
	}
	
	/**
	 * @Description: 重设密码：确认发送邮件
	 * @author: lcgu
	 * @date: 2015-10-30 上午9:03:52
	 */
	public void confirmSend()
	{
		 Map<String, String> registerEmailMap = loginService.checkEmail(registerEmail);
		 if(registerEmailMap.size()==0)
		 {
			WebUtils.write("NOEMAIL");
		 }
		 else
		 {
			 MimeMessage mimeMessage = mailSender.createMimeMessage();  
		    	try
				{
					MimeMessageHelper  mimeMessageHelper= new MimeMessageHelper(mimeMessage, true, "UTF-8");
					mimeMessageHelper.setFrom(mailSender.getUsername());
			        mimeMessageHelper.setTo(registerEmailMap.get("EMAIL"));  
			        mimeMessageHelper.setSubject("用户密码重设");  
			        StringBuffer body = new StringBuffer();
			        body.append(" 亲:"+registerEmailMap.get("USERNAME")+":</br>");
			        body.append(" 您正在进行邮箱重设密码，请点击以下链接完成操作.</br>");
			        body.append(domainName);
			        body.append("/login_toResetPassWord.action?");
			        
			        StringBuffer urlParams = new StringBuffer();
			        urlParams.append("&"+MD5Util.convertMD5(DateUtil.formatDayTime(new Date()))+"");
			        urlParams.append("&"+MD5Util.convertMD5(registerEmailMap.get("USERID"))+"");
			        urlParams.append("&"+MD5Util.convertMD5(registerEmailMap.get("EMAIL"))+"");
			        String encodeUrl = CodeUtil.encode(urlParams.toString());
			   
			        body.append(encodeUrl);
			        body.append(" </br>");
			        body.append(" (该链接在24小时内有效，24小时后需要重新获取验证邮件)</br>");
			        body.append(" 如果该链接无法点击，请将其复制粘贴到你的浏览器地址栏中访问.</br>");
			        body.append(" 如果这不是您的邮件，请忽略此邮件.</br>");
			        mimeMessageHelper.setText(body.toString(), true);  
			        mailSender.send(mimeMessage);  
			        
				}
				catch (MessagingException e)
				{
					logger.error(e);
				}
		    	finally
		    	{
		    		logger.debug(registerEmailMap.toString());
				}
				WebUtils.write("true");
		 }
	}
	
	/**
	 * @Description: 重设密码页面
	 * @author: lcgu
	 * @return
	 * @throws ParseException 
	 * @date: 2015-10-30 上午9:54:49
	 */
	public String toResetPassWord() throws ParseException
	{
		String url = CodeUtil.decode(request.getQueryString());
		String emailVerifyCode[] = url.split("&");
		Date currentDate = new Date();
		Date registerDate = DateUtil.parse(MD5Util.convertMD5(emailVerifyCode[1]));
		
        userId = MD5Util.convertMD5(emailVerifyCode[2]);
		
		long diff = currentDate.getTime() - registerDate.getTime();   
		long hours = diff / (1000 * 60 * 60); 
		
		// 时间逾期判断
		if(hours>24)
		{
			emailVerify = BusinessUtil.CONFIRM_TIME_OUT;
		}
		
		return "resetPassword";
	}
	


	/**
	 * @Description: 重设密码
	 * @author: lcgu
	 * @return
	 * @date: 2015-10-30 上午10:13:34
	 */
	public void resetPassWord()
	{
		userBean = new UserBean();
		userBean.setEmail(email);
		userBean.setPassword(MD5Util.convertMD5(password));
		userBean.setUserId(userId);
	    String resetPassWord = loginService.resetPassWord(userBean);
		WebUtils.write(resetPassWord);

	}
	
	
	/**
	 * @Description: 查询客户信息
	 * @author: lcgu
	 * @date: 2015-8-27 下午5:41:36
	 */
	public void queryCustomerInfo()
	{
		loginService.queryCustomerInfo();
	}

	public LoginService getLoginService()
	{
		return loginService;
	}

	public void setLoginService(LoginService loginService)
	{
		this.loginService = loginService;
	}

	public UserBean getUserBean()
	{
		return this.userBean;
	}

	public void setUserBean(final UserBean userBean)
	{
		this.userBean = userBean;
	}

	public Map<String, String> getRequestMap()
	{
		return requestMap;
	}

	public void setRequestMap(Map<String, String> requestMap)
	{
		this.requestMap = requestMap;
	}

	public Map<String, String> getReponseMap()
	{
		return reponseMap;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getPassword_confirm()
	{
		return password_confirm;
	}

	public void setPassword_confirm(String password_confirm)
	{
		this.password_confirm = password_confirm;
	}

	public String getOrganization()
	{
		return organization;
	}

	public void setOrganization(String organization)
	{
		this.organization = organization;
	}

	public String getMobile()
	{
		return mobile;
	}

	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}

	public HttpServletRequest getRequest()
	{
		return request;
	}

	public void setRequest(HttpServletRequest request)
	{
		this.request = request;
	}

	public void setReponseMap(Map<String, String> reponseMap)
	{
		this.reponseMap = reponseMap;
	}

	public String getRegisterEmail()
	{
		return registerEmail;
	}

	public void setRegisterEmail(String registerEmail)
	{
		this.registerEmail = registerEmail;
	}

	public JavaMailSenderImpl getMailSender()
	{
		return mailSender;
	}

	public void setMailSender(JavaMailSenderImpl mailSender)
	{
		this.mailSender = mailSender;
	}

	public String getEmailVerify()
	{
		return emailVerify;
	}

	public void setEmailVerify(String emailVerify)
	{
		this.emailVerify = emailVerify;
	}
	
	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getDomainName()
	{
		return domainName;
	}

	public void setDomainName(String domainName)
	{
		this.domainName = domainName;
	}
	
	
}
