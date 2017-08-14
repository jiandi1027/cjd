<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>		
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
    <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview_hjlxBook(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('hjlx_PrintMsg'));
    LODOP.PRINT_INIT("矫正对象户籍比例分析表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#hjlxPrint').html());
}
</script>
	<div>
		<div style="text-align:center;margin-top:10px;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="crimePrintBtn" onclick="preview_hjlxBook()">打印当前页</a>  
		</div>
		<div id="hjlx_PrintMsg"></div>
		<div class="easyui-panel" id="hjlxPrint" style="width:100%;border:0" align="center">
			<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;border:0">
			<div style="text-align: center;margin-bottom:40px;width:670px;">
				<span style="font-weight: bold;font-size: 24px;">矫正对象户籍比例明细表</span>
			</div>
			<table width="100%" style="margin-top:10px;border-collapse:collapse;text-align: left;width:670px;">
				<tr style="font-size:16px;font-weight:bold;">
					<td width="65%">统计部门：${groupName}</td>
					<td width="35%">制表人：${sysAccount.accountname}</td>
				</tr>
				<tr style="font-size:16px;font-weight:bold;">
					<td>统计时间：
					<c:if test="${empty startDate}">
						<fmt:formatDate value="${endDate}" pattern="yyyy年MM月dd日" />
					</c:if>
					<c:if test="${not empty startDate}">
						<fmt:formatDate value="${startDate}" pattern="yyyy年MM月dd日" />至<fmt:formatDate value="${endDate}" pattern="yyyy年MM月dd日" />
					</c:if>
					</td>
					<td>矫正状态：
						${status}
					</td>
				</tr>
			</table>
			<table width="100%" style="margin-top:10px; border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
				<tr>
					<td style="width:10%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">编号</td>
					<td style="width:50%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">犯罪类别</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">人数</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">比例(%)</td>
				</tr>
				<c:forEach items="${hjlxMap}" var="hjlxs" varStatus="status">
              		<tr>                                                                                                                                                                                                                                                                                       	
                		<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${status.count}</td>
                		<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${hjlxs.TYPENAME}</td>
                		<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${hjlxs.COUNT}</td>
                		<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${hjlxs.PERCENT}</td>
					</tr>
              	</c:forEach>
              	<tr>
					<td colspan="2" style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">合计</td>
					<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${total}</td>
					<td style="height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${totalPercent}</td>
				</tr>
			</table>
		</div>
    </div>
</div>