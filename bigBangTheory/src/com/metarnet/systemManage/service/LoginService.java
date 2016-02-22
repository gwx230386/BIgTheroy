package com.metarnet.systemManage.service;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.UserBean;

/**
 * @Description: 主界面service接口
 * @author: lcgu
 * @date:2015-10-8 上午09:45:10
 */
public interface LoginService
{

	/**
	 * @Description: 获取用户信息
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2014-1-8 上午10:21:13
	 */
	Map<String, String> getUser(UserBean userBean);

	/**
	 * @Description: 查询客户信息()
	 * @author: lcgu
	 * @date: 2015-8-27 下午5:55:09
	 */
	List<Map<String, String>> queryCustomerInfo();

	/**@Description: 检查邮箱是否存在
	 * @author: lcgu
	 * @param registerEmail
	 * @return
	 * @date: 2015-10-23 下午2:34:54 
	 */
	Map<String, String> checkEmail(String registerEmail);

	/**@Description: 用户注册
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-26 下午1:50:37 
	 */
	String register(UserBean userBean);

	/**@Description: 重设密码
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-30 上午10:22:32 
	 */
	String resetPassWord(UserBean userBean);

	/**@Description: 用户确认
	 * @author: lcgu
	 * @param emailVerifyCode
	 * @param string 
	 * @return
	 * @date: 2015-10-30 下午2:40:16 
	 */
	String updateUserStatus(String emailVerifyCode, String string);

}
