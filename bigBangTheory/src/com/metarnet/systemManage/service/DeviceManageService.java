package com.metarnet.systemManage.service;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.DeviceBean;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-10-16 下午1:33:57 
 */
public interface DeviceManageService
{

	/**@Description: 查询设备信息
	 * @author: lcgu
	 * @param deviceId
	 * @date: 2015-10-16 下午1:43:56 
	 */
	 Map<String,String> queryDeviceById(String deviceId);

	/**@Description: 根据id查询字典集合
	 * @author: lcgu
	 * @param string
	 * @return
	 * @date: 2015-10-20 下午3:53:51 
	 */
	List<Map<String, String>> queryDictionaryByID(String string);

	/**@Description: 查询设备详细信息
	 * @author: lcgu
	 * @param deviceBean
	 * @return
	 * @date: 2015-10-20 下午4:47:47 
	 */
	List<Map<String, String>> queryDeviceChart(DeviceBean deviceBean);

}
