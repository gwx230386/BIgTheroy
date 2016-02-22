<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
%>
<html lang="zh-CN">
<head>
<title>Insentek 合作伙伴 案例</title>
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
.content {
	margin: 0px auto;
	padding: 0px 20px 20px 20px;
	width: 980px;
}

.content p {
	text-indent: 28px;
	color: #333;
	font-size: 16px;
	line-height: 1.7
}

.content h3 {
	margin-top: 35px;
}

.imgbox {
	overflow: hidden;
}

.imgbox img {
	float: left;
	margin-left: 10px;
}

.carousel-caption {
	width: 100%;
	bottom: 0px;
	left: 0;
	right: 0;
	height: 40px;
	background-color: #000;
	opacity: 0.5;
}

.carousel-caption span {
	font-size: 16px;
	color: #fff;
	position: absolute;
	display: block;
	left: 0;
	right: 0;
	bottom: 0;
	height: 40px;
	line-height: 30px;
}

.carousel-inner .item img {
	width: 940px;
	height: 540px;
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
	<div class="container-fluid istk-container">
		<div class="content">
			<h3>赤峰水利局</h3>

			<p>内蒙古"四个一千万亩"节水灌溉工程使用insentek土壤水分仪进行节水灌溉实验。</p>

			<div class="imgbox">
				<img src="<%=path%>/images/partner/cf001.jpg" class="img-thumbnail"
					width="450"> <img src="<%=path%>/images/partner/cf003.jpg"
					class="img-thumbnail" width="450">
			</div>
			<p>内蒙古是国家重要的粮食和畜产品生产基地。针对气候干旱、水资源短缺、自然灾害频繁的不利条件，内蒙古近年来始终把水利灌溉建设摆在农牧业发展的基础位置来抓，截至2008年底，全区发展农田有效灌溉面积4307万亩，其中节水灌溉面积2127万亩，旱涝保收面积2261万亩；发展饲草料地灌溉面积480万亩，其中节水灌溉面积280万亩。这些水利工程和节水灌溉设施，为自治区农牧业稳定发展创造了基础条件，发挥了显著效益。

			</p>
			<p>通过"四个一千万亩"节水灌溉工程的实施，到2020年实现以下发展目标：一是农村牧区水资源高效利用、优化配置体系基本建立健全，地下水超采区、严重缺水区农业灌溉用水实现零增长或负增长，农牧业灌溉用水总量不突破160亿立方米。二是农田和饲草料地灌溉工程体系基本完备，为农牧业生产的服务功能和基础保障能力明显增强。灌溉保证率提高，灌溉水利用率达到0.65以上，基本实现农牧业节水现代化。三是农业生产防灾避灾减灾能力和综合生产能力增强，粮食总产稳定在500亿斤以上，成为国家重要的商品粮生产基地之一。四是牧区草原生态保护水资源保障体系基本形成，畜均灌溉饲草料地达到0.15亩以上，实现水草畜均衡发展，灌溉饲草料地总产稳定在300亿斤以上，草原牧区牲畜数量稳定在5000万羊单位，草原生态明显改善，牧民收入稳定增长。
				采取的主要措施:</p>

			<p>一是节水改造灌区。现有地表水灌区以渠道衬砌、渠系建筑物和田间工程配套为主。地下水灌区节水改造以喷灌、膜下滴灌等高效节水措施为主，原则上不再采取防渗渠和管灌灌溉形式。</p>

			<p>二是新建灌区。要转变灌溉发展方式，一步到位，采取最节水的措施，从不同地区实际出发，大力推广应用喷灌、微滴灌等节水灌溉技术，建设高效节水灌溉农牧业。</p>

			<p>“四个一千万亩”节水灌溉工程估算总投资369亿元。水源工程102亿元；节水配套工程267亿元（渠道防渗89亿元，喷灌94亿元，滴灌75亿元，管灌10亿元）。牧区饲草料地灌溉工程70.6亿元。水源工程26亿元；节水配套44亿元（渠道防渗2.5亿元，喷灌32亿元，管灌10亿元）。"四个一千万亩"节水灌溉工程年投入强度35～40亿元，年新增农田灌溉面积100万亩、饲草料地灌溉面积50万亩、节水改造面积240万亩。
			</p>

			<h3>蒙草抗旱绿化股份有限公司</h3>

			<div class="imgbox">
				<img src="<%=path%>/images/partner/mc006.jpg" class="img-thumbnail"
					width="910">
			</div>
			<p>内蒙古和信园蒙草抗旱绿化股份有限公司是国家一级企业，成立于2001年。公司的主要业务是在我国干旱半干旱地区运用蒙草进行节约型生态环境建设，主要包括工程设计施工与苗木培育。主要经营范围为城市园林绿化壹级、风景园林工程设计专项乙级；节水、抗旱植物的研发、生产、推广及技术服务等。2012年9月27日，公司在深交所成功上市。</p>

			<p>Insentek土壤水分监测系统应用于蒙草(赤峰)农业发展有限公司阿绿科尔沁旗草业基地。
				Insentek土壤水分监测系统在草业种植中发挥下面的作用：</p>

			<p>1、科学指导灌溉，大幅度节约用水。
				Insentek土壤水分监测仪实时监测土壤中不同深度的水分变化情况，通过电脑客户端软件动态分析牧草需水状态，掌握牧草在不同生长阶段的需水规律，实现精准按需供水。</p>

			<p>2、掌握记录牧草累计积温数据，实现牧草在产量和蛋白质含量均处于高位点时收割。
				Insentek土壤水分仪监测记录地表至土壤不同深度的温度数据。牧草蛋白质含量与累计积温有关。</p>

			<p>3、科学指导施肥，提高化肥利用效率，降低肥料成本，减少化肥残留对环境的污染。Insentek土壤水分仪动态监测土壤中总盐分变化情况，在水肥一体化的实施过程中，通过Insentek土壤水分仪监测分析牧草的根系生长情况，通过控制灌溉量，使肥料最大限度地分布在牧草根系所在土层。</p>

			<p>4、提高牧草产量。土壤含水量过多或过少都将抑制植物的生长，Insentek通过对牧草水分曲线进行分析，总结出在牧草在不同生长阶段，在不同天气状态下的日耗水量及适宜牧草生长的含水量范围。最大限度保证牧草在自身所喜爱的环境下生长，提高产量。</p>

			<p>5、土壤水分数据的积累、分析，进行产量预测，为编制农艺生产计划提供基础资料。植物的累计蒸发蒸腾量、积温，都可以用来对作物产量进行预测。科学准确的产量预测，对收割计划的编制、物资准备、收获实施有显著的帮助。同时，与日期对应的土壤水分、温度数据，对来年的农艺计划，提供了重要依据。</p>

			<h3>中国牧草基地-阿旗</h3>

			<div class="imgbox">
				<img src="<%=path%>/images/partner/aq011.jpg" class="img-thumbnail"
					width="910">
			</div>
			<p>多年来，由于频繁遭受严重干旱等自然灾害和超载放牧，草场退化、沙化十分严重，草畜供求矛盾日益凸显。如今，阿旗通过种植优质牧草，遏制草场退化、沙化，实现了保护草原生态与发展现代畜牧业的共赢。通过优质牧草示范基地建设，使地处中国北方生态脆弱带的阿鲁科尔沁旗不断探索，变“减畜”为“增草”，用绿色的发展理念和绿色的发展方式，实现了人与自然和谐、发展与环境双赢，全力打造“中国草都”。</p>

			<h3>高粱实验地</h3>

			<div class="imgbox">
				<img src="<%=path%>/images/partner/gl013.jpg" class="img-thumbnail"
					width="910">
			</div>
			<p>为了发挥高粱的灌溉增产效果，探索高粱田的灌溉时期,并能获得稳产高产的措施。试验表明，高粱灌溉方式应以品种类型、灌溉时期和次数为依据,三个因素结合起来确定灌溉与否,灌水当然还要考虑品种的生育期长短、土壤、施肥水平以及幼苗的长相等。</p>

			<h3>高尔夫草坪</h3>

			<div class="imgbox">
				<img src="<%=path%>/images/partner/gef019.jpg" class="img-thumbnail"
					width="910">
			</div>
			<p>高尔夫草坪采用云智能管式多深度土壤水分监测系统，动态掌握草坪根系不同深度土壤水分、盐分、温度变化情况，草坪生长情况。</p>

			<h3>其它案例</h3>

			<div class="carousel slide" data-role="carousel" id="main-carousel">
				<div class="carousel-inner" role="listbox">
					<div class="item">
						<img src="<%=path%>/images/partner/s9.jpg">
						<div class="carousel-caption">
							<span>山东荣成市气象局</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s16.jpg">
						<div class="carousel-caption">
							<span>博天糖业甜菜基地</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s7.jpg">
						<div class="carousel-caption">
							<span>河北衡水水文试验站</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s8.jpg">
						<div class="carousel-caption">
							<span>保定冉庄水文站</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s10.jpg">
						<div class="carousel-caption">
							<span>大理市农业局</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s11.jpg">
						<div class="carousel-caption">
							<span>西双版纳茶园</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s13.jpg">
						<div class="carousel-caption">
							<span>寻甸农业服务中心</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s14.jpg">
						<div class="carousel-caption">
							<span>西北农林科技大学</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s15.jpg">
						<div class="carousel-caption">
							<span>黑龙江农垦</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s17.jpg">
						<div class="carousel-caption">
							<span>蓝威斯顿马铃薯基地</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s19.jpg">
						<div class="carousel-caption">
							<span>北京农林科学院</span>
						</div>
					</div>
					<div class="item">
						<img src="<%=path%>/images/partner/s20.jpg">
						<div class="carousel-caption">
							<span>山东东营园林局</span>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#main-carousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#main-carousel"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
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
	<script>
		$(document).ready(
				function() {
					var slider = [ {
						"name" : "山东荣成市气象局",
						"photo" : "<%=path%>/images/partner/s9.jpg"
					}, {
						"name" : "博天糖业甜菜基地",
						"photo" : "<%=path%>/images/partner/s16.jpg"
					}, {
						"name" : "河北衡水水文试验站",
						"photo" : "<%=path%>/images/partner/s7.jpg"
					}, {
						"name" : "保定冉庄水文站",
						"photo" : "<%=path%>/images/partner/s8.jpg"
					}, {
						"name" : "大理市农业局",
						"photo" : "<%=path%>/images/partner/s10.jpg"
					}, {
						"name" : "西双版纳茶园",
						"photo" : "<%=path%>/images/partner/s11.jpg"
					}, {
						"name" : "寻甸农业服务中心",
						"photo" : "<%=path%>/images/partner/s13.jpg"
					}, {
						"name" : "西北农林科技大学",
						"photo" : "<%=path%>/images/partner/s14.jpg"
					}, {
						"name" : "黑龙江农垦",
						"photo" : "<%=path%>/images/partner/s15.jpg"
					}, {
						"name" : "蓝威斯顿马铃薯基地",
						"photo" : "<%=path%>/images/partner/s17.jpg"
					}, {
						"name" : "北京农林科学院",
						"photo" : "<%=path%>/images/partner/s19.jpg"
					}, {
						"name" : "山东东营园林局",
						"photo" : "<%=path%>/images/partner/s20.jpg"
					} ];
					var ptn = $("#main-carousel > .carousel-inner");
					$.each(slider, function(idx, v) {
						var d = $("<div class='item'> "
								+ "<img src='" + v.photo + "'> "
								+ "    <div class='carousel-caption'>"
								+ "	<span>" + v.name + "</span>" + "    </div>"
								+ "</div>");
						if (idx === 0) {
							d.addClass("active");
						}
						ptn.append(d);
					});
				});
	</script>


	<div
		style="position: fixed; right: 20px; bottom: 20px; cursor: pointer; display: none;">
		<a><i class="fa fa-4x fa-angle-double-up"></i></a>
	</div>
</body>
</html>