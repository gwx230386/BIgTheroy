(function ($) {
	var procss = $("<link>");
	procss.attr({
		rel: "stylesheet",
		type: "text/css",
		href: "http://static.insentek.com/css/prompt.css"
	});
	if (location.href.startWith("https")) {
		procss.attr("href", "https://static-insentek-com.alikunlun.com/css/prompt.css");
	}
	$("head").append(procss);
	window.PromptConfig = new function () {
		var mask_selector = "";
		var mask_type = "mask";
		var has_mask = 1;
		this.addMask = function (type, selector) {
			if (type === null || arguments.length === 0) {
				has_mask = 0;
			}
			if (type === "mask" || type === "liveblur") {
				mask_selector = selector;
				mask_type = type;
			}
		};
		this.getMask = function () {
			if (has_mask === 0) {
				return null;
			}
			return {"type": mask_type, "selector": mask_selector};
		};
	};
	var Prompt = function (args) {
		var id = "_widget_prompt_dialog";
		var mask_id = "_widget_prompt_mask";
		var self = this;
		var callback = args[1];
		var option = {
			icon: "info",//info|,error|,success|fa-check
			text: "",
			cancelButton: {enabled: false}
		};
		var icons = {
			info: {i: "fa-exclamation-triangle", c: "#5BC0E0"},
			success: {i: "fa-check", c: "#3c763d"}
		};
		if (typeof(args[0]) === "string") {
			option.text = args[0];
		}
		if (typeof(args[0]) === "object") {
			option.text = args[0].text;
			option.cancelButton = args[0].cancelButton || option.cancelButton;
			option.icon = args[0].icon || option.icon;
		}
		this.build = function () {
			var mask_config = PromptConfig.getMask();
			if (mask_config !== null) {
				if (mask_config.type && mask_config.type === "mask") {
					var mask = $("<div id='" + mask_id + "'></div>");
					$(document.body).append(mask);
				}
				if (mask_config.type && mask_config.type === "liveblur") {
					$(mask_config.selector).addClass("liveblur");
				}
			}
			var div = $("<div></div>").attr("id", id);
			var title = $("<div class='title'>提示</div>");
			div.append(title);
			var content = $("<div class='notice-info'><i class='fa " + icons[option.icon].i + " fa-3x' style='color:" + icons[option.icon].c + "'></i><p>" + option.text + "</p></div>");
			div.append(content);
			var btn_con = $("<div class='action'></div>");
			btn_con.append($("<a href='javascript:;' class='btn btn-default btn-sm' data-role='confirm'>确定</a>"));
			if (option.cancelButton.enabled) {
				btn_con.append($("<a href='javascript:;' class='btn btn-default btn-sm' data-role='close'>" + option.cancelButton.text + "</a>"));
			}
			div.append(btn_con);
			$(document.body).append(div);
			div.find("a").click(function () {
				self.destory();
				if ($(this).attr("data-role") === "confirm" && callback) {
					callback();
				}
			});
			div.fadeIn();
		};
		this.destory = function () {
			$("#" + id).remove();
			var mask_config = PromptConfig.getMask() || {};
			if (mask_config.type && mask_config.type === "mask") {
				$("#" + mask_id).remove();
			}
			if (mask_config.type && mask_config.type === "liveblur") {
				$(mask_config.selector).removeClass("liveblur");
			}
		};
	};
	var WebAPI = function (args) {
		//0 action 1 url 2 data 3 option
		//option {"SUCCESS":function(){}}
		var SC_CODE = ["SUCCESS", "OPERATION_FAILD", "SESSION_TIMEOUT", "TOKEN_INVALID"];
		var SC_HANDLER = {
			"SUCCESS": function (data) {
				$.prompt({text: data, icon: "success"});
			}, "OPERATION_FAILD": function (data) {
				$.prompt(data);
			}, "SESSION_TIMEOUT": function (data) {
				$("body").off("click, dbclick", "*");
				$("body a").attr("href", "javascript:;");
				$.prompt(data, function () {
					//超时刷新会自动跳转至登录页面
					location.reload();
				});
			}, "TOKEN_INVALID": function (data) {
				$.prompt(data, function () {
					location.reload();
				});
			}
		};
		$.ajax({
			type: args[0],
			url: args[1],
			data: args.length === 4 ? args[2] : {},
			dataType: "json",
			success: function (data) {
				var len = args.length;
				var code = SC_CODE[data.error];
				if (args.length >= 3) {
					if (args[len - 1][code]) {
						SC_HANDLER[code] = args[args.length - 1][code];
					}
				}
				SC_HANDLER[code](data.data);
			}
		});
	};
	$.extend({
		"prompt": function () {
			new Prompt(arguments).build();
		},
		"api": function () {
			new WebAPI(arguments);
		}
	});
})(jQuery);