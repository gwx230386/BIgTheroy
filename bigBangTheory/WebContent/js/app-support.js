(function() {
    var path = location.pathname;
    var nav = $("ul.nav-link li");
    var is_dlst = true;
    $.each(nav, function(i,val){
	var url = $(this).find("a").attr("href");
	if(path.startWith(url)) {
	    $(this).addClass("active");
	    is_dlst = false;
	    return false;
	}
    });
    if(is_dlst) {
	nav.eq(0).addClass("active");
    }
})();