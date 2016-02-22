package com.metarnet.systemManage.bean;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-10-16 上午11:21:13 
 */
public class DeviceBean
{

	//设备id
	private String deviceId;
	
	//设备查询属性
	private String queryType;

	// 开始时间
	private String startTime;
	
	// 结束时间
	private String endTime;
	
	// 特殊时间段
	private String specialTime;
	
	public String getStartTime()
	{
		return startTime;
	}

	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}

	public String getEndTime()
	{
		return endTime;
	}

	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

	public String getDeviceId()
	{
		return deviceId;
	}

	public void setDeviceId(String deviceId)
	{
		this.deviceId = deviceId;
	}

	public String getQueryType()
	{
		return queryType;
	}

	public String getSpecialTime()
	{
		return specialTime;
	}

	public void setSpecialTime(String specialTime)
	{
		this.specialTime = specialTime;
	}

	public void setQueryType(String queryType)
	{
		this.queryType = queryType;
	}
	
	
}
