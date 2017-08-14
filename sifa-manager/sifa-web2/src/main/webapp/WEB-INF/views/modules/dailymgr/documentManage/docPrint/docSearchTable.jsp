<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

$('#docSearchBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('docSearch_PrintMsg'));
	LODOP.PRINT_INIT("打印首次谈话记录");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,50,"70%","100%",$('#docSearchPrint').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}
</script>
<form action="" method="post" id="">
	<div id="docSearch_PrintMsg"></div>
	<div style="display: none;">
		<a id="docSearchBtn" class="easyui-linkbutton">打印</a>
	</div>
			
	<div class="easyui-panel" id="docSearchPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 19px;font-family: FangSong_GB2312;border:0">
		
		<div style="text-align: center;margin-bottom:40px;"><span style="font-weight: bold;font-size: 24px;">社区服刑人员档案查阅审批表</span></div>
		<div style="margin-top:30px;text-align: right;">日期：<fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" /></div>
		<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
			<tr>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">姓&nbsp;名</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">身份证号码</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">联系方式</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">单位</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">是否复印</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">是否有单<br/>位介绍信</td>
				<td style="width:30%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="width:20%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">查阅内容</td>
				<td colspan="3" style="width:80%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
				<tr>
				<td style="width:20%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">司法所意见</td>
				<td colspan="3" style="width:80%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="width:20%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">现居地县级司法行政机关意见</td>
				<td colspan="3" style="width:80%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="width:20%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">备注</td>
				<td colspan="3" style="width:80%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
		</table>
    </div>
    </div>
</form>


