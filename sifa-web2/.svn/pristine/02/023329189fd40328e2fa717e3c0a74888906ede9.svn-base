<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/stopProcess" method="post" id="investigateStopProcessForm">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" style="width:99%;margin-bottom: 10px;">
		<table width="100%" class="grid">
			<tr>
				<th width="30%"><span class="c-red">*</span>终止原因：</th>
				<td width="70%">
					<input id="zzyy" name="zzyy" class="f1 easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',
		 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=sqdc_zzyy&parentKey=124000',panelMaxHeight:'200',panelHeight:'auto'" 
		 				required=true >
				</td>
			</tr>
			
			<tr>
				<th width="30%">具体原因：</th>
				<td width="70%"><textArea id="opion" name="opion" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
					<input type="hidden" value="" name="evalueViews" id="evalueViews">
				</td>
			</tr>
			
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="investigateStopBtn1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">提交</a>
					<a id="investigateStopBtn2" class="easyui-linkbutton" icon="fi-checkbox icon-blue">关闭</a>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
var type = 9;
var evalueViews = "";
$('#investigateStopBtn1').click(function(){
	progressLoad();
	
	if ($('#investigateStopProcessForm').form('validate')) {
		var zzyy = $('#zzyy').combobox('getValue');
		var opion = $('#opion').val();
		if (zzyy == '124004' && (opion == null || opion.trim() == '')) {
			$.messager.show({
				title : '提示信息!',
				msg : '你选择了其他，请填写具体原因!'
			});
    		progressClose();
    		return false;
		}

		if (zzyy == '124004') {
			evalueViews = evalueViews + opion + "";
		}
		$('#evalueViews').val(evalueViews);

		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?type='+type,
			data : $('#investigateStopProcessForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
            	
				$.messager.show({
					title : '提示信息',
					msg : '终止成功'
				});

				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
			    parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '终止失败'
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

$('#investigateStopBtn2').click(function(){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});

$('#zzyy').combobox({
	onChange:function(){
		if ($('#zzyy').combobox('getValue') == '124003') {
			type = 2;
		}
		else type = 9;
		
		if ($('#zzyy').combobox('getValue') == '124004') {
			evalueViews = "";
		}
		else evalueViews = $('#zzyy').combobox('getText');
	}
});
</script>