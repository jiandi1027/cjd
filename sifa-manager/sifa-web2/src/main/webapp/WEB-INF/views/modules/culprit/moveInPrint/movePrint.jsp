<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<div style="display: none;">
			<a  id="movePrintBGSPB_btn" class="easyui-linkbutton">打印</a>
	</div>
	<div id="securityPunishment_PrintMsg2"></div>
	<div class="easyui-panel" id="tqzaglcfshbPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;">
		
		<div style="text-align: center;width:680px;"><span style="font-weight: bold;font-size: 24px;">社区服刑人员居住地变更审批表</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		
		<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;width:680px;">
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="18%">${moveIn.name }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">性别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="18%">${fns:getSysDicValueByKey('common_table', 'sex', moveIn.dicSexKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="14%">出生年月</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" width="22%"><fmt:formatDate value="${moveIn.bornDate}" pattern="yyyy年MM月dd日" /></td>
			</tr>

			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">罪名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${moveIn.crimeInfo }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">原判刑期</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${moveIn.adjudgePeriod }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">附加刑</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${moveIn.accessoryPunishment }</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正类别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${fns:getSysDicValueByKey('common_table','entrust_type_id',moveIn.dicPenalTypeKey ,'')}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">矫正期限</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${moveIn.redressPeriod }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">起止日</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">
				<c:if test="${empty moveIn.redressStartDate }">
				自&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</c:if>
				<c:if test="${not empty securityPunishment.culprit.redressStartDate }">
				自<fmt:formatDate value="${moveIn.redressStartDate}" pattern="yyyy年MM月dd日" />
				</c:if>
				<br>
				<c:if test="${empty moveIn.redressEndDate }">
				至&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</c:if>
				<c:if test="${not empty moveIn.redressEndDate }">
				至<fmt:formatDate value="${moveIn.redressEndDate}" pattern="yyyy年MM月dd日" />
				</c:if>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">现居住地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${moveIn.oldPlace}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">拟迁往地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">${moveIn.newPlace}</td>
			</tr>
				<tr style="height: 50px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">户籍地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="3">${moveIn.regResidence}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;">身份证号码</td>
				<td style="border-right:1px solid;border-bottom:1px solid;"><font size="2">${moveIn.cedentialsNumber}</font></td>
			</tr>
			<tr style="height: 100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">居住地<br>变更理由</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5">${moveIn.reason}</td>
			</tr>
			
			<tr style="height:100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">司法所<br>意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="5">
					${moveIn.opinion }
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr style="height:100px;">
				<td style="border-right:1px solid;border-bottom:1px solid;">现居地县级<br>司法所行政机关<br>意见</td>
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
		</table>
		<div style="text-align: left;">1.一式五份，现居住地县级司法行政机关、司法所各存档一份；抄送现居住地县级人民检察院、公安（分）局各一份；随档案移交新居住地司法行政机关一份；</div>
    	<div style="text-align: left;">2.变更后，新居住地司法行政机关复印送当地县级人民检察院、公安（分）局。</div>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
});

$('#movePrintBGSPB_btn').click(function (){
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

$('#security1').click(function (){
	$('#securityPrint').dialog("close");
});
</script>
</body>
</html>