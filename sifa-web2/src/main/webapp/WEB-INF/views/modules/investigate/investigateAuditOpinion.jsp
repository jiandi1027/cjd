<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/investigateAudit" method="post" id="investigateAuditOpinionForm">
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" style="width:100%;">
		<table width="100%" class="grid">
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
				<td align="center" >
				<textArea id="situation" name="situation" class="easyui-validatebox" style="width: 90%;height:300px;overflow:auto;resize:none;text-align: left;" 
					onkeydown='textarealength(this,500)' onKeyUp="textarealength(this,500)" maxlength="500">${investigate.situation}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">500</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			<tr>
				<td>综合以上情况:</td>
			</tr>
			<tr>
				<td><span class="c-red">*</span>评估意见为：
				<input id="dicEvalueViewKey" name="dicEvalueViewKey" class="easyui-combobox" required=true missingMessage="评估意见不能为空!" style="width:173px;" 
					value="${investigate.dicEvalueViewKey}" data-options="valueField:'id',textField:'value', limitToList:'true',
	 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=dic_evalue_view_key&parentKey=82000',panelHeight:'auto'">
				</td>
			</tr>
			
			<tr align="center" style="display: none;">
				<td>
					<a id="auditOpinionBtn1" class="easyui-linkbutton" icon="fi-save icon-green">保存</a>
					<a id="auditOpinionBtn2" class="easyui-linkbutton" icon="fi-checkbox icon-blue">上报</a>
					<a id="auditOpinionBtn3" class="easyui-linkbutton" icon="fi-x icon-red">关闭</a>
				</td>
			</tr>
			
		</table>
    </div>
    
</form>
<script type="text/javascript">
var type = 1;

$(function() {
});


$('#auditOpinionBtn1').click(function (){
	progressLoad();
	if ($('#investigateAuditOpinionForm').form('validate')) {
		var url = '${ctx}/investigate/investigateAudit?update=true';
		$.ajax({
			type : 'post',
			url : url,
			data : $('#investigateAuditOpinionForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '保存成功'
				});
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '保存失败'
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

$('#auditOpinionBtn2').click(function (){
	progressLoad();
	if ($('#investigateAuditOpinionForm').form('validate')) {
		var url = '${ctx}/investigate/investigateAudit?update=true&type=' + type;
		$.ajax({
			type : 'post',
			url : url,
			data : $('#investigateAuditOpinionForm').serialize(),
			dataType : 'json',
	        async: false, 
			success : function(result) {
		    	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '上报成功'
				});

				$('#investigateAuditOpinion').dialog("close");
				
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
			    parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
		    	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '上报失败'
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能上报!'
		});
	}
});

$('#auditOpinionBtn3').click(function (){
	$('#investigateAuditOpinion').dialog("close");
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

</script>
</body>
</html>