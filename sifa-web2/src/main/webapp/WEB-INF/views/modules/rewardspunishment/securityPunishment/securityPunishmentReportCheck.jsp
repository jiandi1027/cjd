<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
 .texts{font-size:15px;}
</style>

<form id="securityPunishmentReportCheckForm" name="securityPunishmentReportCheckForm" action="" method="post">
	<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
	<input type="hidden" name="id" value="${securityPunishment.id}"/>
	<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>

	<div class="easyui-panel" title="治安管理处罚建议书" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid" border=0 cellSpacing=0 cellPadding=0>
			<tr>
				<td align="center" style="border: 0"><span style="font-size: 30px;">治安管理处罚建议书</span></td>
			</tr>
			<tr>
				<td style="border: 0">
				<p class="textp" style="font-size:15px;text-indent:28px;line-height:20px;">
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
				<p class="textp" style="font-size:15px;text-indent:28px;">
				该社区矫正人员有违反社区矫正监督管理规定(人民法院禁止令)的行为，具体事实如下：<span class="texts bold">
				</span>
				</p>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 40px;border: 0">
				<textArea id="concreteFacts" name="concreteFacts" class="easyui-validatebox" style="width: 95%;height:150px;overflow:auto;resize:none;text-indent: 28px;" readonly="readonly" >${securityPunishment.concreteFacts}</textArea>
				</td>
			</tr>
			<tr>
				<td style="border: 0">
				<p style="font-size:15px;;margin-top:3px;text-indent:28px;line-height:20px;">
						根据《中华人民共和国治安管理处罚法》第六十条、《社区矫正实施办法》第二十四条之规定，建议对社区矫正人员<span class="texts">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>给予治安管理处罚。
				</p>
				</td>
			</tr>
		</table>
	</div>		
	
	<div class="easyui-panel" title="审批环节" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid">			
			<tr>
				<th style="text-align: center;" width="20%">操作环节</th>
				<th style="text-align: center;" width="20%">操作时间</th>
				<th style="text-align: center;" width="20%">操作人</th>
				<th style="text-align: center;" width="20%">意见</th>
				<th style="text-align: center;" width="20%">备注</th>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
			<tr>
				<td align="center" width="20%">${processDetail.createrCnName }</td>
				<td align="center" width="20%"><fmt:formatDate value='${processDetail.created}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td align="center" width="20%">${processDetail.auditName}</td>
				<td align="center" width="20%">
				<c:choose>
				<c:when test="${processDetail.dicDecideType == '2' || processDetail.dicDecideType == '4'}">
				退回
				</c:when>
				<c:when test="${processDetail.dicDecideType == '1' || processDetail.dicDecideType == '3'}">
				同意
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
				</td>
				<td align="center" width="20%">${processDetail.opinion}</td>
			</tr>
            </c:forEach>
		</table>
	</div>
				
	<div class="easyui-panel" title="审批意见" style="width:100%;padding:5px;margin:0 auto;margin-bottom: 10px;">
		<table width="100%" class="grid" align="center">			
			<tr style="text-align: left;">
				<th width="20%"><span style="color: red;">*</span>审核意见：</th>
				<td width="80%">
				<input type="radio" name="decideType" value="1" checked="checked"/>同意
				<input type="radio" name="decideType" value="2" />退回
				</td>
			</tr>
			<tr>
				<th>具体意见：</th>
				<td><textArea id="opinion" name="opinion" class="easyui-validatebox" style="width: 350px;height:50px;overflow:auto;resize:none;" 
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			
			<tr>
				<td align="center" style="display: none;">
					<a id="auditCheckBtn1" class="easyui-linkbutton">提交</a>
					<a id="auditCheckBtn2" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
$(function() {
});

$('#auditCheckBtn1').click(function (){
	if ($('#securityPunishmentReportCheckForm').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/securityPunishment/securityPunishmentAudit',
			data : $('#securityPunishmentReportCheckForm').serialize(),
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : '提示信息',
					msg : result.msg
				});
				
				$('#securityPunishmentReportCheck').dialog("close");
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
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#auditCheckBtn2').click(function (){
	$('#securityPunishmentReportCheck').dialog("close");
});

</script>
</body>
</html>