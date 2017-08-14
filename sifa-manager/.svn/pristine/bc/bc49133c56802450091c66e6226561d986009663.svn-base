<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<input type="hidden" name="id" value="${securityPunishment.id}"/>
	
	<div id="securityPunishment_PrintMsg"></div>
	<div class="easyui-panel" id="zaglcfjysPrint" align="center" style="width:100%;">
		<div style="width:165mm;border:0;font-size: 19px;font-family: FangSong_GB2312;">
		<table width="100%">
			<tr>
				<td width="100%" align="center"><span style="font-size: 24px;font-family: FZXiaoBiaoSong-B05S"><b>社区服刑人员减刑建议书</b></span></td>
			</tr>
			
			<tr height="20px">
				<td align="right">
				<label>(&nbsp;&nbsp;&nbsp;&nbsp;)字&nbsp;&nbsp;号</label>
				</td>
			</tr>
			
			<tr height="20px">
			</tr>
			
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区矫正人员${securityPunishment.culprit.name}，${fns:getSysDicValueByKey('common_table', 'sex', securityPunishment.culprit.dicSexKey, '') }，
				<fmt:formatDate value="${securityPunishment.culprit.birthday}" pattern="yyyy年MM月dd日"/>出生，
				居住地${securityPunishment.culprit.address}，户籍地${securityPunishment.culprit.regResidence}，身份证号码${securityPunishment.culprit.identification}。
				因${securityPunishment.culpritJudgment.crimeInfo}经${securityPunishment.culpritJudgment.adjudgeOrg}于<fmt:formatDate value="${securityPunishment.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日"/>
				判处${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', securityPunishment.culpritJudgment.dicYpxfKey, '') }。
				经<c:if test="${securityPunishment.culpritJudgment.adjudgeRedressOrg eq null}">${securityPunishment.culpritJudgment.adjudgeOrg}</c:if>
				<c:if test="${securityPunishment.culpritJudgment.adjudgeRedressOrg ne null}">${securityPunishment.culpritJudgment.adjudgeRedressOrg}</c:if>
				（公安局、监狱管理局）裁定（决定、批准）裁定（决定）假释（暂予监外执行），在管制（缓刑、假释、暂予监外执行）期间，依法实行社区矫正。社区矫正期限自
				<fmt:formatDate value="${securityPunishment.culprit.redressStartDate}" pattern="yyyy年MM月dd日"/>
				起至<fmt:formatDate value="${securityPunishment.culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>止。
				</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;该社区服刑人员在社区矫正期间，有如下表现：
				</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reducePenalty.actions }
				</td>
			</tr>
			<tr>
				<td align="center">
				<textarea id="concreteFacts" name="concreteFacts" multiline="true" class="easyui-validatebox" readonly="readonly"
					style="text-align:left;width:620px;height:300px;border:0 none;overflow:auto;resize:none;font-size: 16px;font-family: FangSong_GB2312;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${securityPunishment.concreteFacts}</textarea>
				</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国刑法》第七十八条、《中华人民共和国刑事诉讼法》第二百六十二条条、《社区矫正实施办法》第二十八条、《广西壮族自治区社区矫正实施细则（试行）》第一百零七条之规定，建议对社区服刑人员          减去           。 <br>
				&nbsp;&nbsp;&nbsp;&nbsp;此致<br>
				中级人民法院
				</td>
			</tr>
			
			<tr height="30px;">
			</tr>
			
			<tr>
				<td align="right">
				<label>司法局（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>
			
			<tr>
				<td align="right" style="margin-bottom: 30px;">
				${issueYear}&nbsp;年&nbsp;${issueMonth}&nbsp;月&nbsp;${issueDay}&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			
			<tr height="50px;">
			</tr>
			
			<tr>
				<td>
				注：抄送${securityPunishment.procuratorate}人民检察院、        公安（分）局，       监狱。
				
				</td>
			</tr>
			
			<tr>
				<td align="center" style="display: none;">
					<input type="hidden" id="decideType" name="decideType" value="1">
				
					<a id="reducePenaltyPrintBtn" class="easyui-linkbutton">打印</a>
					<a id="reducePenaltyPrintBtn1" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
    	</div>
    </div>
    
</form>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$(function() {
	/* var d = new Date();
	var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	
	$('#year').html(d.getFullYear());
	$('#month').html(d.getMonth()+1);
	$('#day').html(d.getDate()); */
});

$('#reducePenaltyPrintBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('securityPunishment_PrintMsg'));
    LODOP.PRINT_INIT("打印社区服刑人员减刑建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#zaglcfjysPrint').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

$('#reducePenaltyPrintBtn1').click(function (){
	$('#reducePenaltyPrint').dialog("close");
});
</script>
</body>
</html>