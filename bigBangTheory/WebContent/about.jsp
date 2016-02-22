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
.api-wrapper {
	margin: 30px auto;
	width: 97%
}

.api-wrapper .catalog {
	padding-right: 15px;
	overflow: hidden;
	min-width: 200px;
}

.api-wrapper .apidoc {
	padding-left: 15px;
}

#fixednav {
	padding: 10px;
}

#fixednav .nav li {
	
}

#fixednav .nav li>a {
	display: block;
	padding: 0px 20px;
	font-size: 13px;
	font-weight: 500;
	color: #666;
}

#fixednav .nav>.active>a,.doc-nav .nav>.active:hover>a,.doc-nav .nav>.active:focus>a
	{
	padding-left: 18px;
	font-weight: 700;
	color: #563D7C;
	background-color: rgba(0, 0, 0, 0);
	border-left: 2px solid #563D7C;
}

#fixednav .nav .sub a {
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 30px;
	font-size: 12px;
	font-weight: 400;
}

#fixednav .nav .sub .active a {
	padding-left: 28px;
	font-weight: 600;
	color: #563D7C;
	background-color: rgba(0, 0, 0, 0);
	border-left: 1px solid #563D7C;
}

.about .part {
	margin-bottom: 40px;
}

.about .part p {
	text-indent: 28px;
	font-size: 16px;
	line-height: 1.7;
	color: #333;
	font-weight: 300;
	-webkit-font-smoothing: antialiased;
}

.about .part h3 {
	margin-top: 40px;
}

.wrapper {
	box-shadow: 0 0 3px #EEE, inset 0 0 3px #FFF;
	border: solid 1px #E1E1E1;
	background-color: #fff;
	padding: 20px;
}

.wrapper .nav li {
	padding: 10px 15px;
}

.wrapper .nav li a {
	display: inline;
	padding: 0;
}

.wrapper .nav li:hover a {
	background-color: transparent
}

em.rel {
	color: red;
	font-style: normal;
	font-weight: bold
}

address {
	margin-top: 20px;
}

address ul {
	overflow: hidden;
	margin: 0;
	padding: 0;
	margin-top: 10px;
}

address ul li {
	float: left;
	text-align: center;
	list-style: none outside none;
	margin-right: 20px;
	line-height: 48px;
}

address ul li img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body data-spy="scroll" data-target="#fixednav">
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
		<div class="row api-wrapper">
			<div class="catalog">
				<div class="wrapper affix" data-spy="affix" id="fixednav"
					data-offset-top="0">
					<ul class="nav">
						<li class="active"><a href="#about">关于我们</a></li>
						<li><a href="#partner">加入我们</a></li>
						<li><a href="#contact">联系我们</a></li>
						<li><a href="#download">资料下载</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-offset-2 col-sm-10 about">
				<div class="wrapper">
					<div class="part">
						<h2 id="about">关于我们</h2>

						<p class="text-center">
							Insentek 是一家致力于提供可靠生态基础数据的公司。我们提供可靠的智能硬件产品及相关技术、数据服务，由此：<br>
							<br> 农业可以获得低资源消耗下的优质高产；<br> 城市园林绿化可在节约用水下郁郁葱葱；<br>
							山体滑坡等地质灾害可被提前预警降损；<br> 国家水利墒情防汛抗旱可以被智能监测；<br>
							水土保持植物耗水农作物种植科研宜行；<br> ...<br> <br> 让生产生活更健康和谐的进行<br>
							<br> Water saves us<br> Environment saves us<br> <br>
							我们生活在一个共同的生态系统之中，人类有着可以支配资源的权利，但这不代表我们可以肆无忌惮的浪费资源。<br>
							对于水，没有我们它会更好地存在；<br> 对于我们，没有水我们将会消失！<br>
							善待、高效利用呵护着生命的水资源从监测开始！<br>
							怎样在环境不被破坏的前提下合理利用有限的耕地、水、能源来生产生活是我们的追求。<br> 一旦没有水，农田将无法灌溉。<br>
							气候剧烈变化并威胁到整个食物供应链反过问题该如何应对？<br>
							一旦环境据变化对生命的影响，超出了生命对环境的适应能力，生命将如何生存？<br>
							我们一直在努力寻求解决这些问题的答案，而这个答案或许就是我们自身。<br> 因此，Insentek的工作重点专注于：<br>
							如何应对气候变化和资源紧缺的挑战，<br> 寻求技术创新，提高对生态资源的利用效率，<br>
							综合应用智能人机交互、大数据处理、传感器网络、移动互联网技术来提高效能。
						</p>
					</div>
					<div class="part">
						<h2 id="partner">加入我们</h2>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果您对我们所做的事业感兴趣并想与我们一起创造一个美好的事业，请将您的个人简历发送至lei.wang@insentek.com，我们会有专人与您联系，以确定您是否符合我们的工作需求。
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insentek鼓励在校大学生到公司进行实践实习，目前已有数十名大学生参与到产品的研发、创新之中，我们欢迎更多的大学生参与到科技与生产相结合的实践中来。
					</div>
					<div class="part">
						<h2 id="contact">联系我们</h2>
						<address>
							<strong>珠海安赛博科技有限公司</strong><br> <br>
							地址：北京市海淀区花园路13号院5号楼211室<br> 电话: 400-100-5581<br>
							电子邮件：info@insentek.com<br> 销售咨询：微信/QQ/电话：<br>
							13301032010（王先生）<br> 18501060109（宋先生）<br>
						</address>
						投资请发送电子邮件至invest@insentek.com联系我们，我们会有专人与投资方取得联系。
					</div>
					<div class="part">
						<h2 id="download">资料下载</h2>
						<a target="_blank" href="http://yunpan.cn/cwszZDhrV4yLw">前往下载</a>，提取码：9d73
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
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>

</html>