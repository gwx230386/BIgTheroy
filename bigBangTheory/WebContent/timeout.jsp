<%@page import="com.metarnet.base.constants.BasePropertiesConstants"%>
<%@page import="com.metarnet.base.constants.BaseConstants"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<STYLE type="css/text">
		A.islink:link {
			COLOR: #3333cc; TEXT-DECORATION: underline
		}
		A.islink:visited {
			COLOR: #3333cc; TEXT-DECORATION: underline
		}
		A.islink:hover {
			COLOR: #cc0033; TEXT-DECORATION: underline
		}
		A.islink:active {
			COLOR: #cc0033; TEXT-DECORATION: underline
		}
		A.nolink:link {
			FONT-WEIGHT: bold; CURSOR: default; COLOR: #000000; TEXT-DECORATION: none
		}
		A.nolink:visited {
			FONT-WEIGHT: bold; CURSOR: default; COLOR: #000000; TEXT-DECORATION: none
		}
		A.nolink:hover {
			FONT-WEIGHT: bold; CURSOR: default; COLOR: #000000; TEXT-DECORATION: none
		}
		A.nolink:active {
			FONT-WEIGHT: bold; CURSOR: default; COLOR: #000000; TEXT-DECORATION: none
		}
		.STYLE6 {color: #FF0000}
	</STYLE>

<BODY leftMargin=0 topMargin=0>

<TABLE width="100%" border=0>
	<TBODY>
		<TR>
			<TD noWrap width=60 height=22>
				<span style="font-size:12px; color:#256504;">&gt;提示页</span>
			</TD>
			<TD>
				<HR color=#cccccc noShade SIZE=1>          
			</TD>
		</TR>
	</TBODY>
</TABLE>

<TABLE style="MARIN-TOP: 15px" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR vAlign=top>
			<TD align="center"><img src="/<%=BaseConstants.SECURITY_MANAGE_NAME %>/images/blue-loading.gif" width="25" height="25"></TD>
		</TR>
		<TR vAlign=top>
		<TD align="center" valign="middle">
			<span class="f12" style="font-size:12px;color:#CC0000">您非法登陆或登陆超时，请重新登录！	
		</TR>
		<TR vAlign=top>
			<TD align="center">
				<span class="STYLE6" style="font-size:12px">
				</span>
			</TD>
		</TR>
	</TBODY>
</TABLE>    
<script>
var num =1;
window.setTimeout("chg()",500)
function chg()
{
    num--;
    if(num==0)
    {
    	window.open("main_toLoginPage.action","_top");
        return;
    }
    window.setTimeout("chg()",500);
}
</script>
</BODY>
</HTML>
