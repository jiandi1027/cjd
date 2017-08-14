<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<style type="text/css">
td.tdtitle{
	border-bottom:1px none #000;
	border-left:1px solid #000;
	border-right:1px solid #000;
}
td.tdcontent{
	border-bottom:1px none #000;
	border-right:1px none #000;
}
</style>
<style type="text/css">
			
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
				/* height: 244mm; */
				height: 200mm;
				border: 0;
				margin-right: auto; 
				margin-left: auto;
			}
			
			.bold{
			text-align:center;
			}
</style>
 <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('scheme_PrintMsg'));
    LODOP.PRINT_INIT("打印撤销缓刑建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(120,60,"70%","100%",document.getElementById('schemePrint').innerHTML);
    LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
    LODOP.NewPage();
    LODOP.ADD_PRINT_HTM(30,30,"90%","100%",document.getElementById('onePagePrintContent').innerHTML);  
    LODOP.NewPage();
    LODOP.ADD_PRINT_HTM(30,30,"90%","100%",document.getElementById('twoPagePrintContent').innerHTML);  
   
    //LODOP.PREVIEW();
}

  </script>
<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
	<div id="idControls" style="text-align:center;margin-top:10px;display: none">
		&nbsp;&nbsp;
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="schemePrintBtn" onclick="preview()">打印当前页</a> 
	</div>
	<div id="scheme_PrintMsg"></div>
	<div id="schemePrint">
		<div  style="font-family:FangSong_GB2312;
		width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:33px;margin-top:100px;text-align: center;font-weight:bold;">
				社区矫正人员矫正方案
			</div>
			<p style="margin-top:190px;padding:0;font-size:25px; font-weight:bold; text-align:center;                                                                                                                                                                                                                                                                                                                                        ">
				社区矫正人员姓名：${culprit.name }
			</p>
			<p style="font-size:25px;margin-top:50px;padding:0;font-weight:bold;text-align:center;">
				矫正单位：${culprit.groupName }
			</p>
			<p style="font-size:25px;font-weight:bold;margin-top:50px;text-align:center;">
				方案制定日期：<fmt:formatDate value="${scheme.created}" pattern="yyyy年MM月dd日" />
			</p>
			<p  style="font-size:25px;margin-top:200px;text-align:center;font-weight:bold;">
				浙江省社区矫正工作委员会办公室制
			</p>
			</div >
	</div>	
			
			
		<div id="onePagePrintContent" style="font-family:FangSong_GB2312;font-size:19px;
		width:185mm;height:200mm;border:0;margin-right:auto;margin-left: auto;text-align:center;">
			<table border=1 cellspacing=0 cellpadding=0 >
				<tr style="text-align:center">
					<td width='5%'>
						姓名
					</td>
					<td width='10%'>
						${culprit.name}
					</td>
					<td width='10%'>
						性别
					</td>
					<td width='10%'>
						${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}
					</td>
					<td width='10%'>
						出生
						<br />
						日期
					</td>
					<td width='13%'>
						<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />
					</td>
					<td width='10%'>
						罪名
					</td>
					<td width='12%'>
						${culprit.culpritJudgment.crimeInfo}
					</td>
					<td width='10%'>
						刑&nbsp;&nbsp;&nbsp;&nbsp;罚
						<br />
						执行类别
					</td>
					<td width='10%'>
						${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}
					</td>
				</tr>
				<tr>
					<td style="line-Height:150%;vercital-align:center;height:930px;">
						主
						<br />
						要
						<br />
						犯
						<br />
						罪
						<br />
						事
						<br />
						实
						<br />
						、
						<br />
						社
						<br />
						会
						<br />
						反
						<br />
						映
						<br />
						及
						<br />
						心
						<br />
						理
						<br />
						测
						<br />
						试
						<br />
						情
						<br />
						况
					</td>
					<td colspan=9 style="text-align:left;">
						${culprit.culpritJudgment.crimeFact}
						<br/>
					</td>

				</tr>
			</table>
		</div>
		
		
	<div id="twoPagePrintContent" style="font-family:FangSong_GB2312;font-size:19px;
		width:185mm;height:200mm;margin-right:auto;margin-left: auto;text-align:center;margin-top:300px;">
		 <table border=1 cellspacing=0 cellpadding=0  >
			<tr>
				<td width='5%' style="height:400px;line-Height:250%;">矫<br/>正<br/>意<br/>见</td>
				<td style="text-align:left;width:650px">
				${scheme.schemeOpinion}
				</td>
			</tr> 
			<tr>
				<td style="vercital-align:center;height:550px;line-Height:250%;">矫<br/>正<br/>措<br/>施</td>
				<td>
					<div style="height:330px;padding:10px;text-align:left;">${scheme.schemeStep}</div>
					<div style="height:50px;">
						<table border=0 cellspacing=0 cellpadding=0 width=100% >
							<tr>
								<td style="BORDER-RIGHT:0px;BORDER-BOTTOM:0px;">司法助理员（签字）</td>
								<td style="BORDER-RIGHT:0px;BORDER-BOTTOM:0px;"><input value="<fmt:formatDate value="${model.plan.createdTime}" pattern="yyyy年MM月dd日" />" 
			style="border-left:0px;border-top:0px;border-right:0px;border-bottom:0px solid ;width:230px;font-size:20px;" /></td>
							</tr>
							<tr>
								<td style="BORDER-RIGHT:0px;BORDER-TOP:0px;;BORDER-BOTTOM:0px;">司法所所长（签字）</td>
								<td style="BORDER-RIGHT:0px;BORDER-TOP:0px;;BORDER-BOTTOM:0px;"><input value="<fmt:formatDate value="${model.plan.createdTime}" pattern="yyyy年MM月dd日" />" 
			style="border-left:0px;border-top:0px;border-right:0px;border-bottom:0px solid ;width:230px;font-size:20px;" /></td>
							</tr>
						</table>	
					</div>
				</td>
			</tr> 
		</table>
			<p class="textp">说明：此表存入社区矫正人员个人档案。</p>
		</div>		
</div>
