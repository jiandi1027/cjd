<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
	<div id="jcsqjzxgs_PrintMsg"></div>
		<div class="easyui-panel" align="center" style="width:100%;border:0" id="jcsqjzxgsPrintPage">
		<div style="width:165mm;border:0;font-size: 16px;font-family: FangSong_GB2312;">
			
			<table style="border-collapse:collapse;align:center;width:570px;">
			<tr>
				<td align="center" width="100%">
				<span style="font-size: 24px;">解除社区矫正证明书</span><span style="font-size:20px;">（存根）</span>
				</td>
			</tr>
			<tr>
				<td width="100%">
				<span style="font-size:20px;">社区服刑人员${culprit.name}：</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国刑法》、《中华人民共和国刑事诉讼法》、《社区矫正实施办法》及《广西壮族自治区社区矫正实施细则（试行）》的规定，依据人民法院（公安局、监狱管理局）</span>
				</td>
			</tr>
			
			
			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${culprit.culpritJudgment.adjudgeId}判决书（裁定书、决定书），在管制（缓刑、假释、暂予监外执行）期间，对你依法实行社区矫正。矫正期限自<fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy年MM月dd日"/>至 <fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>止。现矫正期满，依法解除社区矫正。现向你宣告以下事项：</span>
				</td>
			</tr>

			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.对你接受社区矫正期间表现的鉴定意见：</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.管制期满，依法解除管制（缓刑考验期满，原判刑罚不再执行；假释考验期满，原判刑罚执行完毕）。</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%" height="20px">
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span style="font-size:20px;float:right;margin-right: 0px;">司法所（公章）</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%">
				<span style="float:right;margin-right: 0px;font-size:20px;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
				</td>
			</tr>
			
			<tr height="100px">
				<td width="100%">
				</td>
			</tr>
			<tr style="display:none;" >
				<td align="center">
					<a id="jcjzzmsPrint" class="easyui-linkbutton" >打印解除社区矫正宣告书</a>
				</td>
			</tr>
		</table>
    	</div>
    	</div>
<script type="text/javascript">
var LODOP; //声明为全局变量 

$('#jcsqjzxgsPrint').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('jcsqjzxgs_PrintMsg'));
	LODOP.PRINT_INIT("打印解除社区矫正宣告书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#jcsqjzxgsPrintPage').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>