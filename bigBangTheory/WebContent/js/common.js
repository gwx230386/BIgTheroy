String.prototype.endWith = function(str, igonreCase) {
    if (str === null || str === "" || this.length === 0 || str.length > this.length) {
	return false;
    }
    var tmp = this.substring(this.length - str.length);
    if (igonreCase && tmp.toLowerCase() !== str.toLowerCase()) {
	return false;
    } else if (!igonreCase && tmp !== str) {
	return false;
    }
    return true;
};

String.prototype.startWith = function(str, igonreCase) {
    if (str === null || str === "" || this.length === 0 || str.length > this.length) {
	return false;
    }
    var tmp = this.substr(0, str.length);
    if (igonreCase && tmp.toLowerCase() !== str.toLowerCase()) {
	return false;
    } else if (!igonreCase && tmp !== str) {
	return false;
    }
    return true;
};

String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};

String.prototype.insert = function(str, index) {
    return this.substring(0, index) + str + this.substring(index, this.length);
};

Array.prototype.contains = function(element) {
    for (var i = 0; i < this.length; i++) {
	if (this[i] === element) {
	    return true;
	}
    }
    return false;
};
Array.prototype.avg = function(){
    var total = 0;
    for (var i = 0; i < this.length; i++) {
	if (typeof(this[i]) === "number") {
	    total += this[i];
	}else{
	    throw new error(this[i] + " is not a number");
	}
    }
    return total / this.length;
};
Date.prototype.format = function(fmt){
    var o = {
        "M+": this.getMonth() + 1, //鏈堜唤 
        "d+": this.getDate(), //鏃� 
        "h+": this.getHours(), //灏忔椂 
        "m+": this.getMinutes(), //鍒� 
        "s+": this.getSeconds(), //绉� 
        "q+": Math.floor((this.getMonth() + 3) / 3), //瀛ｅ害 
        "S": this.getMilliseconds() //姣 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

(function($){
    $(document).ready(function(){
	var same_style_head_domian = ["www.insentek.com", "insentek.com","blog.insentek.com"];
	if(same_style_head_domian.contains(document.domain)) {
	    $.getScript("http://www.insentek.com/mjax/passport/user.login.js?_t=" + Math.random(), function(){
		if(User.loggedin) {
		    $(".navbar-inner > .lr-item").html("<a href='#'>鎮ㄥソ锛�" + User.name + "</a><a href='http://www.insentek.com/passport/logout'>娉ㄩ攢</a>");
		}
	    });
	    var url = "http://" + document.domain + "/";
	    if(document.domain === same_style_head_domian[2]) {
		$(".nav-link > li.blog").addClass("active");
	    }else{
		var path = location.href;
		if(path === "/" || path === "/index.html"){
		    $(".nav-link > li").first().addClass("active");
		    return;
		}
		$(".nav-link > li > a").each(function(){
		    var p = $(this).attr("href");
		    if(p === url || p === url + "index.html"){
			return true;
		    }
		    if(path.startWith(p)) {
			$(this).parent().addClass("active");
		    }
		});
	    }
	}
	//add goup button
	var gubtn = $("<div><a><i class='fa fa-4x fa-angle-double-up'></i></a></div>");
	gubtn.css({
	    position:"fixed",
	    right:"20px",
	    bottom:"20px",
	    cursor:"pointer",
	    display:"none"
	});
	$(document.body).append(gubtn);
	gubtn.find("a").click(function(){
	    $("html,body").animate({scrollTop: 0}, 400);  
	});
	$(window).scroll(function(){
	    var st = $(document.body).scrollTop();
	    if(st < 50 && gubtn.is(":visible")) {
		gubtn.hide();
	    }
	    if(st >= 50 && gubtn.is(":hidden")) {
		gubtn.show();
	    }
	});
	try{
	    $("*[data-toggle='tooltip']").tooltip({html:true});
	    $(".chosen-select").chosen();
	}catch (e){console.log(e)}
    });
})(jQuery);
(function($) {
    $.extend({
	"e": function(tag, cls, value) {
	    var ele = $("<" + tag + "></" + tag + ">");
	    if (cls) {
		ele.addClass(cls);
	    }
	    if (value) {
		ele.html(value);
	    }
	    return ele;
	},
	"delay": function(delay_millsec, func) {
	    setTimeout(func, delay_millsec);
	},
	"cookie": function(name, value, options) {
	    if (typeof value !== 'undefined') { // name and value given, set cookie
		options = options || {};
		if (value === null) {
		    value = '';
		    options.expires = -1;
		}
		var expires = '';
		if (options.expires && (typeof options.expires === 'number' || options.expires.toUTCString)) {
		    var date;
		    if (typeof options.expires === 'number') {
			date = new Date();
			date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
		    } else {
			date = options.expires;
		    }
		    expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
		}
		var path = options.path ? '; path=' + options.path : '';
		var domain = options.domain ? '; domain=' + options.domain : '';
		var secure = options.secure ? '; secure' : '';
		document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
	    } else { // only name given, get cookie
		var cookieValue = null;
		if (document.cookie && document.cookie !== '') {
		    var cookies = document.cookie.split(';');
		    for (var i = 0; i < cookies.length; i++) {
			var cookie = jQuery.trim(cookies[i]);
			// Does this cookie string begin with the name we want?
			if (cookie.substring(0, name.length + 1) === (name + '=')) {
			    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
			    break;
			}
		    }
		}
		return cookieValue;
	    }
	},
	"obj2str":function(o){
	    var r = [];
	    if (typeof o === "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	    if (typeof o === "undefined")
		return "undefined";
	    if (typeof o === "object") {
		if (o === null)
		    return "null";
		else if (!o.sort) {
		    for (var i in o)
			r.push(i + ":" + $.obj2str(o[i]));
		    r = "{" + r.join() + "}";
		} else {
		    for (var i = 0; i < o.length; i++){
			r.push($.obj2str(o[i]));
		    }
		    r = "[" + r.join() + "]";
		}
		return r;
	    }
	    return o.toString();
	}
    });
    $.fn.dialog = function() {
	var content = this;
	var shadow = $("div.shadow");
	if(shadow.length == 0) {
	    shadow = $("<div class='shadow'></div>");
	    $(document.body).append(shadow);
	    this.show();
	}else{
	    shadow.remove();
	    this.hide();
	}
    }
})(jQuery);