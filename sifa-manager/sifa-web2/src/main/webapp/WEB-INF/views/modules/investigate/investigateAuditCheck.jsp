<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/investigateAudit" method="post" id="investigateAuditCheckForm">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	<input type="hidden" name="processInstanceId" value="${investigate.processInstanceId}"/>
	
	<div class="easyui-panel" title="调查评估意见书" style="width:100%;padding:5px;margin: auto;">
		<table width="100%" class="grid" style="border: 0px;">
			<tr>
				<td width="100%" align="center"><span style="font-size: 30px;">调查评估意见书</span></td>
			</tr>
	        <tr>
	        	<td>
				${investigate.entrustUnit}:<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				受你单位委托，我局于
				<c:choose>
				<c:when test="${investigate.begTime == null}">
				&nbsp;年&nbsp;月&nbsp;日
				</c:when>
				<c:otherwise><fmt:formatDate value="${investigate.begTime}" pattern="yyyy-MM-dd" /></c:otherwise>
				</c:choose>
				至
				<c:choose>
				<c:when test="${investigate.endTime == null}">
				&nbsp;年&nbsp;月&nbsp;日
				</c:when>
				<c:otherwise><fmt:formatDate value="${investigate.endTime}" pattern="yyyy-MM-dd" /></c:otherwise>
				</c:choose>
				对${investigate.name}
				进行了调查评估。有关情况如下:
				</td>
	        </tr>
			<tr>
				<td align="center">
				
				<textArea id="situation" name="situation" class="easyui-validatebox" 
					style="width: 90%;height:320px;overflow:auto;resize:none;text-indent:28px;" readonly="readonly">${investigate.situation}</textArea>
				</td>
			</tr>
		</table>
    </div>
    
	<div class="easyui-panel" title="评估意见" style="width:100%;padding:5px;margin: auto;">
		<table width="100%" class="grid" style="text-align: center;">
			<tr>
				<th style="text-align: center;">操作环节</th>
				<th style="text-align: center;">处理时间</th>
				<th style="text-align: center;">处理人</th>
				<th style="text-align: center;">意见</th>
				<th style="text-align: center;">备注</th>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
			<tr>
				<td>${processDetail.createrCnName }
				</td>
				<td><fmt:formatDate value='${processDetail.created}' pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>${processDetail.auditName}
				</td>
				<td>${processDetail.dicDecideType == '1'?'符合监管条件，同意接收':'不符合监管条件，拒绝接收'}
				</td>
				<td>${processDetail.opinion}
				</td>
			</tr>
            </c:forEach>
		
		</table>
	</div>
    
    <div id="investigaterewardspunishmentForm"></div>
	<div class="easyui-panel" title="审核意见" style="width:100%;padding:5px;margin-bottom: 10px;margin: auto;">
		<table width="100%" class="grid">
			<c:if test="${investigate.auditType eq 'jzkCheck'||investigate.auditType eq 'fzkCheck'}">
			<tr>
				<th width="20%">是否推荐为典型案例：</th>
				<td width="30%" style="border: 0;">
				<input type="radio" name="recommendStatus" value="1"/>是
				<input type="radio" name="recommendStatus" value="2" checked="checked" style="margin-left: 20px;"/>否
				</td>
				<td width="20%" style="border: 0;"></td>
				<td width="30%" style="border: 0;"></td>
			</tr>
			<c:if test="${investigate.auditType eq 'jzkCheck'}">
			<tr>	
				<th width="20%"><span class="c-red">*</span>输入质量：</th>
				<td width="30%">
					<a href="#" class="easyui-linkbutton" iconCls="fi-checkbox icon-blue" onclick="rewardspunishment(1);" >评定</a>
				</td>
				
				<th width="20%">输入质量评分：</th>
				<td width="30%">
					<label id="optScoreLabel"></label>
					<input type="hidden" id="optScore" name="optScore" />
				</td>
			</tr>
			</c:if>
			<tr>	
				<th width="20%"><span class="c-red">*</span>执法质量：</th>
				<td width="30%">
					<c:if test="${investigate.auditType eq 'fzkCheck'}">
					<a href="#" class="easyui-linkbutton" iconCls="fi-checkbox icon-blue" onclick="rewardspunishment(3);" >评定</a>
					</c:if>
					
					<c:if test="${investigate.auditType eq 'jzkCheck'}">
					<a href="#" class="easyui-linkbutton" iconCls="fi-checkbox icon-blue" onclick="rewardspunishment(2);" >评定</a>
					</c:if>
				</td>
				<th width="20%">执法质量评分：</th>
				<td width="30%">
					<label id="zfScoreLabel" ></label>
					<input type="hidden" id="zfScore" name="zfScore" />
				</td>
			</tr>
			</c:if>
			<tr>
				<th><span class="c-red">*</span>审核类型：</th>
				<td colspan="3">
				<input id="dicEvalueViewKey" name="dicEvalueViewKey" class="easyui-combobox" required=true editable=false style="width:173px;"  
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=dic_evalue_view_key&parentKey=82000',panelHeight:'auto'">
				</td>
			</tr>
			<tr>
				<th>具体意见：</th>
				<td colspan="3">
				<textArea id="evalueViews" name="evalueViews" class="easyui-validatebox" style="width: 350px;height:50px;overflow:auto;resize:none;" 
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150"><c:if test="${investigate.auditType eq 'szCheck'}">${investigate.evalueViews}</c:if></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
		
			<tr align="center" style="display: none;">
				<td colspan="2">
					<a id="auditCheckBtn1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">审核</a>
					<a id="auditCheckBtn2" class="easyui-linkbutton" icon="fi-x icon-red">关闭</a>
				</td>
			</tr>
		</table>
	</div>
	
	
	
