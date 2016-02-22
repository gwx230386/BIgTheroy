package com.metarnet.systemManage.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.metarnet.systemManage.bean.DeviceBean;
import com.metarnet.systemManage.dao.DeviceManageDao;
import com.metarnet.systemManage.util.MysqlBaseDaoImpl;

/**
 * @Description: 设备信息Dao
 * @author: lcgu
 * @date: 2015-10-16 上午11:23:26 
 */
public class DeviceManageDaoImpl extends MysqlBaseDaoImpl implements DeviceManageDao
{

	/**@Description: 查询设备信息
	 * @author: lcgu
	 * @param deviceId
	 * @return
	 * @date: 2015-10-16 下午1:47:10 
	 */
	@Override
	public Map<String, String> queryDeviceById(String deviceId)
	{
		Map<String,String> deviceMap = new HashMap<String,String>();
		deviceMap.put("deviceId", "1521");
		deviceMap.put("number", "示例设备");
		deviceMap.put("type", "1523");
		deviceMap.put("remark", "备注");
		deviceMap.put("battery", "50%");

		return deviceMap;
	}

	/**@Description: 根据id查询字典集合
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2015-10-20 下午3:55:21 
	 */
	@Override
	public List<Map<String, String>> queryDictionaryByID(String id)
	{

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT t.* FROM CODE_LIBRARY t WHERE t.CODENO ='"+id+"'  order by itemno");
		return queryForList(sql.toString());
	}

	/**@Description: TODO
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-20 下午4:49:50 
	 */
	@Override
	public List<Map<String, String>> queryMoisturecontent(DeviceBean deviceBean)
	{
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT ID, DEVICE_ID, CM_CONVALUE_10, CM_CONVALUE_20, CM_CONVALUE_30, CM_CONVALUE_40, CM_CONVALUE_50, CM_CONVALUE_60, CM_CONVALUE_70, CM_CONVALUE_80, CM_CONVALUE_90, ");
		
		sql.append(" to_char(PUTTIME,'YYYY-MM-DD HH24:MI:SS') as PUTTIME"); //DB2;
		//sql.append(" date_format(PUTTIME,'%Y-%c-%d %h:%i:%s') as PUTTIME"); //mysql;

		sql.append(" FROM TB_WATERCONTENT t WHERE 1=1");
		if(StringUtils.isNotEmpty(deviceBean.getDeviceId()))
		{
			sql.append(" AND t.DEVICE_ID ='"+deviceBean.getDeviceId()+"'");
		}
		if(StringUtils.isNotEmpty(deviceBean.getStartTime()))
		{
			sql.append(" AND t.PUTTIME BETWWEN'"+deviceBean.getStartTime()+"' AND '"+deviceBean.getEndTime()+"'");
		}
		return queryForList(sql.toString());
	}

	/**@Description: TODO
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-22 下午4:04:56 
	 */
	@Override
	public List<Map<String, String>> queryBatterypower(DeviceBean deviceBean)
	{
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT ID, DEVICE_ID, BATTERYPOWER, INPUTVOLTAGE,");
		
		sql.append(" to_char(PUTTIME,'YYYY-MM-DD HH24:MI:SS') as PUTTIME"); //DB2;
		//sql.append(" date_format(PUTTIME,'%Y-%c-%d %h:%i:%s') as PUTTIME"); //mysql;

		sql.append(" FROM TB_BATTERY t WHERE 1=1");
		if(StringUtils.isNotEmpty(deviceBean.getDeviceId()))
		{
			sql.append(" AND t.DEVICE_ID ='"+deviceBean.getDeviceId()+"'");
		}
		if(StringUtils.isNotEmpty(deviceBean.getStartTime()))
		{
			sql.append(" AND t.PUTTIME BETWWEN'"+deviceBean.getStartTime()+"' AND '"+deviceBean.getEndTime()+"'");
		}
		return queryForList(sql.toString());
	}

	/**@Description: TODO
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-22 下午4:04:56 
	 */
	@Override
	public List<Map<String, String>> querySoilTemperature(DeviceBean deviceBean)
	{
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT ID, DEVICE_ID, CM_CONVALUE_0,CM_CONVALUE_10, CM_CONVALUE_20, CM_CONVALUE_30, CM_CONVALUE_40, CM_CONVALUE_50, CM_CONVALUE_60, CM_CONVALUE_70, CM_CONVALUE_80, CM_CONVALUE_90,CM_CONVALUE_100,  ");
		
		sql.append(" to_char(PUTTIME,'YYYY-MM-DD HH24:MI:SS') as PUTTIME"); //DB2;
		//sql.append(" date_format(PUTTIME,'%Y-%c-%d %h:%i:%s') as PUTTIME"); //mysql;

		sql.append(" FROM TB_TEMPERATURE t WHERE 1=1");
		if(StringUtils.isNotEmpty(deviceBean.getDeviceId()))
		{
			sql.append(" AND t.DEVICE_ID ='"+deviceBean.getDeviceId()+"'");
		}
		if(StringUtils.isNotEmpty(deviceBean.getStartTime()))
		{
			sql.append(" AND t.PUTTIME BETWEEN'"+deviceBean.getStartTime()+"' AND '"+deviceBean.getEndTime()+"'");
		}
		return queryForList(sql.toString());
	}
	
}
