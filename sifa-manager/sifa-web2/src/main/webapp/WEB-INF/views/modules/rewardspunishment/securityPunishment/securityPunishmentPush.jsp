<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
 .texts{font-size:18px;}
</style>

<form action="${ctx}/rewardspunishment/securityPunishment/securityPunishmentAudit" method="post" id="securityPunishmentPushForm">
	<input type="hidden" id="id" name="id" value="${securityPunishment.id}" />
	<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
	<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid" border=0 cellSpacing=0 cellPadding=0 >
			<tr>
				<td width="80%" align="center" height="50px" style="border: 0"><span style="font-size: 30px;">治安管理处罚建议书</span></td>
			</tr>
			<tr>
				<td style="border: 0">
				<p class="textp" style="font-size:19px;margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员<span class="texts bold">${securityPunishment.culprit.name}</span>，
				<span class="texts bold">${fns:getSysDicValueByKey('common_table', 'sex', securityPunishment.culprit.dicSexKey, '') }</span>，
				<span class="texts bold"><fmt:formatDate value="${securityPunishment.culprit.birthday}" pattern="yyyy年MM月dd日"/></span>出生，
				<span class="texts bold">${fns:getSysDicValueByKey('common_table', 'nation', securityPunishment.culprit.nation, '') }</span>，
				居住地<span class="texts bold">${securityPunishment.culprit.address}</span>，
				户籍地<span class="texts bold">${securityPunishment.culprit.regResidence}</span>，
				身份证号码<span class="texts bold">${securityPunishment.culprit.identification}</span>。
				因<span class="texts bold">${securityPunishment.culpritJudgment.crimeInfo}</span>
				经<span class="texts bold">${securityPunishment.culpritJudgment.adjudgeOrg}</span>
				于<span class="texts bold"><fmt:formatDate value="${securityPunishment.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日"/></span>
				判处<span class="texts bold">${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', securityPunishment.culpritJudgment.dicYpxfKey, '') }</span>。
				经<span class="texts bold"><c:if test="${securityPunishment.culpritJudgment.adjudgeRedressOrg eq null}">${securityPunishment.culpritJudgment.adjudgeOrg}</c:if>
				<c:if test="${securityPunishment.culpritJudgment.adjudgeRedressOrg ne null}">${securityPunishment.culpritJudgment.adjudgeRedressOrg}</c:if>
				</span>（公安局、监狱管理局）裁定（决定、批准）
				<span class="texts bold">${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', securityPunishment.culpritJudgment.dicPenalTypeKey, '') }</span>，
				在<span class="texts bold">${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', securityPunishment.culpritJudgment.dicPenalTypeKey, '') }</span>
				期间，依法实行社区矫正。社区矫正期限自<span class="texts bold">
				<fmt:formatDate value="${securityPunishment.culprit.redressStartDate}" pattern="yyyy年MM月dd日"/></span>
				起至<span class="texts bold"><fmt:formatDate value="${securityPunishment.culprit.redressEndDate}" pattern="yyyy年MM月dd日"/></span>止。
				</p>
				<p class="textp" style="font-size:19px;margin-top:3px;text-indent:28px;line-height:30px;">
				该社区矫正人员有违反社区矫正监督管理规定(人民法院禁止令)的行为，具体事实如下：<span class="texts bold">
				</span>
				</p>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 40px;border: 0">
				<textArea id="concreteFacts" name="concreteFacts" class="easyui-validatebox" style="width: 95%;height:150px;overflow:auto;resize:none;" required=true 
					onkeydown='textarealength(this,1000)' onKeyUp="textarealength(this,1000)" onMouseOut='textarealength(this,1000)' maxlength="1000">${securityPunishment.concreteFacts}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">1000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			<tr>
				<td style="border: 0">
				<p class="textp" style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
						根据《中华人民共和国治安管理处罚法》第六十条、《社区矫正实施办法》第二十四条之规定，建议对社区矫正人员<span class="texts bold">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>给予治安管理处罚。
				</p>
				<p class="textp" style="font-size:19px;;margin-top:10px;text-indent:45px;line-height:30px;">
					此致<br/>
				<span class="texts bold"><input type="text" name="publicSecurityBureau" id="publicSecurityBureau" value="${securityPunishment.publicSecurityBureau}" maxlength="20"
				class="easyui-validatebox" required=true style="border:1px solid #ff0000;width:100%;font-size:18px;width:138px;" /></span>公安（分）局
				</p>
				<p class="textp" style="font-size:19px;margin-top:10px;text-align:right;">
				<input name="issueYear" id="issueYear" class="easyui-numberbox" value="${issueYear }" data-options="required:true,min:2017"
					style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:50px;font-size:18px;font-weight:bold;" />
				年
				<input name="issueMonth" id="issueMonth" class="easyui-numberbox" value="${issueMonth }" 
					data-options="required:true,min:1,max:12,formatter:function(value){if(value.length==1){return '0'+value;}else{return value;}}"
					style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:30px;font-size:18px;font-weight:bold;" />
				月
				<input name="issueDay" id="issueDay" class="easyui-numberbox" value="${issueDay }" 
					data-options="required:true,min:1,max:31,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}"
					style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:30px;font-size:18px;font-weight:bold;" />
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</p>
				<p class="textp" style="font-size:19px;margin-top:20px;line-height:30px;">
				注：抄送 <span class="texts bold">
				<input type="text" name="procuratorate" id="procuratorate" class="easyui-validatebox" required=true value="${securityPunishment.procuratorate}" maxlength="20"
				style="border:1px solid #ff0000;width:100%;font-size:18px;width:138px;" /></span>人民检察院。
				</p>
				</td>
			</tr>
			<tr>
				<td align="center" style="display: none;">
					<c:if test="${sysAccount.roleId == '3002' || sysAccount.roleId == '3003'}">
					<input type="hidden" id="decideType" name="decideType" value="1">
					</c:if>
					<c:if test="${sysAccount.roleId == '2006' || sysAccount.roleId == '2007'}">
					<input type="hidden" id="decideType" name="decideType" value="3">
					</c:if>
				
					<a id="reportBtn1" class="easyui-linkbutton">上报</a>
					<a id="reportBtn2" class="easyui-linkbutton">返回</a>
				</td>
			</tr>
		</table>
	</div>
</form>

<script type="text/javascript">
$(function() {
});

$('#reportBtn1').click(function (){
	if ($('#securityPunishmentPushForm').form('validate')) {
		var issueTime = $('#issueYear').val() + ',' + $('#issueMonth').val() + ',' + $('#issueDay').val();
		$.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/securityPunishment/securityPunishmentAudit?issueTime=' + issueTime,
			data : $('#securityPunishmentPushForm').serialize(),
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : '提示信息',
					msg : '上报成功'
				});

				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
				$.messager.show({
					title : '提示信息',
					msg : result.msg
				});
			}
		});
	}
});

$('#reportBtn2').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});


</script>
</body>
</html>