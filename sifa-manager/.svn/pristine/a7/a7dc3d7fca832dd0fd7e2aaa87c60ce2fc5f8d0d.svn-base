<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>u盾环境在线安装</title>
<link href="${ctxStatic }/style/files/online_inst.css" rel="stylesheet" type="text/css">
<OBJECT id="ePass" style="LEFT: 0px; TOP: 0px" height="0" width="0" classid="clsid:0272DA76-96FB-449E-8298-178876E0EA89" name="ePass" VIEWASTEXT>
</OBJECT>

<SCRIPT language=JavaScript>
<!--

function startInstall()
{
	document.location.href = 'exec.html';
}

function startUnInstall()
{
	document.location.href = 'exec1.html';
}


function imgSwitch(blnMouseOn, type) {
 if(type == 1)
 {
  if (document.images) 
	{if (blnMouseOn)
	    document['imgInstall'].src = '${ctxStatic }/style/files/btn_inst_hover.gif';
	 else
		document['imgInstall'].src = '${ctxStatic }/style/files/btn_inst_normal.gif';}
 }
 else
 {
  if (document.images) 
	{if (blnMouseOn)
	    document['imgInstall'].src = '${ctxStatic }/style/files/btn_uninst_hover.gif';
	 else
		document['imgInstall'].src = '${ctxStatic }/style/files/btn_uninst_normal.gif';}
 }
}

//-->
</SCRIPT>
<Script Language="VBScript">
	'-----------------------------------------------------------------
	'-----------------------------------------------------------------
	' IE SPECIFIC:
	' Test to make sure ePass1000nd private interface loaded properly by calling a method on it.
	' For best results, the method we call should only be available in the 
	' most recent version of the control, however any method will detect
	' failure to create the object.
	Function ConfirmXEnrollLoaded()
		On Error Resume Next
		ePass.GetLibVersion
		If Err.number = &H1B6 Then
			ConfirmXEnrollLoaded = false
	        Exit function
	    end if
	    ConfirmXEnrollLoaded = true
		
	End Function
</Script>

</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle" bgcolor="#000000"> 
      <table width="600" height="360" border="0" cellpadding="1" cellspacing="0" bgcolor="#8C9DDF">
        <tr>
          <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#0c269d">
              <tr>
                <td height="20" align="center" background="${ctxStatic }/style/files/online_inst_1.gif">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="2"><img src="${ctxStatic }/style/files/nulldot.gif" width="1" height="80"> 
                      </td>
                      <td class="title">U盾环境在线安装</td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td>
<table width="100%" height="100%" border="0" cellpadding="5" cellspacing="0">
                    <tr> 
                      <td width="180" rowspan="2" align="center" valign="middle"><img src="${ctxStatic }/style/files/logo.gif" width="146" height="165"></td>
                      <td valign="top"> 
                        <p class="bold">欢迎使用U盾运行环境在线配置!</p>
                        <p>&nbsp;</p>
<script Language=JavaScript>

{
	//console.log(1);
	var nResult = ConfirmXEnrollLoaded();
	//console.log(nResult);
	if (nResult == true) {
		document.write("<p>卸载你电脑上u盾的运行环境, 点击\"UnInstall\"按钮.</p>");
		document.write("<A href='exec1.html' OnClick='return startUnInstall();' onmouseout='imgSwitch(false, 0);' onmouseover='imgSwitch(true, 0);'>");
		document.write("<IMG name=imgInstall src='${ctxStatic }/style/files/btn_uninst_normal.gif' alt='UnInstall now!' border=0></IMG></A>");
	}
	else
	{
		document.write("<p>在你电脑上安装u盾运行环境,请点击\"Install\"按钮.</p>");
		document.write("<A href='exec.html' OnClick='return startInstall();' onmouseout='imgSwitch(false, 1);' onmouseover='imgSwitch(true, 1);'>");
		document.write("<IMG name=imgInstall src='${ctxStatic }/style/files/btn_inst_normal.gif' alt='Install now!' border=0></IMG></A>");
	}	
}
</script>
				  &nbsp;</td>
                    </tr>
                    <tr> 
                      <td valign="bottom"><font color="#999999"><strong>注意: </strong>如果你不能正常打开该页面, 请确认你的浏览器能运行ActiveX contorl，然后点击弹出窗口中"yes"按钮.</font> 
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="20" align="center" background="${ctxStatic }/style/files/online_inst_2.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="2"><img src="${ctxStatic }/style/files/nulldot.gif" width="1" height="70"> 
                      </td>
                      <td align="right" valign="bottom"><font color="#CCCCCC">Copyright &copy; 2005-2009 
                       </font> </td>
                    </tr>
                 </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
</body>
</html>
