<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="domicileChangePrint">
	<input type="hidden" name="id" value="${outof.id}"/>
    <input type="hidden" name="taskId" value="${outof.taskId}"/>
    <input type="hidden" name="auditType" value="${outof.auditType}"/>
	<div style="text-align:center;margin-top:10px;margin-bottom:10px;padding: 0;display:none;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" onclick="CreatePrintPage();LODOP.PREVIEW();">打印当前页</a> 
	</div>
	<div id="outofPrintMsg"></div>
	<div class="easyui-panel" id="outofPrintDiv" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;">
		
		<div style="text-align: center;width:680px;"><span style="font-weight: bold;font-size: 24px;">社区服刑人员居住地变更审批表</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		
		<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;width:680px;">
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;" width="10%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="12%">${culprit.name}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="10%">性别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="8%">${fns:getSysDicValueByKey('common_table', 'sex', culprit.dicSexKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="10%">罪名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="15%">${culprit.crimeInfo }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="10%">原判刑期</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="15%">${culpritJudgment.adjudgePeriod}</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正类别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culpritJudgment.dicPenalTypeKey,'')}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正期限</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${culpritJudgment.redressPeriod}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">起止日</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">
					<c:if test="${empty culprit.redressStartDate }">
					自&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
					</c:if>
					<c:if test="${not empty culprit.redressStartDate }">
					自<fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy年MM月dd日" />
					</c:if>
					<br>
					<c:if test="${empty culprit.redressEndDate }">
					至&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
					</c:if>
					<c:if test="${not empty culprit.redressEndDate }">
					至<fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy年MM月dd日" />
					</c:if>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">现居住地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${culprit.address}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">拟迁往地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${outof.place}</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">户籍地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${culprit.regResidence}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">身份证<br/>号码</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${culprit.identification}</td>
			</tr>
			<tr style="height: 100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">居住地变更<br>理由</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="7">${outof.leaveReason}</td>
			</tr>
			<tr style="height:100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">司法所<br>意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="7">
					<span style="display: block;height: 100px;">${outof.sfsView}<br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">
						<c:if test="${empty outof.judicialTime }">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
						</c:if>
						<c:if test="${not empty outof.judicialTime }">
							<fmt:formatDate value="${outof.judicialTime}" pattern="yyyy年MM月dd日" />
						</c:if>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			<tr style="height: 100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">现居地县级司法行政机关意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="7">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			<tr style="height:50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">备注</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="7"></td>
			</tr>
			
			<tr style="display: none;">
				<td colspan="100">
					<a id="outofPrintBtn" class="easyui-linkbutton">打印</a>
					<a id="outofPrintCloseBtn" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
		<div style="text-align: left;">注：1.一式五份，现居住地县级司法行政机关、司法所各存档一份；抄送现居住地县级人民检察院、公安（分）局各一份；随档案移交新居住地司法行政机关一份；</div>
    	<div style="text-align: left;">&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	2.变更后，新居住地司法行政机关复印送当地县级人民检察院、公安（分）局。</div>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
});

$('#outofPrintBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('outofPrintMsg'));
	LODOP.PRINT_INIT("打印社区服刑人员警告审批表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,40,"60%","100%",$('#outofPrintDiv').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

$('#outofPrintCloseBtn').click(function (){
	$('#outofPrint').dialog("close");
});
</script>
</body>
</html>