</form>
<script type="text/javascript">
var type = 1;
var adtype = '${investigate.auditType}';

$(function() {
});

$('#auditCheckBtn1').click(function (){
	progressLoad();
	if ($('#investigateAuditCheckForm').form('validate')) {
		
		var adtypemsg = '';
		if(adtype == 'fzkCheck'){
			if ($('#zfScore').val() == '') {
				adtypemsg = "请对执法质量进行评分!";
			}
		}
		if(adtype == 'jzkCheck'){
			if ($('#optScore').val() == '') {
				adtypemsg = "请对输入质量进行评分!";
			}
			else if ($('#zfScore').val() == '') {
				adtypemsg = "请对执法质量进行评分!";
			}
		}
		if (adtypemsg.length > 0) {
			progressClose();
			$.messager.show({
				title : '提示信息!',
				msg : adtypemsg
			});
			return;
		}
		//var url = '${ctx}/investigate/investigateAudit?update=true&type='+type+'&id=${investigate.id}&dicEvalueViewKey='+ $('#dicEvalueViewKey').combobox('getValue')+'&situation='+$('#situation').val();
		//	url += '&auditType=${investigate.auditType}&taskId=${investigate.taskId}&evalueViews=' + $('#evalueViews').val();
		var url = '${ctx}/investigate/investigateAudit?update=true&type='+type;	//表单序列化失败
		$.ajax({
			type : 'post',
			url : url,
			data : $('#investigateAuditCheckForm').serialize(),	//表单序列化失败
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				var msg = '审核成功';
				if ('${investigate.auditType}' == 'szCheck') {
					msg = '上报成功';
				}
				$.messager.show({
					title : '提示信息',
					msg : msg
				});
				
				$('#t_list_examinationAndApproval').datagrid('reload');//待审批页面刷新
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
			    parent.$.modalDialog.handler.dialog('close');
				$('#investigateAuditCheck').dialog("close");
			},
			error : function(result) {
            	progressClose();
            	var msg = '审核失败';
				if ('${investigate.auditType}' == 'szCheck') {
					msg = '上报失败';
				}
            	$.messager.show({
					title : '提示信息',
					msg : '审核失败'
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#auditCheckBtn2').click(function (){
	$('#investigateAuditCheck').dialog("close");
});

$('#dicEvalueViewKey').combobox({
	onChange:function(){
		if ($('#dicEvalueViewKey').combobox('getValue') == '82001') {
			type = 1;
		}
		if ($('#dicEvalueViewKey').combobox('getValue') == '82002') {
			type = 2;
		}
	}
});

function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(),
			function(index) {
				if (obj[this['name']]) {
					obj[this['name']] = obj[this['name']] + ','
							+ this['value'];
				} else {
					obj[this['name']] = this['value'];
				}
			});
	return obj;
}

function rewardspunishment(type){
	var url = '${ctx}/sys/mxCheck/assess?tablename=investigaterewardspunishmentForm&infoType='+ type +'&taskId=${investigate.taskId}&auditType=${investigate.auditType}&processInstanceId=${investigate.processInstanceId}';
	var title = "评定明细";
	
	if (type == 1 || type == 4) {
		title = "输入质量" + title;
	}
	if (type == 2 || type == 3 || type == 5 || type == 6) {
		title = "执法质量" + title;
	}
	
	$('#investigaterewardspunishmentForm').dialog({    
	    title: title,    
        iconCls:'fi-page-edit icon-blue',
	    width: 600,
	    height: 550,
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'确定',
			iconCls:'fi-check icon-blue',
			handler:function(){
				$('#assessBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				//$('#assessBtn2').click();
				$('#investigaterewardspunishmentForm').dialog('close');
			}
		}]
	});
	$('#investigaterewardspunishmentForm').window('center');
}
</script>
</body>
</html>