<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html lang="zh-CN">
<%
	String path = request.getContextPath();
%>
<head>
<script src="<%=path%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/common.js"></script>
<link href="<%=path%>/css/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/css/main.css" rel="stylesheet">
<style>
		.banner 
		{ height: 600px; 
		  background: url(images/new_banner.jpg) no-repeat center center;
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}
		.banner .banner-wrapper { width: 1070px; overflow: hidden; margin: 0 auto; color: #fff; padding-top: 60px; }
		.banner .banner-wrapper .intro { width: 400px; float: left }
		.banner .banner-wrapper p { font-size: 24px; line-height: 150%; margin-top: 30px; color: #555; }
		.banner .banner-wrapper a.btn { padding: 10px 30px; margin-top: 20px; }
		.banner .banner-wrapper .container { width: 655px; height: 400px; float: right; padding-right: 0px; }
		.carousel-control.left { background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0) 0, rgba(0, 0, 0, 0.0001) 100%) !important; }
		.carousel-control.right { background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0001) 0, rgba(0, 0, 0, 0.0) 100%) !important; }
		.index-1 { overflow: hidden; padding: 40px 0; }
		.index-1 .feature { width: 1280px; overflow: hidden; margin: 0 auto; padding: 0px; padding-top: 45px; }
		.index-1 .feature li { list-style: none outside none; float: left; width: 25%; text-align: center; line-height: 200%;
			font-size: 14px; color: #999; padding-bottom: 45px;
		}
		.index-1 .feature li h4 { color: #333; font-size: 20px; font-weight: normal; margin-top: 20px; }
		.index-1 .feature li .imgicon { border-radius: 10px; width: 100px; height: 100px; background-color: green; color: #fff; margin: 0 auto; padding-top: 25px; }
		.index-2 { height: 460px; background: #58B454 url("https://dn-wtbox.qbox.me/img//index/pat.png?v=3.3.11") repeat center top; color: #fff }
		.index-2 h3 { padding: 40px 0 50px 0; margin: 0px; }
		.index-who-grid { width: 955px; margin: 0 auto; overflow: hidden; padding: 0px }
		.index-who-grid li { float: left;
			width: 25%;
			list-style: none outside none;
			height: 110px;
			text-align: center;
			line-height: 200%;
			font-size: 16px; }
		.index-who-grid li i { display: block; }
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
	<div class="container-fluid istk-container">
		<div class="banner container-fluid">
			<div class="banner-wrapper">
				<div class="intro">
					<h1>人智善，农墒宜</h1>
					<a href="product.jsp" class="btn btn-success btn-lg">了解更多</a>
				</div>
			</div>
		</div>
		<div class="index-1">
			<ul class="feature">
				<li>
					<div class="imgicon" style="background-color: rgb(136, 179, 62)">
						<i class="fa fa-bar-chart fa-4x"></i>
					</div> <br>
					<h4>灌溉依据</h4> 准确告诉你时间点水到达深度<br> 效率提升，有效灌溉就是这么简单
				</li>
				<li>
					<div class="imgicon" style="background-color: rgb(125, 175, 236)">
						<i class="fa fa-line-chart fa-4x"></i>
					</div> <br>
					<h4>吸水动态</h4> 识别作物根系吸水主力军<br> 作物生长状态掌握在你手中
				</li>
				<li>
					<div class="imgicon" style="background-color: rgb(247, 175, 74)">
						<i class="fa fa-warning fa-4x"></i>
					</div> <br>
					<h4>警戒预判</h4> 土壤缺水、水分过量明确判断<br> 消除盲目灌溉，真正实现科学种植
				</li>
				<li>
					<div class="imgicon" style="background-color: rgb(243, 122, 84)">
						<i class="fa fa-gift fa-4x"></i>
					</div> <br>
					<h4>帮助收获</h4> 科学预测作物成熟期<br> 从此，产量预测不再是难题
				</li>
				<li>
					<div class="imgicon" style="background-color: #84C3BE">
						<i class="fa fa-globe fa-4x"></i>
					</div> <br>
					<h4>遥感卫星</h4> 规定时间内可覆盖指定的区域<br> 让覆盖区的每个生长阶段清晰可见
				</li>
				<li>
					<div class="imgicon" style="background-color: #193737">
						<i class="fa fa-bullseye fa-4x"></i>
					</div> <br>
					<h4>气象雷达</h4> 告别“局部地区有雨”的时代<br> 精准定位，分钟级别降雨量预报
				</li>
				<li>
					<div class="imgicon" style="background-color: #CAC4B0">
						<i class="fa fa-cloud fa-4x"></i>
					</div> <br>
					<h4>地面气象</h4> 上报蒸发蒸腾量及常规气象数据<br> 实时掌握地面气象
				</li>
				<li>
					<div class="imgicon" style="background-color: #33CCFF">
						<i class="fa fa-area-chart fa-4x"></i>
					</div> <br>
					<h4>土壤水分</h4> 不同土壤深度水分、温度动态监测<br> 让作物告诉您它的生长状态
				</li>
			</ul>
		</div>
		<div class="index-2">
			<h3 class="text-center">谁可以用</h3>
			<ul class="index-who-grid">
				<li><i class="fa fa-leaf fa-2x"></i>种植户</li>
				<li><i class="fa fa-flask fa-2x"></i>科研机构</li>
				<li><i class="fa fa-copyright fa-2x"></i>农业企业</li>
				<li><i class="fa fa-at fa-2x"></i>物联网企业</li>
				<li><i class="fa fa-tree fa-2x"></i>绿化园林单位</li>
				<li><i class="fa fa-tint fa-2x"></i>水利部门</li>
				<li><i class="fa fa-dashboard fa-2x"></i>墒情监测站</li>
				<li><i class="fa fa-ils fa-2x"></i>期货市场</li>
				<li><i class="fa fa-building fa-2x"></i>学术研究</li>
				<li><i class="fa fa-warning fa-2x"></i>滑坡预警</li>
				<li><i class="fa fa-file-text fa-2x"></i>农业保险企业</li>
				<li><i class="fa fa-ellipsis-h fa-2x"></i></li>
			</ul>
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
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>