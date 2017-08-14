<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<div style="display:none;">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printRevokeParoleTable" onclick="preview_qmjjTable()">打印当前页</a>  
	</div>
	<div id="jcjzzms_PrintMsg"></div>
	<div class="easyui-panel" align="center" style="width:100%;border:0" id="jcjzzmsPrintPage">
		<div style="width:165mm;border:0;font-size: 16px;font-family: FangSong_GB2312;">
			<table width="100%" style="border-collapse:collapse;text-align: left;width:570px;">
			<tr>
				<td align="center" width="100%">
				<span style="font-size: 24px;">解除社区矫正证明书</span><span style="font-size:20px;">（存根）</span>
				</td>
			</tr>
			<tr>
				<td align="right" width="100%">
				<span style="font-size: 21.3px;font-family: FZXiaoBiaoSong-B05S">（&nbsp;&nbsp;）字&nbsp;&nbsp;号</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员${culprit.name}，居住地${culprit.address}，户籍地${culprit.regResidence}。身份证号码${culprit.identification}。因犯罪于<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日"/>被${culprit.culpritJudgment.adjudgeOrg}判处${culprit.culpritJudgment.crimeInfo}。依据${culprit.culpritJudgment.adjudgeOrg}${culprit.culpritJudgment.adjudgeId}判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，被依法实行社区矫正。于<fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>矫正期满，依法解除社区矫正。</span>
				</td>
			</tr>
			

			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特此证明</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">社区服刑人员签名：${culprit.name}</span><span style="font-size:20px;float:right;margin-right: 0px;">司法所（公章）</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">联系电话：${culprit.contactPhone}</span>
				<span style="float:right;margin-right: 0px;font-size:20px;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
				</td>
			</tr>
			
			<tr height="100px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td align="center" style="letter-spacing:0px;">---------------------------------------骑缝章---------------------------------------
				</td>
			</tr>
			
			<tr height="20px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td align="center" width="100%">
				<span style="font-size: 24px;">解除社区矫正证明书</span>
				</td>
			</tr>
			<tr>
				<td align="right" width="100%">
				<span style="font-size: 21.3px;font-family: FZXiaoBiaoSong-B05S">（&nbsp;&nbsp;）字&nbsp;&nbsp;号</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员${culprit.name}，居住地${culprit.address}，户籍地${culprit.regResidence}。身份证号码${culprit.identification}。因犯罪于<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日"/>被${culprit.culpritJudgment.adjudgeOrg}判处${culprit.culpritJudgment.crimeInfo}。依据${culprit.culpritJudgment.adjudgeOrg}${culprit.culpritJudgment.adjudgeId}判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，被依法实行社区矫正。于<fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>矫正期满，依法解除社区矫正。</span>
				</td>
			</tr>
			

			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特此证明</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">社区服刑人员签名：${culprit.name}</span><span style="font-size:20px;float:right;margin-right: 0px;">司法所（公章）</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">联系电话：${culprit.contactPhone}</span>
				<span style="float:right;margin-right: 0px;font-size:20px;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
				</td>
			</tr>
			<tr height="10px">
				<td width="100%">
					<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100%;" readonly="readonly"/>
				</td>
			</tr>
			<tr height="100px">
				<td width="100%" style="vertical-align:top;">
				<p class="textp"
				style="width:632px;font-size:14px;line-Height:150%;margin-top:0px;letter-spacing:1px;">
				注：上联存根复印留存司法所存档，下联发给社区服刑人员。
			</p>
				</td>
			</tr>
			<tr style="display:none;" >
				<td align="center">
					<a id="jcjzzmsPrint" class="easyui-linkbutton" >打印社区服刑人员矫正期满鉴定表</a>
				</td>
			</tr>
		</table>
    	</div>
    </div>
 </form>>
<script type="text/javascript">
var LODOP; //声明为全局变量 

$('#jcjzzmsPrint').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('jcjzzms_PrintMsg'));
	LODOP.PRINT_INIT("打印解除社区矫正证明书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#jcjzzmsPrintPage').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
