package com.metarnet.systemManage.dao;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.DeviceBean;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-10-16 上午11:22:52 
 */
public interface DeviceManageDao
{

	/**@Description: 查询设备信息
	 * @author: lcgu
	 * @param deviceId
	 * @return
	 * @date: 2015-10-16 下午1:46:40 
	 */
	Map<String, String> queryDeviceById(String deviceId);

	/**@Description: 根据id查询字典集合
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2015-10-20 下午3:55:08 
	 */
	List<Map<String, String>> queryDictionaryByID(String id);

	/**@Description: 查询水费含量
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-20 下午4:49:22 
	 */
	List<Map<String, String>> queryMoisturecontent(DeviceBean deviceBean);

	/**@Description: 查询电池电量
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-22 下午4:03:43 
	 */
	List<Map<String, String>> queryBatterypower(DeviceBean deviceBean);

	/**@Description: 查询土壤温度
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-22 下午4:03:56 
	 */
	List<Map<String, String>> querySoilTemperature(DeviceBean deviceBean);

}
