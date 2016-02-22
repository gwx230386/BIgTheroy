
var locations = [ {
			"alias" : "暂无",
			"id" : 13634,
			"lat" : "40.836857",
			"lng" : "102.446645",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13588,
			"lat" : "42.243613",
			"lng" : "118.609613",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13297,
			"lat" : "41.975033",
			"lng" : "118.364027",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13284,
			"lat" : "46.407628",
			"lng" : "123.287417",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13221,
			"lat" : "24.702929",
			"lng" : "115.842873",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13124,
			"lat" : "24.702934",
			"lng" : "115.842901",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 13102,
			"lat" : "24.702929",
			"lng" : "115.842913",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "智墒",
			"type_id" : 8
		}, {
			"alias" : "暂无",
			"id" : 12648,
			"lat" : "24.622502",
			"lng" : "102.041711",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "气象墒情仪",
			"type_id" : 10
		}, {
			"alias" : "暂无",
			"id" : 12479,
			"lat" : "30.649779",
			"lng" : "104.196354",
			"shared" : false,
			"sn" : "示例设备",
			"subscribe" : false,
			"type" : "田间气象站",
			"type_id" : 9
		} ];
$(document).ready(function () {
	
	var timer;
	$(window).resize(function () {
		clearTimeout(timer);
		timer = setTimeout(dev_slide_reheigt, 200);
	});
	var dev_slide_reheigt = function () {
		var tth = $("#device-map").height() - 34;
		tth -= $("#accordion > .panel").length * 34;
		$(".list-wrapper").animate({"max-height": tth}, "fast", function () {
			$(".list-wrapper").perfectScrollbar();
		});
	}
	dev_slide_reheigt();
	PromptConfig.addMask(null);

	//初始化地图
	var map = new AMap.Map("device-map");

	map.plugin(["AMap.ToolBar"], function () {
		//加载工具条
		var tool = new AMap.ToolBar();
		map.addControl(tool);
	});
	map.plugin(["AMap.MapType"], function () {
		//地图类型切换
		var type = new AMap.MapType({
			defaultType: 0 //使用2D地图
		});
		map.addControl(type);
	});

	// 设备对象
	var MarkerMgr = new function () {
		var allmarker = {};
		var win = new AMap.InfoWindow({
			isCustom: true,
			offset: new AMap.Pixel(0, -35),
			autoMove: true,
			size: new AMap.Size(230, 130),
			content: ""
		});
		this.push = function (id, mk) {
			allmarker[id + ""] = mk;
		};
		this.draw = function () {
			var arr = [];
			$.each(allmarker, function (k, v) {
				v.setMap(map);
				arr.push(v);
			});
			setTimeout(function () {
				map.setFitView(arr);
			}, 300)
			
		};
		this.blink = function (id, zoom) {
			var mk = allmarker[id];
			var hasLocation = typeof(mk) != "undefined";
			$("#device-info").remove();
			if (hasLocation) {
				!zoom || map.setZoomAndCenter(6, mk.getPosition());
				win.open(map, mk.getPosition());
				win.setPosition(mk.getPosition());
				win.setContent("");
			}
			$(".device-list li").removeClass("active");
			$(".device-list li[data-id='" + id + "']").addClass("active");
			
			$.ajax({
				type : 'GET',
				url : 'device_queryDeviceById.action',
				dataType : 'json',
				async: true,
				data:"deviceBean.deviceId="+id,
				success: function (data) {
					
					var temp = $(".device-info-template");
					var json = eval(data);
					temp.find(".number").text("编号：" + json.number);
					temp.find(".type").text("类型：" + json.type);
					temp.find(".remark").text("备注：" + (json.remark || ""));
					temp.find(".battery").text("电量：" + (json.battery || ""));
					temp.find("a").attr("data-id", json.deviceId).attr("id", "device-detail-toggle");
					if (hasLocation)
					{
						win.setContent("<div id='device-info'>" + temp.html() + "</div>");
					}
					else 
					{
						var m = $("#device-map");
						$(document.body).append($("<div id='device-info'></div>"));
						$("#device-info").addClass("none_loc_popwindow").html(temp.html()).css({
							top: m.offset().top + 20,
							left: m.offset().left + m.width() / 2 - 130
						}).find(".number").html("编号：" + data.number).show();
						$("#device-info").find(".cert").remove();
					}
					$("#device-info").find(".cls").click(function () {
						map.clearInfoWindow();
						$("#device-info").remove();
					});
					
					// 生成带参数的二维码图片
					showQrcode(id);
				}
			});		
			return mk;
		};
	};
	var search_result_fill = function () {
		var txt = $.trim($(".device-search input").val());
		if ($.trim(txt).length == 0) {
			$(".device-list li").show();
		} else {
			$(".device-list li").each(function () {
				var sn = $(this).find("span").text();
				var alias = $(this).find("input").attr("data-orginal");
				if (!sn.startWith(txt) && (alias.length == 0 || !alias.startWith(txt))) {
					$(this).hide();
				} else {
					$(this).show();
				}
			});
		}
		calc_device_count();
		$(".list-wrapper").perfectScrollbar("update");
	};
	var calc_device_count = function () {
		$("#accordion .panel").each(function () {
			var count = $(this).find(".device-list li[style != 'display: none;']").length;
			$(this).find(".panel-title a span").text("(" + count + ")");
		});
	};
	$(".device-search a").click(search_result_fill);
	$(".device-search input").keyup(function (e) {
		if (e.keyCode == 13) {
			search_result_fill();
			return false;
		}
	});
	
	calc_device_count();
	
	$(".device-list li").hover(function () {
		$(this).find(".alias-modify").show();
	}, function () {
		$(this).find(".alias-modify").hide().find("i").attr("class", "fa fa-edit");
		$(this).find(".alias").attr("data-edit", "0");
		var ipt = $(this).find("input");
		ipt.attr("readonly", "readonly").css({
			"background-color": "transparent"
		}).val(ipt.attr("data-orginal"));
	});
	
	$(".device-list li").unbind("click").click(function() {
		if ($(this).find(".alias").attr("data-edit") == "0") 
		{
			MarkerMgr.blink($(this).attr("data-id"), true);
			return false;
		}
	});
	
	//map control
	var icons = {
		i8: "/insentek/images/marker_8.png?v=2",
		i9: "/insentek/images/marker_9.png?v=2",
		i10:"/insentek/images/marker_10.png?v=2"
	};
	//http://lbs.amap.com/api/javascript-api/guide-2/overlay/#marker
	for (var i = 0; i < locations.length; i++) {
		if (locations[i].lng && locations[i].lat && !isNaN(locations[i].lng) && !isNaN(locations[i].lat)) {
			var marker = new AMap.Marker({
				icon: new AMap.Icon({
					size: new AMap.Size(20, 20),
					image: icons["i" + locations[i].type_id]
				}),
				position: new AMap.LngLat(locations[i].lng, locations[i].lat)
			});
			marker.id = locations[i].id;
			AMap.event.addListener(marker, 'click', marker_click);
			MarkerMgr.push(locations[i].id, marker);
		}
	}
	AMap.event.addListener(map, 'complete', function () {
		MarkerMgr.draw();
	});

	function marker_click() {
		var item = $(".device-list li[data-id='" + this.id + "']");
		var idx = $(item).parent().attr("data-index");
		if (!$("#group-" + idx).hasClass("in")) {
			$("#panel-toggle-" + idx).click();
		}
		$(item).parent().parent().scrollTop(item.index() * item.outerHeight());
		MarkerMgr.blink(this.id, false);
	}


	function getRandom(n){
		return Math.floor(Math.random()*n+1);
	}
});

function device_detail_pop(obj) 
{
	$(".fancybox").fancybox({
		width:1600
		});
	$("#deviceInfo").click();

}


