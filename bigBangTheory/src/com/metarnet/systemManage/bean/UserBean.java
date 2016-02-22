package com.metarnet.systemManage.bean;

/**
 * 
 * @Description: 用户信息bean 
 * @author: lcgu
 * @date: 2015-10-8 下午5:08:40
 */
public class UserBean {

	private String email;
	 
	private String userName;
	 
	private String password;
	 
	private String password_confirm;
	 
    private String organization;
	
    private String mobile;
    
    private String userId;

	public String getPassword() {
		return password;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
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

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	
	
}
