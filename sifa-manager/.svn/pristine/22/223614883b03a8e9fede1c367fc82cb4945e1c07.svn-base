<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		
<style media="print">
			.noprint {
				display: none;
			}
			nav,aside{
				display: none;
			}	
			@page {
      		size: auto;  
      		margin: 0mm; 
    		}
</style>
<style type="text/css">
			body 
			{
				margin: 0 2px;
				padding: 0;
				font-family : FangSong_GB2312;
				font-size: 16px;
			}

			div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,select
			{
				margin: 0;
				padding: 0;
				margin-right: auto; 
				margin-left: auto;
			}
			.in
			{
				font-weight:bold;
				border-left:0px;
				border-top:0px;
				border-right:0px;
				border-bottom:1px solid #ff0000;
				width:30px;
				font-size:18px;"
			}
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
				height: 244mm;
				border: 0;
				text-align: center;
				margin-right: auto; 
				margin-left: auto;
			}
			.left 
			{
				display:table; 
				float: left; 
				text-align: center;
				line-height: 150%;
				border-right: 1px solid;
				border-bottom: 1px solid;
			}
		</style>
	</head>
	<script defer>
/* function loadFile(path){
  window.open(encodeURI('<c:url value="/download?filepath="/>'+path));
}
function viewinit() {
  if (null==factory.object) {
  	//document.getElementById("plusCheck").style.display="";
  } else {
	document.getElementById("plusCheck").style.display="none";
	  factory.printing.header = "";
	  factory.printing.footer = "";
	  factory.printing.leftMargin = 0.5;
	  factory.printing.topMargin = 0.5;
	  factory.printing.rightMargin = 0.5;
	  factory.printing.bottomMargin = 0.0;
	  factory.printing.portrait = true;

	  // enable control buttons
	  var templateSupported = factory.printing.IsTemplateSupported();
	  var controls = idControls.all.tags("input");
	  for ( i = 0; i < controls.length; i++ ) {
	    controls[i].disabled = false;
	    if ( templateSupported && controls[i].className == "ie55" ){
	      controls[i].style.display = "inline";
	    }
	  }
  }
} */
</script>
	<body onload="viewinit();">
		<div id="idControls" style="text-align:center;margin-top:10px;"
			class="noprint">
			<input type="button" value="打印当前页"
				onclick="window.print();"/>
			&nbsp;&nbsp;
			注：红色下划线处可输入内容
		</div>
		<div id="plusCheck" style="display: none">
			<br>
			安装IE加载项;或者直接点击
			<a href="javascript:loadFile('/file/ScriptXClientKit.msi')">下载安装</a>
		</div>
		
		<div class="content">
			<div style="font-family:SimSun;font-size:24px">
				<b>撤销假释审批表</b>
			</div>
			<table border=0 cellspacing=0 cellpadding=0 
				style="margin-top:30px;border:0;width: 625px;font-size:16px;border:2px solid;">
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								姓&nbsp;名
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.name }
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								性别
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.dicSexKey}
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								出生<br/>年&nbsp;月
							</span>
						</div>
						<div class="left" style="width:165px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.birthday}
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								居住地
							</span>
						</div>
						<div class="left" style="width:181px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.address }
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								户籍地
							</span>
						</div>
						<div class="left" style="width:256px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.regResidenceStreet }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								罪名
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.crimeInfo }
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								原判罪行
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								附加刑
							</span>
						</div>
						<div class="left" style="width:165px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								禁止令内容
							</span>
						</div>
						<div class="left" style="width:181px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								禁止期限起止 日
							</span>
						</div>
						<div class="left" style="width:256px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								矫正类别
							</span>
						</div>
						<div class="left" style="width:90px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.dicPenalTypeKey }
							</span>
						</div>
						<div class="left" style="width:90px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								矫正期限
							</span>
						</div>
						<div class="left" style="width:90px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
						<div class="left" style="width:90px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								起止日
							</span>
						</div>
						<div class="left" style="width:165px;height:70px;">
							<span style=" display:table-cell; vertical-align:middle;">
								<fmt:formatDate value="${culprit.redressStartDate }"
										pattern="yyyy年MM月dd日" />
								<br />
								至
								<fmt:formatDate value="${culprit.redressEndDate }"
										pattern="yyyy年MM月dd日" />
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								事实依据
							</span>
						</div>
						<div class="left" style="width:529px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${revokeProbation.fact }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								司法所意见
							</span>
						</div>
						<div class="left" style="width:529px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${revokeProbation.sfsyj }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								县级司法行政机关意见
							</span>
						</div>
						<div class="left" style="width:529px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${revokeProbation.xjsfxzjgyj }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								地级司法行政机关审核意见
							</span>
						</div>
						<div class="left" style="width:529px;height:150px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${revokeProbation.djsfxzjgyj }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;">
						<div class="left" style="width:90px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								备注
							</span>
						</div>
						<div class="left" style="width:529px;height:50px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${revokeProbation.note }
							</span>
						</div>
					</td>
				</tr>
			</table>
			<p class="textp"
				style="width:630px;font-size:14px;line-Height:150%;margin-top:0px;letter-spacing:1px;">
				注：此表随建议书等一并报送人民法院（公安机关、监狱管理机关）。
			</p>
		</div>
	</body>
</html>
