<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<input type="hidden" name="id" value="${securityPunishment.id}"/>
	<div style="text-align:center;margin-top:10px;margin-bottom:10px;padding: 0;display:none;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" onclick="CreatePrintPage();LODOP.PREVIEW();">打印当前页</a> 
	</div>
	<div id="securityPunishment_PrintMsg2"></div>
	<div class="easyui-panel" id="tqzaglcfshbPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;">
		
		<div style="text-align: center;width:680px;"><span style="font-weight: bold;font-size: 24px;">社区服刑人员警告审批表</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		
		<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;width:680px;">
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="18%">${securityPunishment.culpritName }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">性别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="18%">${fns:getSysDicValueByKey('common_table', 'sex', securityPunishment.culprit.dicSexKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">出生年月</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="22%"><fmt:formatDate value="${securityPunishment.culprit.birthday}" pattern="yyyy年MM月dd日" /></td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">居住地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${securityPunishment.culprit.address}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">户籍地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${securityPunishment.culprit.regResidence}</td>
			</tr>
			
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">罪名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${securityPunishment.culprit.crimeInfo }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">原判刑期</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${securityPunishment.culpritJudgment.adjudgePeriod }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">附加刑</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${securityPunishment.culpritJudgment.accessoryPunishment }</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正类别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正期限</td>
				<td style="border-right:1px solid;border-bottom:1px solid;"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;">起止日</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">
				<c:if test="${empty securityPunishment.culprit.redressStartDate }">
				自&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</c:if>
				<c:if test="${not empty securityPunishment.culprit.redressStartDate }">
				自<fmt:formatDate value="${securityPunishment.culprit.redressStartDate}" pattern="yyyy年MM月dd日" />
				</c:if>
				<br>
				<c:if test="${empty securityPunishment.culprit.redressEndDate }">
				至&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</c:if>
				<c:if test="${not empty securityPunishment.culprit.redressEndDate }">
				至<fmt:formatDate value="${securityPunishment.culprit.redressEndDate}" pattern="yyyy年MM月dd日" />
				</c:if>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">禁止令<br>内容</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${securityPunishment.culpritJudgment.contentBan }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">禁止期限<br>起止日</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">
				<c:if test="${empty securityPunishment.culpritJudgment.startBan }">
				&nbsp;&nbsp;自&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日&nbsp;&nbsp;
				</c:if>
				<c:if test="${not empty securityPunishment.culpritJudgment.startBan }">
				&nbsp;&nbsp;自<fmt:formatDate value="${securityPunishment.culpritJudgment.startBan}" pattern="yyyy年MM月dd日" />&nbsp;&nbsp;
				</c:if>
				<br>
				<c:if test="${empty securityPunishment.culpritJudgment.endBan }">
				&nbsp;&nbsp;至&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日&nbsp;&nbsp;
				</c:if>
				<c:if test="${not empty securityPunishment.culpritJudgment.endBan }">
				&nbsp;&nbsp;至<fmt:formatDate value="${securityPunishment.culpritJudgment.endBan}" pattern="yyyy年MM月dd日" />&nbsp;&nbsp;
				</c:if></td>
			</tr>
			<tr style="height: 100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">事实及<br>依据</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5"></td>
			</tr>
			
			<tr style="height:100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">司法所<br>意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr style="height:100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">县级司法<br>行政机关<br>意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr style="height: 100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">县级司法<br>行政机关<br>审核意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			<tr style="height:50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">备注</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5"></td>
			</tr>
			
			<tr style="display: none;">
				<td colspan="100">
					<a id="securityPunishmentPrintBtn2" class="easyui-linkbutton">打印</a>
					<a id="securityPunishmentPrintBtn3" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
			
		</table>
		<div style="text-align: left;">注：1.一式两份，县级司法行政机关、司法所各留存一份；</div>
    	<div style="text-align: left;">&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	2.用于撤销缓刑、撤销假释、收监执行时，应连同有关建议书、警告决定书等材料组卷一并报有关人民法院、公安机关、监狱管理机关。</div>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
});

$('#securityPunishmentPrintBtn2').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('securityPunishment_PrintMsg2'));
	LODOP.PRINT_INIT("打印社区服刑人员警告审批表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,40,"60%","100%",$('#tqzaglcfshbPrint').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

$('#securityPunishmentPrintBtn3').click(function (){
	$('#securityPunishmentPrint').dialog("close");
});
</script>
</body>
</html>