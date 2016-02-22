package com.metarnet.systemManage.dao.impl;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.UserBean;
import com.metarnet.systemManage.dao.LoginDao;
import com.metarnet.systemManage.util.MysqlBaseDaoImpl;
import com.metarnet.systemManage.util.NumberUtil;

/**
 * @Description: 主界面dao
 * @author: lcgu
 * @date: 2015-10-8 上午09:47:45 
 */
public class LoginDaoImpl extends MysqlBaseDaoImpl implements LoginDao{

	/**@Description: 获取用户信息
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2013-11-4 上午11:34:40 
	 */
	public Map<String, String> getUser(UserBean userBean) {
   
		StringBuffer  sql =  new StringBuffer();
		sql.append(" SELECT t.* FROM USER_INFO t  ");
		sql.append(" WHERE email='"+userBean.getEmail()+"'");
		sql.append(" AND password = '"+userBean.getPassword()+"'");
		
		return queryForMap(sql.toString());
	}

	/**@Description: 查询客户信息
	 * @author: lcgu
	 * @return
	 * @date: 2015-8-27 下午5:56:57 
	 */
	@Override
	public List<Map<String, String>> queryCustomerInfo()
	{

		StringBuffer sql =  new StringBuffer();
		sql.append(" SELECT t.CUSTOMERID , t.CUSTOMERNAME,i.CREDITLEVEL");
		sql.append(" FROM CUSTOMER_INFO t,IND_INFO i WHERE  t.CUSTOMERID = i.CUSTOMERID ");
		sql.append(" FETCH FIRST 10 ROWS ONLY ");
		
		return this.findByPage(sql.toString());
	}

	/**@Description: 检查邮箱是否存在
	 * @author: lcgu
	 * @param registerEmail
	 * @return
	 * @date: 2015-10-23 下午2:36:19 
	 */
	@Override
	public Map<String, String> checkEmail(String registerEmail)
	{
		StringBuffer sql =  new StringBuffer();
		sql.append(" SELECT * FROM USER_INFO t  ");
		sql.append(" WHERE email='"+registerEmail+"'");
		
		return this.queryForMap(sql.toString());
	}

	/**@Description: 注册用户
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-26 下午1:51:43 
	 */
	@Override
	public String register(UserBean userBean)
	{
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO USER_INFO (USERID, LOGINID, USERNAME, PASSWORD, EMAIL, DEPT,MOBilE,STATUS)");
	    sql.append(" VALUES ('"+userBean.getUserId()+"', ' ', '"+userBean.getUserName()+"', '"+userBean.getPassword()+"', '"+userBean.getEmail()+"', '"+userBean.getOrganization()+"','"+userBean.getMobile()+"','02') ");
		return this.modify(sql.toString(),false);
	}

	/**@Description: 重设密码
	 * @author: lcgu
	 * @param userBean
	 * @return
	 * @date: 2015-10-30 上午10:23:24 
	 */
	@Override
	public String resetPassWord(UserBean userBean)
	{
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE USER_INFO");
		sql.append(" SET PASSWORD = '"+userBean.getPassword()+"',status='01' ");
		sql.append(" WHERE USERID = '"+userBean.getUserId()+"'");

		return modify(sql.toString(),false);
	}

	/**@Description: 更新用户状态
	 * @author: lcgu
	 * @param userId
	 * @param status
	 * @return
	 * @date: 2015-10-30 下午2:43:49 
	 */
	@Override
	public String updateUserStatus(String userId, String status)
	{

		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE USER_INFO");
		sql.append(" SET status='"+status+"' ");
		sql.append(" WHERE USERID = '"+userId+"'");

		return modify(sql.toString(),false);
	}

}
