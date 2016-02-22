<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
    HttpSession s = request.getSession(); 
    Object userName = s.getAttribute("userName");
%>

<html>
<head>
<title>Insentek - 我的设备</title>

<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/prompt.js"></script>
<script src="<%=path%>/js/app.core.js"></script>
<script src="<%=path%>/js/perfect-scrollbar.jquery.min.js"></script>
<script src="<%=path%>/js/app.device.list.js?v=28"></script>
<link href="<%=path%>/css/prompt.css" rel="stylesheet">
<link href="<%=path%>/css/devicelist.css" rel="stylesheet">
<link href="<%=path%>/css/perfect-scrollbar.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/app.css" rel="stylesheet">

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="<%=path%>/js/fancyBox/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<!-- Map-->
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=845f5781e2aa03e023dd86ccf21ad19a"></script> 

<style>
#device-info .sn {
	width: 150px;
}

#device-info .alias {
	width: 150px;
}

</style>
<link
	href="http://static.insentek.com/widgets/datepicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<header class="navbar istk-header navbar-fixed-top">
		<div class="navbar-inner">
				<a class="logo pull-left"><img
				src="<%=path%>/images/insentek-logo-2.png"></a> 	
					<s:include value="loginCheck.jsp"></s:include>
			<ul class="nav pull-left nav-link">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="about.jsp">我们</a></li>
				<li><a href="product.jsp">产品</a></li>
				<li><a href="partner.jsp">案例</a></li>
