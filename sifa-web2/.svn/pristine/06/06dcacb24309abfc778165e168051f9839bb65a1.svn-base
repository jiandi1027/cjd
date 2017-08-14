<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div id="reducePenalty_PrintMsg" style="text-align:center"></div>
<div class="easyui-panel" id="phoneAndShPrint" style="width:100%;border:0;margin-top:50px;font-size:16px;font-family:Arial, Helvetica, sans-serif;" align="center">
				<table style="border-collapse:collapse;border:1px solid;text-align: left;width:90%;margin-top:50px;" >
				<tr style="text-align: center;font-size:19px;font-weight:bold;" height="50">
					<td width="14%" style="border-right: 1px solid;border-bottom: 1px solid;">名称</td>
					<td colspan="3" style="border-right: 1px solid;border-bottom: 1px solid;">严管</td>
					<td colspan="3" style="border-right: 1px solid;border-bottom: 1px solid;">普管</td>
					<td colspan="3" style="border-right: 1px solid;border-bottom: 1px solid;">特殊类管理</td>
				    <td width="14%" style="border-right: 1px solid;border-bottom: 1px solid;">总数</td>
				</tr>
				<tr style="text-align: center;">
				    <td style="border-right: 1px solid;border-bottom: 1px solid;">司法部门名称</td>
				    <td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手机数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手环数</td>
				    <td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手机数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手环数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手机数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">配备手环数</td>
					<td style="border-right: 1px solid;border-bottom: 1px solid;">总手机手环数</td>
				</tr>
				 <c:forEach items="${workRemindList}" var="workRemind" varStatus="count">
					<tr  style="text-align: center;">
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.groupName}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.ygAmont}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.ygAmontSj}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.ygAmontSh}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.pgAmont}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.pgAmontSj}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.pgAmontSh}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.tsAmont}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.tsAmontSj}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.tsAmontSh}</td>
						 <td style="border-right: 1px solid;border-bottom: 1px solid;">${workRemind.totalAmont}</td>
					</tr>
				</c:forEach>
				<tr  style="text-align: center;">
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">合计</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${ygAmontAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${ygAmontSjAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${ygAmontShAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${pgAmontAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${pgAmontSjAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${pgAmontShAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${tsAmontAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${tsAmontSjAll}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${tsAmontShAll}</td>
						 <td style="border-right: 1px solid;border-bottom: 1px solid;">${total}</td>
					</tr>
			</table>
			<div style="text-align:right;width:90%;margin-top:50px;margin-right:50px;">统计时间：<fmt:formatDate value="${reportTime}" pattern="yyyy年MM月dd日"/></div>
</div>
<div  style="display: none;">
		<a id="phoneAndShPrintBtn" class="easyui-linkbutton">打印</a> 
</div>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$('#phoneAndShPrintBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});
//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('reducePenalty_PrintMsg'));
    LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,40,"100%","100%",$('#phoneAndShPrint').html());
    LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
}

</script>