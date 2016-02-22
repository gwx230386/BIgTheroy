
$(function() {

	 $("#dropdown-menu").find("li").first().addClass('active');
	
	  
    $("#time_default").find("button").click(function(){
    	$(this).addClass('time_default_active').siblings().removeClass('time_default_active');
    	$("#startTime,#endTime").val("");
    	$("#specialTime").val($(this).attr("value"));
		getChartData();

    });
	
	// 选择当前butoon项
	$("#dropdown-menu").find("li a").click(function() {
		
		$("#params-group .current").text($(this).text())
			.attr("data-symbol", $(this).attr("data-symbol"))
			.attr("data-pid", $(this).attr("data-id"));
		getChartData();
	});
});