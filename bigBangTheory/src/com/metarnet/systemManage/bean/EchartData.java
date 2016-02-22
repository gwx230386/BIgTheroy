package com.metarnet.systemManage.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EchartData {

	public List<String> legend = new ArrayList<String>();//数据分组
	public List<String> category = new ArrayList<String>();//横坐标
	public List<Map<String, Object>> series = new ArrayList<Map<String, Object>>();//纵坐标
	
	
	public EchartData(List<String> legendList, List<String> categoryList, List<Map<String, Object>> series) {
		super();
		this.legend = legendList;
		this.category = categoryList;
		this.series = series;
	}
	
}
