<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>软件下载</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
 <LINK href="${ctxStatic}/css/Styl.css" type="text/css" rel="stylesheet">
</head>


<body >
	<form id="Form1" name="Form1"  style="margin:0px;"> 
		<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
			<TR height=10><td></td></TR>
			<tr>
				<td class="ta_01" colspan=2 align="center" background="../images/b-info.gif">
					<font face="宋体" size="2"><strong></strong></font>
				</td>
				
			</tr>
	    </table>	
	</form>
	<form id="Form2" name="Form2" action="" method="post">
		<table cellSpacing="1" cellPadding="0" width="90%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<TR height=10><td></td></TR>			
				<tr>
				  	<td>
		                <TABLE style="WIDTH: 105px; HEIGHT: 20px" border="0">
							<TR>
								<TD align="center" background="${ctxStatic}/images/cotNavGround.gif"><img src="${ctxStatic}/images/yin.gif" width="15"></TD>
								<TD class="DropShadow" background="${ctxStatic}/images/cotNavGround.gif">下载列表</TD>
							</TR>
			             </TABLE>
                    </td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe" colspan="2">			
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
							<tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
							    <td align="center" width="35%" height=22 background="${ctxStatic}/images/tablehead.jpg">资料全称</td>
								<td width="10%" align="center" height=22 background="${ctxStatic}/images/tablehead.jpg">操作</td>
							</tr>
									
						</table>		
					</td>
				</tr> 
			<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="HEIGHT:22px" align="center" width="35%">
											法律文书空白模版
										</td>
										<td style="HEIGHT:22px" align="center" width="10%">
											<a href="#"  >下载
										    <img src="${ctxStatic}/images/attach.gif" border="0" style="CURSOR:hand"></a>													
										</td>
			</tr>    
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="HEIGHT:22px" align="center" width="35%">
											U盾资料
										</td>
										<td style="HEIGHT:22px" align="center" width="10%">
											<a href="#"  >下载
										    <img src="${ctxStatic}/images/attach.gif" border="0" style="CURSOR:hand"></a>													
										</td>
			</tr>    
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="HEIGHT:22px" align="center" width="35%">
											身份证识别仪驱动
										</td>
										<td style="HEIGHT:22px" align="center" width="10%">
											<a href="#"  >下载
										    <img src="${ctxStatic}/images/attach.gif" border="0" style="CURSOR:hand"></a>													
										</td>
			</tr>    
				
   
			</TBODY>
		</table>
	</form>
	

</body>


</html>
