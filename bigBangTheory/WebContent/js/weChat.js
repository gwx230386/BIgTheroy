var ticket;
var access_token;
// 展示二维码图片
function showQrcode(id)
{
	getToken();
	productTicket(id);
}

// 获取token值
function getToken()
{
	$.ajax({
		type : 'GET',
		url : 'httpRequestAction_sendGet.action',
		dataType : 'json',
		async: false,
		data:{
			url:'https://api.weixin.qq.com/cgi-bin/token', 
			param:'grant_type=client_credential&appid=wx2664fb454f8e9204&secret=d4624c36b6795d1d99dcf0547af5443d'
		},
		success : function(json) 
		{
			access_token = json.access_token;
		}
	});
}
// 生成二维码ticket
function productTicket(equipmentId)
{
	alert(equipmentId);
	var param ={
			    "expire_seconds": 604800, 
			    "action_name": "QR_SCENE", 
			    "action_info": 
			    {"scene": 
			        {"scene_id": equipmentId}
	            }
	           };
	$.ajax({
		type : 'GET',
		url : 'httpRequestAction_sendPost.action',
		dataType : 'json',
		async: false,
		data:{
			url:'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='+access_token, 
			param:JSON.stringify(param)
		},
		success : function(json) 
		{
			var ticket = json.ticket;
			var url = json.url;
			//show qrcode
			$("#device-info").find(".qrscan img").attr("src", 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='+ticket);
		}
	});
}