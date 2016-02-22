<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html lang="zh-CN">
<head>
<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/js/prompt.js"></script>
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/main.css" rel="stylesheet">
<link href="<%=path%>/css/prompt.css" rel="stylesheet">

<style>
.istk-container {
	margin-top: 115px;
}

.block-1 {
	height: 620px;
	background: url(http://static.insentek.com/images/section1bg.png)
		no-repeat;
}

.block-1 .desc {
	width: 340px;
	margin: 130px auto;
}

.block-1 .desc h3 {
	text-align: center
}

.block-1 .desc p {
	color: #666;
	font-size: 13px;
	line-height: 32px;
	text-align: center;
	margin-bottom: 30px;
}

.block-2 {
	height: 700px;
	background: url(images/section2bg.png) no-repeat;
	
}

.block-2 .details {
	font-size: 18px;
	line-height: 38px;
	color: #fff;
	float: left;
	margin-top: 200px;
	margin-left: 90px;
}

.block-2 .container {
	width: 625px;
	height: 310px;
	float: right;
	margin-top: 200px;
	margin-right: 85px;
}

.carousel-control.left {
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0) 0,
		rgba(0, 0, 0, 0.0001) 100% ) !important;
}

.carousel-control.right {
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0001) 0,
		rgba(0, 0, 0, 0.0) 100% ) !important;
}

.block-3 {
	height: 700px;
	background-color: #fff;
	padding-top: 145px;
}

.block-3 .apps {
	width: 80%;
	margin: 0 auto;
	padding: 0;
	overflow: hidden
}

.block-3 .apps li {
	list-style: none;
	float: left;
	width: 25%;
	text-align: center
}

.block-3 h2 {
	text-align: center;
	margin-top: 90px;
}

.block-3 p {
	font-size: 16px;
	line-height: 26px;
	text-align: center;
	width: 80%;
	margin: 0 auto;
}

.block-4 {
	background-color: rgb(78, 146, 223);
	overflow: hidden;
	min-height: 700px;
	color: #fff;
	font-size: 16px;
}

.block-4 h2 {
	font-size: 26px;
	font-weight: bold;
	margin-top: 48px !important;
}

#pip {
	position: absolute;
	right: 65px;
	bottom: 0px;
}

.standard {
	margin: 0;
	padding: 0;
	margin-top: 10px;
	width: 97%;
	font-size: 14px;
}

.standard li {
	list-style: none outside none;
	line-height: 46px;
	border-bottom: solid 1px rgb(137, 182, 233);
	overflow: hidden
}

.standard li.header {
	border-bottom: solid 2px #fff;
	height: 20px;
}

.standard li span {
	float: left;
	display: block;
	text-align: left;
}

.standard li .c1 {
	width: 210px;
}

.standard li .c2 {
	width: 500px;
}

.pro-nav {
	height: 50px;
	line-height: 50px;
	border-bottom: solid 1px #ccc;
	padding-left: 10px;
	background-color: #fafafa;
	top: 65px;
	position: fixed;
	width: 100%;
	z-index: 99;
}

.pro-nav .name {
	font-size: 16px;
	font-weight: bold
}

#product-list {
	color: #000;
	text-decoration: none;
	cursor: pointer
}

