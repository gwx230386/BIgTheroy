package com.metarnet.systemManage.service.impl;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.UserBean;
import com.metarnet.systemManage.dao.LoginDao;
import com.metarnet.systemManage.service.LoginService;

/**
 * @Description: 主界面service接口
 * @author: lcgu
 * @date: 2015-10-8 上午09:45:10
 */
public class LoginServiceImpl implements LoginService
{

	private LoginDao loginDao;

	/**
	 * @Description:
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-8-27 下午4:06:28
	 */
	@Override
	public Map<String, String> getUser(UserBean userBean)
	{
		return loginDao.getUser(userBean);
	}
	
	/**@Description: 检查邮箱是否存在
	 * @author: lcgu
	 * @param registerEmail
	 * @return
	 * @date: 2015-10-23 下午2:35:13 
	 */
	@Override
	public Map<String, String> checkEmail(String registerEmail)
	{
		return loginDao.checkEmail(registerEmail);
	}
	/**
	 * @Description: 查询客户信息
	 * @author: lcgu
	 * @date: 2015-8-27 下午5:55:26
	 */
	@Override
	public  List<Map<String, String>> queryCustomerInfo()
	{
		return loginDao.queryCustomerInfo();
	}

	public LoginDao getLoginDao()
	{
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao)
	{
		this.loginDao = loginDao;
	}

	/**@Description: 用户注册
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-26 下午1:51:06 
	 */
	@Override
	public String register(UserBean userBean)
	{
		return loginDao.register(userBean);
	}

	/**@Description: 重设密码
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-30 上午10:22:49 
	 */
	@Override
	public String resetPassWord(UserBean userBean)
	{
		// TODO Auto-generated method stub
		return loginDao.resetPassWord(userBean);
	}

	/**@Description: TODO
	 * @author: lcgu
	 * @param emailVerifyCode
	 * @return
	 * @date: 2015-10-30 下午2:41:41 
	 */
	public String updateUserStatus(String userId,String status)
	{
		// TODO Auto-generated method stub
		return loginDao.updateUserStatus(userId,status);
	}

	

}
