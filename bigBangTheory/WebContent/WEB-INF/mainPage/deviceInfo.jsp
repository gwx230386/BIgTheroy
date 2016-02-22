<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<title>line</title>
<script type="text/javascript" src="<%=path%>/js/echarts/esl.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/prompt.js"></script>
<script src="<%=path%>/js/perfect-scrollbar.jquery.min.js"></script>
<script src="<%=path%>/js/device/deviceInfo.js"></script>
<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script> 
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/main.css" rel="stylesheet">
<link href="<%=path%>/css/prompt.css" rel="stylesheet">
</head>
<script type="text/javascript" language="javascript">

function fancyboxClose()
{
	parent.$.fancybox.close();
}
		var myChart;
		var eCharts;
		require.config({
			paths : {
				'echarts' : '<%=path%>/js/echarts/echarts' ,
				'echarts/chart/line' : '<%=path%>/js/echarts/echarts' //需要的组件
			}
		});

		require(
			[ 'echarts', 
			  'echarts/chart/line'
			], DrawEChart //异步加载的回调函数绘制图表
		);

		//创建ECharts图表方法
		function DrawEChart(ec) {
			eCharts = ec;
			myChart = eCharts.init(document.getElementById('chart-container'));
			myChart.showLoading({
				text : "图表数据正在努力加载..."
			});
			//定义图表options
			var options = {
				backgroundColor: "rgba(255,255,255,1)",
				tooltip : {
					trigger : 'axis',
					textStyle: {fontFamily: 'Verdana, sans-serif', fontSize: 12},
					padding: 10,
					showDelay: 0,
					transitionDuration: 0.1,
					axisPointer: {
						type: 'line',
						lineStyle: {
							color: '#48b',
							width: 1,
							type: 'solid'
						},
						crossStyle: {
							color: '#1e90ff',
							width: 1,
							type: 'solid'
						},
						shadowStyle: {
							color: 'rgba(150,150,150,0.3)',
							width: '1',
							type: 'default'
						}
					}
				},
				legend : {
					x: 'center',
					data : []
				},
				toolbox: {
					show: true,
					padding: 10,
					feature: {
						magicType: {show: true, type: ['line', 'bar']},
						saveAsImage: {show: false},
						dataView: {
							show: true,
							title: '原始数据',
							readOnly: true,
							lang: ['原始数据', '关闭'],
							optionToContent: function (opt) {
								var axisData = opt.xAxis[0].data;
								var series = opt.series;
								var table = "<table class='table table-bordered table-hover'><tr><th width='120'>时间</th>";
								for (var i = 0; i < series.length; i++) {
									table += "<th width='120'>" + series[i].name + "</th>";
								}
								table += "</tr>";
								for (var i = 0, l = axisData.length; i < l; i++) {
									table += "<tr><td>" + axisData[i] + "</td>";
									for (var j = 0; j < series.length; j++) {
										table += "<td>" + series[j].data[i] + "</td>";
									}
									table += "</tr>";
								}
								table += "</table>";
								
								//return table;
								$(".echarts-dataview").append(table);

							}
						}
					},
					orient: 'vertical',
					y: 60
				},
				calculable : true,
				dataZoom: {show: true, start: 0, end: 100, realtime: true, showDetail: true},
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					axisLine: {onZero: true},
					data : []
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {},
					splitArea : {
						show : true
					}
				} ],
				grid : {
					width : '90%'
				},
				series : []
			};
			myChart.setOption(options); //先把可选项注入myChart中
			myChart.hideLoading();
			getChartData();//ajax后台交互 
		}
	</script>
	<script type="text/javascript">
		function getChartData() {
			//获得图表的options对象
			var options = myChart.getOption();

			var deviceId ="10001";
			var queryType = $("#params-group .current").attr("data-pid");
			var endTime = $("#endTime").val();
			var startTime = $("#startTime").val();
			var specialTime = $("#specialTime").val();

			//通过Ajax获取数据
			$.ajax({
				type : "post",
				async : false, //同步执行
				url : "device_getDeviceInfo.action",
				data : "deviceBean.deviceId="+deviceId+"&deviceBean.queryType="+queryType+"&deviceBean.startTime="+startTime+"&deviceBean.endTime="+endTime+"&deviceBean.specialTime="+specialTime,
				dataType : "json", //返回数据形式为json
				success : function(result) {
					if (result) {
						options.legend.data="";
						options.legend.data = result.legend;
						options.xAxis[0].data = result.category;
						options.series = result.series;
						
						myChart.clear();
						myChart.hideLoading();
						myChart.setOption(options);

						myChart.refresh();

					}
				},
				error : function(errorMsg) {
					alert("不好意思，图表请求数据失败啦!");
					myChart.hideLoading();
				}
			});
		}
	</script>