.block {
	min-width: 1440px;
	width: 100%;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow: hidden;
}
</style>
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
	<div class="pro-nav">
		<div class="dropdown">
			<a id="product-list" type="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> 智墒 <span
				class="caret"></span>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="product-list">
				<li><a href="#">敬请期待更多产品</a></li>
			</ul>
		</div>
	</div>
	<div class="container-fluid istk-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="block block-1">
					<div class="desc">
						<h3>智墒，立农</h3>

						<p>
							免率定的管式水分仪<br> 完全自主知识产权的国产水分仪<br> 批量使用、客户分布全中国的管式水分仪<br>
							在黑龙江漠河-30℃发数据的水分仪<br>
						</p>
						<embed
							src="http://v.ifeng.com/include/exterior.swf?guid=04ae2983-3d33-b490-2ebd-55e2f4c50f6a&amp;AutoPlay=false"
							allowfullscreen="true" quality="high" width="340" height="210"
							align="middle" allowscriptaccess="always"
							type="application/x-shockwave-flash">
					</div>
				</div>
				<div class="block block-2">
					<p class="details">
						• 全密封结构，适用于野外严酷的自然环境<br> • 外壳采用防老化材料，可长期放置于田间、土地中进行不间断测量<br>
						• 不同深度土壤参数同时监测，监测深度最深达2米，深度可以定制<br> • 测量间距5cm，10cm可选配<br>
						• 通讯方式灵活，可选GPRS无线通讯方式或CAN通讯方式<br> • 开放数据接口，便于根据需要获取数据<br>
						• 低功耗设计，由外部+5VDC供电或自带可充电电池供电<br> •
						安装简单：可采用专用的工具进行安装，10分钟能安装就位<br>
					</p>

					<div class="container">
						<div id="carousel-generic" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="item">
									<img src="http://static.insentek.com/images/s2.png">

									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img src="http://static.insentek.com/images/s3.png">

									<div class="carousel-caption"></div>
								</div>
								<div class="item active">
									<img src="http://static.insentek.com/images/s4.png">

									<div class="carousel-caption"></div>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-generic"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control" href="#carousel-generic"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
				</div>
				<div class="block block-3">
					<ul class="apps">
						<li><img src="http://static.insentek.com/images/c1.png"></li>
						<li><img src="http://static.insentek.com/images/c2.png"></li>
						<li><img src="http://static.insentek.com/images/c3.png"></li>
						<li><img src="http://static.insentek.com/images/c4.png"></li>
					</ul>
					<h2>应用场景</h2>

					<p>
						Insentek致力于将跨学科和创新型的技术应用在我们生活的生态环境中，包括土壤、空气、水，并且由此衍生出在农业、渔业、地质减灾、环境监控领域的应用。除了解决关键参数的传感器技术问题，
						Insentek还综合应用了智能人机交互、大数据处理、传感器网络、移动互联网技术来提高行业效能。</p>
				</div>
				<div class="block block-4 container-fluid">
					<div class="row">
						<div class="col-sm-offset-1 col-sm-8">
							<h2>技术规格</h2>
							<ul class="standard">
								<li class="header"></li>
								<li><span class="c1">外形</span> <span class="c2">管式</span></li>
								<li><span class="c1">直径</span> <span class="c2">63mm</span>
								</li>
								<li><span class="c1">长度</span> <span class="c2">根据需求确定</span>
								</li>
								<li><span class="c1">外壳防护等级</span> <span class="c2">IP68</span>
								</li>
								<li><span class="c1">运行环境</span> <span class="c2">-20℃
										～ 85℃</span></li>
								<li><span class="c1">温度测量范围</span> <span class="c2">-20℃
										～ 70℃，精度±0.5℃</span></li>
								<li><span class="c1">土壤水分测量范围</span> <span class="c2">干土～水分饱和土</span>
								</li>
								<li><span class="c1">土壤水分测量精度</span> <span class="c2">±3%（免率定直接出数据）</span>
								</li>
								<li><span class="c1">监测深度</span> <span class="c2">
										100cm内可监测任意土层水分、温度数据。例：10cm-30cm-80cm<br> ＞100cm可定制
								</span></li>
								<li><span class="c1">通讯方式</span> <span class="c2">
										GPRS 无线通讯<br> RS232 通讯，通讯距离：5m<br> CAN通讯，通讯距离：＞500m
								</span></li>
								<li><span class="c1">数据采集间隔</span> <span class="c2">5min
										— 4h</span></li>
								<li><span class="c1">数据采集设置</span> <span class="c2">远程设置</span>
								</li>
								<li><span class="c1">智能密集采集</span> <span class="c2">默认采集间隔1h/次。当仪器监测到土壤含水量变化较大时，自动缩短采集间隔到15min/次或其他预设密集数据采集间隔</span>
								</li>
								<li><span class="c1">软件升级</span> <span class="c2">远程升级</span>
								</li>
								<li><span class="c1">智能防盗</span> <span class="c2">
										定位防盗：内置GPS，实时经纬度地理位置信息通过GPRS发送到后台。<br>
										振动防盗：内置振动传感器，当设备发生振动、移除等外力操作时，设备立即自动发送报警短信到指定手机号。
								</span></li>
								<li><span class="c1">供电方式</span> <span class="c2">
										充电电池供电【磷酸铁锂电池，独立供电时间大于40天。电压：+3.3VDC】<br> 太阳能板供电<br>
										外部+12VDC供电（串口通讯）
								</span></li>
								<li><span class="c1">使用寿命</span> <span class="c2">10年</span>
								</li>
								<li><span class="c1">执行标准</span> <span class="c2">Q/HDIST
										001-2012</span></li>
							</ul>
						</div>
						<img src="http://static.insentek.com/images/pip.png" id="pip">
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		© 2013 by Insentek Co.,Ltd <br> 粤ICP备15004405号
	</footer>
	<div class="hide">
		<script type="text/javascript">
			var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3Fda67e9056f9fd3bd6bf7c79cc14f1791' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script
			src=" http://hm.baidu.com/h.js?da67e9056f9fd3bd6bf7c79cc14f1791"
			type="text/javascript"></script>
		<a
			href="http://tongji.baidu.com/hm-web/welcome/ico?s=da67e9056f9fd3bd6bf7c79cc14f1791"
			target="_blank"><img border="0"
			src="http://eiv.baidu.com/hmt/icon/21.gif" width="20" height="20"></a>
	</div>

	<div
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>