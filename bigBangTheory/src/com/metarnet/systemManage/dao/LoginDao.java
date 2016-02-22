package com.metarnet.systemManage.dao;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.UserBean;

/**
 * @Description: 主界面dao接口
 * @author: lcgu
 * @date: 2015-10-8 上午09:46:54 
 */
public interface LoginDao {

	/**@Description: 获取用户信息
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2014-1-8 上午10:21:59 
	 */
	Map<String, String> getUser(UserBean userBean);

	/**@Description: 查询客户信息
	 * @author: lcgu
	 * @return
	 * @date: 2015-8-27 下午5:56:48 
	 */
	List<Map<String, String>> queryCustomerInfo();

	/**@Description: 检查邮箱是否存在
	 * @author: lcgu
	 * @param registerEmail
	 * @return
	 * @date: 2015-10-23 下午2:36:03 
	 */
	Map<String, String> checkEmail(String registerEmail);

	/**@Description: 用户注册
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-26 下午1:51:36 
	 */
	String register(UserBean userBean);

	/**@Description: 重设密码
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-30 上午10:23:11 
	 */
	String resetPassWord(UserBean userBean);

	/**@Description: 更新用户状态
	 * @author: lcgu
	 * @param userId
	 * @param status
	 * @return
	 * @date: 2015-10-30 下午2:43:32 
	 */
	String updateUserStatus(String userId, String status);

}
