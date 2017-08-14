<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

$('#exitEntryPrintBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('exitEntry_PrintMsg'));
	LODOP.PRINT_INIT("打印");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,70,"70%","100%",$('#exitEntryPrint').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}
</script>
<form action="" method="post" id="">
	<div style="display: none;">
		<a id="exitEntryPrintBtn" class="easyui-linkbutton">打印</a>
	</div>
	<div id="exitEntry_PrintMsg"></div>		
	<div class="easyui-panel" id="exitEntryPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;border:0">
		
		<div style="text-align: center;margin-bottom:40px;"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S"">法定不批准出境人员通报备案通知书 </span></div>
		<div style="margin-top:30px;text-align: left;">编号：</div>
		<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
			<tr>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">姓&nbsp;名</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.name}</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">曾用名</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.alias }</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">性别</td>
				<td style="width:5%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</td>
				<td style="width:6%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">民族</td>
				<td style="width:6%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">出生<br/>日期</td>
				<td style="width:13%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"><fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></td>
				<td rowspan="3" style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<tr>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">文化<br/>程度</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">婚姻<br/>状况</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'')}</td>
				<td colspan="3" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">身份证</td>
				<td colspan="3" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.identification }</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">出生地</td>
				<td colspan="8" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"><c:if test="${culprit.homePlace==null}">${culprit.origin}</c:if><c:if test="${culprit.homePlace!=null}">${culprit.homePlace}</c:if></td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">出入境证件名称及号码 </td>
				<td colspan="9" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					<c:set value="${fn:split(exitEntryReport.dicZjlxKey,',') }" var="ths"></c:set>
              		<c:forEach items="${ths }" var="th" varStatus="status">
                  	${fns:getSysDicValueByKey('common_table','dicZjlxKey',th,'')}：${fn:split(exitEntryReport.cedentialsNumber, ',')[status.count-1]}&nbsp;&nbsp;&nbsp;&nbsp;
              </c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">工作单位 </td>
				<td colspan="6" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.newJob }</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">电话 </td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.jobPhone }</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">现住址 </td>
				<td colspan="6" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.address }</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">电话 </td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.contactPhone }</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">户口所在地 </td>
				<td colspan="9" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					${culprit.regResidence }
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">通报备案期限  </td>
				<td colspan="9" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					<fmt:formatDate value="${exitEntryReport.fillStartDate}" pattern="yyyy年MM月dd日" />&nbsp;至&nbsp;<fmt:formatDate value="${exitEntryReport.fillEndDate}" pattern="yyyy年MM月dd日" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:140px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">通报备案事由和法律依据 </td>
				<td colspan="9" style="height:140px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					${exitEntryReport.filingReason}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:140px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">通报备案机关意见 </td>
				<td colspan="9" style="height:140px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					${exitEntryReport.orgOpinion}
					<div style="text-align: right;margin-top:10px;margin-right:10px;">
						负责人签名：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>
					</div>	
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">填表日期</td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					<fmt:formatDate value="${now}" pattern="yyyy年MM月dd日" />
				</td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">联系人</td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					${exitEntryReport.handlingPerson}
				</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">联系<br/>电话</td>
				<td colspan="2" style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					${sysAccount.mobile}
				</td>
			</tr>
		</table>
		<div style="text-align: center"> 注：本登记表一式两份，一份寄公安局，一份留档 </div>
    </div>
    </div>
</form>


