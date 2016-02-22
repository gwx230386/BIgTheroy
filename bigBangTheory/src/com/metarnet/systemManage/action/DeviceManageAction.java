package com.metarnet.systemManage.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.util.JSONUtils;

import com.alibaba.fastjson.JSON;
import com.metarnet.base.action.BaseAction;
import com.metarnet.base.util.WebUtils;
import com.metarnet.systemManage.bean.BusinessBean;
import com.metarnet.systemManage.bean.DeviceBean;
import com.metarnet.systemManage.bean.EchartData;
import com.metarnet.systemManage.bean.Series;
import com.metarnet.systemManage.service.DeviceManageService;

/**
 * @Description: 设备管理Action
 * @author: lcgu
 * @date: 2015-10-16 上午11:20:22
 */
public class DeviceManageAction extends BaseAction
{
	
	private DeviceBean deviceBean;

	private DeviceManageService deviceManageService;

	// 图像线路类别
	List<String> legend;
	
	List<Map<String, String>> queryType;

	/**
	 * @Description: 查询设备信息
	 * @author: lcgu
	 * @return
	 * @date: 2015-10-16 下午1:42:06
	 */
	public void queryDeviceById()
	{
		WebUtils.write(JSON.toJSONString(deviceManageService
				.queryDeviceById(deviceBean.getDeviceId())));
	}

	/**
	 * @Description: 展示设备信息
	 * @author: lcgu
	 * @return
	 * @date: 2015-10-16 下午3:52:35
	 */
	public String showDeviceInfo()
	{
		queryType = deviceManageService.queryDictionaryByID(BusinessBean.CHART_QUERY_TYPE);
		return "deviceInfo";
	}

	/**
	 * @Description: 获取设备信息
	 * @author: lcgu
	 * @date: 2015-10-19 上午10:58:09
	 */
	public void getDeviceInfo()
	{
		initQueryType();

		List<Map<String, String>> deviceChartData = deviceManageService
				.queryDeviceChart(deviceBean);

		// 横坐标
		List<String> category = new ArrayList<String>();

		List<Map<String,Object>> series = new ArrayList<Map<String,Object>>();// 纵坐标

		// 分组数量
		int number = deviceChartData.size() + 8 / 8;

		for (int i = 0; i < deviceChartData.size(); i++)
		{
			if (deviceChartData.size() <= 8)
			{
				category.add(deviceChartData.get(i).get("puttime"));
			}
			else
			{
				if ((i + 1) % number == 0)
				{
					category.add(deviceChartData.get(i).get("puttime"));
				}
			}
		}

		for (int i = 0; i < queryType.size(); i++)
		{
			List<Double> seriesData = new ArrayList<Double>();
			String itemDescribe = queryType.get(i).get("ITEMDESCRIBE");
			for (int j = 0; j < deviceChartData.size(); j++)
			{
				seriesData.add(Double.valueOf(deviceChartData.get(j).get(itemDescribe)));
			}

			Map<String,Object> seriesMap = new HashMap<String,Object>();
			seriesMap.put("name", queryType.get(i).get("itemName"));
			seriesMap.put("data", seriesData);
			seriesMap.put("type", "line");
			seriesMap.put("symbolSize", "0");

			series.add(seriesMap);
			
		}

		EchartData data = new EchartData(legend, category, series);

		WebUtils.write(JSON.toJSON(data));

	}

	/**
	 * @Description: 初始化legend
	 * @author: lcgu
	 * @date: 2015-10-20 下午4:06:40
	 */
	private void initQueryType()
	{
		queryType = deviceManageService.queryDictionaryByID(deviceBean.getQueryType());

		legend = new ArrayList<String>();
		for (Map<String, String> map : queryType)
		{
			legend.add(map.get("itemName"));
		}
	}

	public DeviceBean getDeviceBean()
	{
		return deviceBean;
	}

	public void setDeviceBean(DeviceBean deviceBean)
	{
		this.deviceBean = deviceBean;
	}

	public DeviceManageService getDeviceManageService()
	{
		return deviceManageService;
	}

	public void setDeviceManageService(DeviceManageService deviceManageService)
	{
		this.deviceManageService = deviceManageService;
	}

	public List<String> getLegend()
	{
		return legend;
	}

	public void setLegend(List<String> legend)
	{
		this.legend = legend;
	}

	public List<Map<String, String>> getQueryType()
	{
		return queryType;
	}

	public void setQueryType(List<Map<String, String>> queryType)
	{
		this.queryType = queryType;
	}

}