<!-- 				<li class="blog"><a href="http://blog.insentek.com">博客</a></li> -->
				<li><a href="device.jsp">我的设备</a></li>
			</ul>
		</div>
	</header>
	<div class="container-fluid istk-container">
		<div class="row allh">
			<div class="col-sm-2 allh dev-nav">
				<div class="device-search">
					<input type="text" placeholder="请输入搜索关键词" class="form-control">
					<a href="javascript:;"><i class="fa fa-search"></i></a>
				</div>
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="false">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="group-heading-0">
							<h4 class="panel-title">
								<a id="panel-toggle-0" data-toggle="collapse"
									data-parent="#accordion" href="#group-0" aria-expanded="true"
									aria-controls="group-0"> <img
									src="<%=path%>/images/marker_8.png"
									style="vertical-align: top;">智墒<span>(7)</span>
								</a>
							</h4>
						</div>
						<div id="group-0" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="group-heading-0">
							<div class="panel-body">
								<div id="list-wrapper-0" class="list-wrapper ps-container"
									style="max-height: 152px;"
									data-ps-id="fae9bcf4-2ddf-e3ce-4322-63486b68b200">
									<ul class="nav device-list" data-index="0">
										<li data-id="13634"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly" style="background-color: transparent;">
											</div></li>
										<li data-id="13588"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly" style="background-color: transparent;">
											</div></li>
										<li data-id="13297"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly" style="background-color: transparent;">
											</div></li>
										<li data-id="13284"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly" style="background-color: transparent;">
											</div></li>
										<li data-id="13221"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly">
											</div></li>
										<li data-id="13124"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly">
											</div></li>
										<li data-id="13102"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly">
											</div></li>
									</ul>
									<div class="ps-scrollbar-x-rail"
										style="left: 0px; bottom: 3px;">
										<div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div>
									</div>
									<div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;">
										<div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="group-heading-1">
							<h4 class="panel-title">
								<a id="panel-toggle-1" data-toggle="collapse"
									data-parent="#accordion" href="#group-1" aria-expanded="true"
									aria-controls="group-1"> <img
									src="<%=path%>/images/marker_10.png"
									style="vertical-align: top;">气象墒情仪<span>(1)</span>
								</a>
							</h4>
						</div>
						<div id="group-1" class="panel-collapse collapse " role="tabpanel"
							aria-labelledby="group-heading-1">
							<div class="panel-body">
								<div id="list-wrapper-1" class="list-wrapper ps-container"
									style="max-height: 152px;"
									data-ps-id="998c7320-61fe-aed0-1855-e29e9a95685e">
									<ul class="nav device-list" data-index="1">
										<li data-id="12648"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly">
											</div></li>
									</ul>
									<div class="ps-scrollbar-x-rail"
										style="left: 0px; bottom: 3px;">
										<div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div>
									</div>
									<div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;">
										<div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="group-heading-2">
							<h4 class="panel-title">
								<a id="panel-toggle-2" data-toggle="collapse"
									data-parent="#accordion" href="#group-2" aria-expanded="true"
									aria-controls="group-2"> <img
									src="<%=path%>/images/marker_9.png"
									style="vertical-align: top;">田间气象站<span>(1)</span>
								</a>
							</h4>
						</div>
						<div id="group-2" class="panel-collapse collapse " role="tabpanel"
							aria-labelledby="group-heading-2">
							<div class="panel-body">
								<div id="list-wrapper-2" class="list-wrapper ps-container"
									style="max-height: 152px;"
									data-ps-id="b6ebf7b0-bff2-ea20-8e8e-556daa0efd84">
									<ul class="nav device-list" data-index="2">
										<li data-id="12479"><span>示例设备</span><br>

											<div class="alias" data-edit="0">
												<input type="text" data-orginal="暂无" value="暂无"
													readonly="readonly">
											</div></li>
									</ul>
									<div class="ps-scrollbar-x-rail"
										style="left: 0px; bottom: 3px;">
										<div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div>
									</div>
									<div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;">
										<div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10 allh">
				<div id="device-map" class="amap-container amap-fade-anim">
					<div class="amap-controls">
						<div class="amap-maptypecontrol">
							<div class="amap-maptype-wrap">
								<div class="amap-maptype-con">
									<div class="amap-maptype-win">
										<img
											src="http://webst04.is.autonavi.com/appmaptile?style=6&amp;x=14&amp;y=5&amp;z=4"
											style="visibility: visible; position: absolute; left: -222.872376888889px; top: -78.7399056535112px;"><img
											src="http://webst01.is.autonavi.com/appmaptile?style=6&amp;x=15&amp;y=5&amp;z=4"
											style="visibility: visible; position: absolute; left: 33.127623111111px; top: -78.7399056535112px;">
									</div>
									<div class="amap-maptype-title">卫星</div>
								</div>
							</div>
							<div class="amap-maptype-list"
								style="width: 60px; display: block; height: 20px;">
								<p class="amap-maptype-item" style="display: block;">
									<span class="amap-maptype-check"></span><span
										class="amap-maptype-label">路况</span>
								</p>
								<p class="amap-maptype-item" style="display: none;">
									<span class="amap-maptype-check"></span><span
										class="amap-maptype-label">路网</span>
								</p>
							</div>
						</div>
						<div class="amap-toolbar"
							style="left: 10px; top: 10px; visibility: visible;">
							<div class="amap-pancontrol"
								style="position: relative; display: block;">
								<div class="amap-pan-left"></div>
								<div class="amap-pan-top"></div>
								<div class="amap-pan-right"></div>
								<div class="amap-pan-bottom"></div>
							</div>
							<div class="amap-locate"
								style="position: relative; left: 17px; display: block;"></div>
							<div class="amap-zoomcontrol"
								style="position: relative; left: 14px;">
								<div class="amap-zoom-plus"></div>
								<div class="amap-zoom-ruler" style="display: block;">
									<div class="amap-zoom-mask" style="height: 127px;"></div>
									<div class="amap-zoom-cursor" style="top: 127px;"></div>
									<div class="amap-zoom-labels" style="display: none;">
										<div class="amap-zoom-label-street"></div>
										<div class="amap-zoom-label-city"></div>
										<div class="amap-zoom-label-province"></div>
										<div class="amap-zoom-label-country"></div>
									</div>
								</div>
								<div class="amap-zoom-minus"></div>
							</div>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>

	<div class="device-info-template hide">
		    <span class="number"></span> 
		    <span class="type"></span> 
		    <span class="remark"></span> 
			<span class="battery"></span> 
			<a href="javascript:;" onclick="device_detail_pop(this)" data-id="0"class="pull-right">查看详情»</a> 
			<i class="fa fa-caret-down cert"></i> 
			<i class="fa fa-times-circle cls"></i>

		<div class="qrscan text-center">
			<img src="" alt="微信扫一扫"><br> <span class="text-info">微信扫一扫<br>手机看数据
			</span>
		</div>
	</div>
	
	<div class="hide"><a id="deviceInfo" class="fancybox fancybox.iframe" href="device_showDeviceInfo.action">Iframe</a></div>

	<div
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>