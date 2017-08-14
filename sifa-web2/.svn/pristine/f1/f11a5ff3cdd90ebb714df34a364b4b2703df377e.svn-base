<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="askLeaveAuditForm" name="askLeaveAuditForm" action="${ctx}/dailymgr/askLeave/submitAskLeaveAudit" method="post">
	<input type="hidden"  name="taskId" value="${askLeave.taskId}"/>
	<input type="hidden" name="id" value="${askLeave.id}"/>
	<input type="hidden" name="auditType" value="${askLeave.auditType}"/>
	
	<div class="easyui-panel" title="请假基本信息" style="width:100%; padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">申请日期：</th>
				<td width="23%"><fmt:formatDate value="${askLeave.doDate}" pattern="yyyy-MM-dd" />
				</td>
				<th width="10%" >外出目的地：</th>
				<td width="23%">${askLeave.place }</td>
				<th width="10%" >经手人：</th>
				<td width="23%">${askLeave.creater }</td>
			</tr>
								
			<tr>
				<th width="10%">请假开始日期：</th>
				<td width="23%"><fmt:formatDate value="${askLeave.beginDate}" pattern="yyyy-MM-dd" />
				</td>
				<th width="10%">请假截至日期：</th>
				<td width="23%"><fmt:formatDate value="${askLeave.endDate}" pattern="yyyy-MM-dd" />
				</td>
				<th width="10%" >活动范围：</th>
				<td width="23%">${askLeave.activeArea }</td>
			</tr>
			<tr>
				<th width="10%">请假事由：</th>
				<td colspan="5"><textArea id="reason" name="reason" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,100)' onKeyUp="textarealength(this,100)" maxlength="100">${askLeave.reason}</textArea>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="被访问者基本信息" style="width:100%; padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被访问者姓名：</th>
				<td width="23%">${askLeave.askName}</td>
				<th width="10%">与矫正人员关系：</th>
				<td width="23%">${askLeave.relation }</td>
				<th width="10%" >职业及工作单位：</th>
				<td width="23%">${askLeave.job }</td>
			</tr>
			
			<tr>
				<th width="10%" >政治面貌：</th>
				<td width="23%">${askLeave.dicPoliticStatusKey }
				</td>
				<th width="10%">被访问者家庭住址：</th>
				<td colspan="3">${askLeave.askAddress }
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="报到情况相关" style="width: 100%; padding: 5px;margin-bottom: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">请假材料：</th>
				<td width="90%">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}">
							${sysFile.originName}<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<c:choose>
	<c:when test="${askLeave.auditType eq 'workerPrint' }">
	<div class="easyui-panel" title="审核信息" style="width:100%; padding:5px;margin:0 auto;margin-bottom: 5px;">
		<table width="100%" class="grid">
   			<tr>
				<th width="10%">审核结果：</th>
				<td width="90%">
					<input type="radio" name="decideType" value="1" checked="checked"/>结束流程
				</td>
			</tr>
		</table>
	</div>
	</c:when>
	<c:otherwise>
	<div class="easyui-panel" title="审核信息" style="width:100%; padding:5px;margin:0 auto;margin-bottom: 5px;">
		<table width="100%" class="grid">
   			<tr>
				<th width="10%">审核结果：</th>
				<td width="90%">
				<input type="radio" name="decideType" value="1" checked="checked"/>同意
				<input type="radio" name="decideType" value="0"/>不同意
				<input type="radio" name="decideType" value="2" />退回
				</td>
			</tr>
			<tr>
				<th width="10%">审核意见：</th>
				<td width="90%">
				<textArea id="opinion" name="opinion" class="easyui-validatebox" style="width:80%;height:50px;overflow:auto;resize:none;" 
				onkeydown='textarealength(this,150)' onKeyUp='textarealength(this,150)' onMouseOut='textarealength(this,150)' maxlength="150"></textArea><br>
				<p class="textarea-numberbar">
					备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</p>
				</td>
			</tr>
		</table>
	</div>
	</c:otherwise>
	</c:choose>
</form>
<script type="text/javascript">
function doAudit(){
	 $('#askLeaveAuditForm').form('submit');
}

$(function() {
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
			msg = data.msg;
			if(data.status==200){
				if ('${askLeave.auditType}' == 'workerPrint') {
					msg = '流程结束';
				}
				$.messager.show({
					title:'提示信息!' ,
					msg:msg
				});
				
  				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			}else{
				if ('${askLeave.auditType}' == 'workerPrint') {
					msg = '流程结束失败';
				}
				
				$.messager.alert('提示信息!', msg);
			}
		}
	});	
});
</script>
</body>
</html>