<style>
.loginbox {
	width: 680px;
	margin: 80px auto;
	margin-bottom: 10px;
	background-color: #fff;
	padding: 1px;
	border-radius: 2px 2px 2px 2px;
	border: solid 1px #AAA;
	background-color: #fff;
}

.loginbox .title {
	background-image: -webkit-linear-gradient(top, #f5f5f5, #Fff);
	border-bottom: solid 1px #f4f4f4;
	height: 40px;
	line-height: 40px;
	padding: 0 0 0 10px;
	font-size: 16px;
	border-radius: 2px 2px 0px 0px;
}

.loginbox .content {
	padding: 20px;
}

.content .captcha {
	width: 80px;
	height: 26px;
	top: 4px !important;
	right: 17px !important;
	cursor: pointer;
}

.acts {
	width: 400px;
	margin: 10px auto;
	text-align: center;
}

#login-submit,#reset-submit {
	padding: 6px 30px;
}

.alert {
	padding: 8px;
}

.errorhint {
	height: 20px;
	color: red;
	position: relative;
	display: inline;
	left: 250px;
	width: 50px;
	bottom: 27px;
	padding-left: 5px;
}

.action-bar {
	padding-bottom: 6px;
	border-bottom: solid 1px #ccc;
	position: relative;
}

#chart-container {
	height: 94%;
}

#chart-time-control {
	position: absolute;
	top: 49px;
	left: 0px;
	z-index: 1
}

#chart-time-control .btn-group {
	width: 130px;
	float: left
}

#chart-time-control .btn {
	padding: 3px 8px;
	font-size: 12px;
}
#time_default .btn {
    border-color: #ccc;
}
.time_default_active
{
  background-color:#fff;
}
#chart-time-control .btn .active {
	font-weight: bold
}

#chart-time-control .time-range {
	float: left;
	margin-left: 10px;
}

#chart-time-control .time-range input {
	height: 30px;
	font-size: 12px;
	padding: 2px 6px;
	line-height: 100%;
	width: 100px;
	float: left
}

#chart-time-control .time-range input[type='checkbox'] {
	width: 13px;
}

#chart-time-control .time-range>* {
	float: left
}

#chart-time-control .time-range label {
	margin: 3px 5px 0px 5px
}

#chart-time-control .time-range a {
	height: 30px;
	margin-left: 5px;
}

.action-bar {
	border-bottom: solid 1px #ccc;
	position: relative
}

.action-bar .title {
	position: absolute;
	top: 8px;
	width: 250px;
	left: 50%;
	margin-left: -125px;
	text-align: center;
	font-size: 14px;
	color: #666
}
#chart-container
{
 width:1550px;
 height:720px;
}
</style>
<body>
	<div id="info-panel">
			<div class="action-bar">
				<div class="btn-group" id="params-group">
				
					<button type="button" class="btn btn-info btn-sm current"
						data-id="13634" data-pid="moisturecontent" data-symbol="℃">水分含量</button>
					<button type="button" class="btn btn-info btn-sm dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false" style="height: 37px">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" id="dropdown-menu" role="menu">
					
					<s:iterator value="queryType" id="result" status="s">
					   <li>
					   <a href="#" data-id="${itemNo}" data-symbol="%"> 
							<s:property value="%{#result.itemName}" />
					   </li>
					   </a>
					</s:iterator>
					</ul>
				</div>
				<div class="title"></div>
				<a href="javascript:;" onclick="fancyboxClose()"
					class="btn btn-danger btn-sm pull-right ml10">关闭</a> <a
					href="javascript:;"
					class="btn btn-primary btn-sm pull-right device-info-more hide">更多设备信息...</a>
			</div>
			<div id="chart-time-control">
				<div class="btn-group" id="time_default">
					<button type="button" class="btn" value="day"
						data-range-diff="86400">1天</button>
					<button type="button" class="btn " value="week"
						data-range-diff="604800">1周</button>
					<button type="button" class="btn" value="month"
						data-range-diff="2592000">1月</button>
					<input type="hidden" value="" id="specialTime"/>
				</div>
				<div class="time-range">
					<input type="text" placeholder="起始时间" id="startTime"
					    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"
					    class="form-control begin" readonly="readonly"
						>
					<label> ~ </label> 
					<input type="text" placeholder="截至时间" id="endTime"
						class="form-control end" readonly="readonly"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startTime\')}',startDate:'#F{$dp.$D(\'startTime\',{d:+1})}'})">
					<a class="btn btn-default btn-xs" id="range-query">查询</a> <a
						class="btn btn-default btn-xs btn-default" id="image-export"
						target="_blank">保存为图片</a>
				</div>
			</div>
			<div id="chart-container"></div>
	</div>
</body>
</html>
