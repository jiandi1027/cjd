<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="askLeaveAuditForm" name="askLeaveAuditForm" action="${ctx}/dailymgr/askLeave/submitAskLeaveAudit" method="post">
	<input type="hidden"  name="taskId" value="${askLeave.taskId}"/>
	<input type="hidden" name="id" value="${askLeave.id}"/>
	<input type="hidden" name="auditType" value="${askLeave.auditType}"/>
	<input type="hidden" name="decideType" value="1"/>
	
	<div class="easyui-panel" title="请假信息"
		style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>申请日期：</th>
				<td width="23%"><input type="text" name="doDate" id="doDate"
					value="<fmt:formatDate value="${askLeave.doDate}"
									pattern="yyyy-MM-dd" />"
					required=true missingMessage="申请日期不能为空!"
					class="Wdate easyui-validatebox"
					onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
				<th width="10%"><span class="c-red">*</span>外出目的地：</th>
				<td width="23%"><input type="text" name="place" value="${askLeave.place }"
					required=true missingMessage="外出目的地不能为空!" class="f1 easyui-textbox" /></td>
				<th width="10%">经手人：</th>
				<td width="23%"><input type="text" name="approvePerson"
					value="${askLeave.approvePerson }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			</tr>
			<tr>
				<th>请假开始时间：</th>
				<td><fmt:formatDate value="${askLeave.beginDate }" pattern="yyyy-MM-dd" />
				</td>
				<th>请假截止时间：</th>
				<td><fmt:formatDate value="${askLeave.endDate }" pattern="yyyy-MM-dd" />
				</td>
				<th><span class="c-red">*</span>活动范围：</th>
				<td><input type="text" name="activeArea"
					value="${askLeave.activeArea }" required=true
					missingMessage="活动范围不能为空!" class="f1 easyui-textbox" /></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>请假理由：</th>
				<td colspan="5"><textArea id="reason" name="reason" class="easyui-validatebox" required=true missingMessage="请假理由不能为空!" 
					style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,100)' onKeyUp="textarealength(this,100)" maxlength="100">${askLeave.reason}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="被访问者基本信息" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被访问者姓名：</th>
				<td width="23%"><input type="text" name="askName"
					value="${askLeave.askName }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
				<th width="10%">与矫正人关系：</th>
				<td width="23%"><input type="text" name="relation"
					value="${askLeave.relation }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
				<th width="10%">职业及工作单位：</th>
				<td width="23%"><input type="text" name="job" id="job"
					value="${askLeave.job }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td><input type="text" name="dicPoliticStatusKey"
					class="f1 easyui-textbox easyui-validatebox"
					value="${askLeave.dicPoliticStatusKey }" /></td>
				<th>家庭住址：</th>
				<td colspan="3"><input type="text" name="askAddress"
					class="f1 easyui-textbox easyui-validatebox"
					value="${askLeave.askAddress}" /></td>
			</tr>
			
			<tr style="display:none;" >
				<td colspan="6" align="center">
					<a id="askLeaveWorkerReportBtn1" class="easyui-linkbutton" icon="fi-save icon-green">保存</a>
					<a id="askLeaveWorkerReportBtn2" class="easyui-linkbutton" icon="fi-checkbox icon-blue">上报</a>
					<a id="askLeaveWorkerReportBtn3" class="easyui-linkbutton" icon="fi-x icon-red">关闭</a>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="报到情况相关" style="width: 100%; padding: 5px;margin-bottom: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">请假材料：</th>
				<td width="90%">
					<div id="fileUpload"></div>
				</td>
			</tr>
			<tr>
				<th>已上传：</th>
				<td>
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
$('#askLeaveWorkerReportBtn1').click(function(){
	progressLoad();
	if ($('#askLeaveAuditForm').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/askLeave/save',
			data : $('#askLeaveAuditForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : result.msg
				});
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : result.msg
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

$('#askLeaveWorkerReportBtn2').click(function(){
	 $('#askLeaveAuditForm').form('submit');
});

$(function() {
	$("#fileUpload").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
	$('#askLeaveAuditForm').form({
		url:'${ctx}/dailymgr/askLeave/submitAskLeaveAudit',
		onSubmit:function(){
  			 progressLoad();
  			 var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid;
		},
		success:function(data){
            progressClose();
			data = JSON.parse(data);
			var msg = data.msg;
			if(data.status==200){
				if ('${askLeave.auditType}'=='workerReport') {
					msg = '上报成功';
				}
				$.messager.show({
					title:'提示信息!' ,
					msg:msg
				});
				
  				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			}else{
				if ('${askLeave.auditType}'=='workerReport') {
					msg = '上报失败';
				}
				$.messager.alert("提示信息",msg);
			}
		}
	});	
});


</script>
</body>
</html>