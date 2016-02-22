package com.metarnet.systemManage.service.impl;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.DeviceBean;
import com.metarnet.systemManage.dao.DeviceManageDao;
import com.metarnet.systemManage.service.DeviceManageService;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-10-16 下午1:34:20 
 */
public class DeviceManageServiceImpl implements DeviceManageService
{

	private DeviceManageDao deviceManageDao;

	/**@Description: 查询设备信息
	 * @author: lcgu
	 * @param deviceId
	 * @date: 2015-10-16 下午1:44:28 
	 */
	@Override
	public Map<String,String> queryDeviceById(String deviceId)
	{
		return deviceManageDao.queryDeviceById(deviceId);	
	}
	public DeviceManageDao getDeviceManageDao()
	{
		return deviceManageDao;
	}

	public void setDeviceManageDao(DeviceManageDao deviceManageDao)
	{
		this.deviceManageDao = deviceManageDao;
	}
	/**@Description: 根据id查询字典集合
	 * @author: lcgu
	 * @param string
	 * @return
	 * @date: 2015-10-20 下午3:54:30 
	 */
	@Override
	public List<Map<String, String>> queryDictionaryByID(String id)
	{
		return deviceManageDao.queryDictionaryByID(id);
	}
	/**@Description: TODO
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-20 下午4:48:51 
	 */
	@Override
	public List<Map<String, String>> queryDeviceChart(DeviceBean deviceBean)
	{

		// 查询水费含量
		if("moisturecontent".endsWith(deviceBean.getQueryType()))
		{
			return deviceManageDao.queryMoisturecontent(deviceBean);

		}
		// 电池电量
		else if("batterypower".endsWith(deviceBean.getQueryType()))
		{
			return deviceManageDao.queryBatterypower(deviceBean);
		}
		// 土壤温度
		else
		{
			return deviceManageDao.querySoilTemperature(deviceBean);
		}
	}
	
}
