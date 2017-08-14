<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(installMsgId){
	 CreatePrintPage(installMsgId);
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(installMsgId){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),installMsgId);
    LODOP.PRINT_INIT("");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"80%","100%",document.getElementById('workTJPrint').innerHTML);
    /* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);  */
    //LODOP.PREVIEW();
    LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
}

 </script>
<div style="margin:0 2px;padding:0;font-size:16px;font-family:Arial, Helvetica, sans-serif;">
	<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printTjBtn2" onclick="preview(workTJ_PrintMsg)">打印当前页</a> 
	</div>
	<div id="workTJ_PrintMsg"></div>
	<div class="easyui-panel" id="workTJPrint" style="width:100%;border:0;" align="center">
			<div  style="font-size:24px;font-weight:bold;text-align:center;width:1000px;">社区矫正工作季度统计表(${culpritWorkTj.year}年第${culpritWorkTj.jd}季度)</div><br/>
			<table width="100%" style="margin-top:10px;border-collapse:collapse;text-align: left;width:1000px;">
				<tr style="font-size:16px;font-weight:bold;">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;填报部门：${culpritWorkTj.groupName}</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;建表人：${creater}</td>
					<td style="text-align: right">填报时间：<fmt:formatDate value="${culpritWorkTj.reportTime}"
									pattern="yyyy年MM月dd日" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
			<table style="border-collapse:collapse;border:1px solid;text-align: left;width:1000px;margin-top:8px;" >
				<tr style="text-align: center;">
					<td rowspan="3" width="3%" style="border-right: 1px solid;border-bottom: 1px solid;">序号</td>
					<td rowspan="3" width="10%;" style="border-right: 1px solid;border-bottom: 1px solid;">乡镇（街道）</td>
					<td colspan="6" align="center" style="border-right: 1px solid;border-bottom: 1px solid;">司法所工作人员情况</td>
					<td rowspan="3" width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">社区矫正人员总数</td>
				    <td rowspan="3" width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">外出社区矫正人员数</td>
					<td rowspan="3" width="23%" style="border-right: 1px solid;border-bottom: 1px solid;">备注</td>
				</tr>
				<tr style="text-align: center;">
				    <td rowspan="2" width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">工作人员总数</td>
				    <td colspan="4" align="center" style="border-right: 1px solid;border-bottom: 1px solid;">编制情况</td>
					<td rowspan="2" width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">司法所性质</td>
				</tr>
				<tr style="text-align: center;">
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">司法行政编制人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">地方行政编制人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">事业编制人数</td>
					<td width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">聘用人员人数</td>
				</tr>
				<!-- 已上报的部门 -->
				 <c:forEach items="${childTjList}" var="culpritTj" varStatus="count">
				 <c:choose > 
					<c:when test="${culpritTj.dicState eq 91801 || culpritTj.dicState eq 91804}"> 
					<tr  style="text-align: center;">
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${count.count}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.groupName}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.sfsgzryzs}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.sfxzbz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.dfxzbz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.sybz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.pyry}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.sfskind}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.allPersons}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.outPersons}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritTj.note}</td>
					</tr>
					</c:when>
					<c:when test="${culpritTj.dicState ne 91801 && culpritTj.dicState ne 91804 && groupleavel ne 2}"> 
					<tr  style="text-align: center;">
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${count.count}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"><span style="color:#FF0000">${culpritTj.groupName}(未上报)</span></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
					</tr>
				</c:when>
				</c:choose>
				</c:forEach>
					<tr  style="text-align: center;">
						  <td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">合计</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.sfsgzryzs}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.sfxzbz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.dfxzbz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.sybz}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.pyry}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.sfskind}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.allPersons}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.outPersons}</td>
						  <td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritWorkTj.note}</td>
					</tr>
			</table>
			<div style="text-align: left;width:1000px;">注： 1. 没有社区矫正人员的乡镇（街道）也要填入表格。</div>
			<div style="text-align: left;width:1000px;">2. 每季度第一个月5日前上报。</div>
	</div>
	<c:if test="${culpritWorkTj.dicState eq 91803 }">
		<div class="easyui-panel" style="width:100%;border:0;font-family:Arial, Helvetica, sans-serif;" align="center" >
			<table width="100%" class="grid" style="margin-top:50px;border-collapse:collapse;text-align: left;width:1000px;">
					<tr style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">报表状态：</th>
						<td style="border:1px solid">退回</td>
					</tr>
					<tr style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">退回时间：</th>
						<td style="border:1px solid"><fmt:formatDate value="${culpritWorkTj.returnTime}"
									pattern="yyyy年MM月dd日" /></td>
					</tr>
					<tr  style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">退回原因：</th>
						<td style="border:1px solid"><textarea readOnly=true style="width:800px;height:80px;border:0 none">${culpritWorkTj.returnReason }</textarea>
						</td>
					</tr>
			</table>
		</div>
	</c:if>
</div>