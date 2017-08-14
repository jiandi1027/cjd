<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/dailymgr/askLeave/detail" method="post" id="askLeaveDetailForm">

	<div id="askLeavePrint"></div>
	<c:choose>
		<c:when test="${empty askLeave.culpritId }">
	
			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="true" hiddenValue=""
				formId="culpritInfo" isSelect="true" />
		</c:when>
		<c:otherwise>
	
			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="false"
				hiddenValue="${askLeave.culpritId}" formId="culpritInfo"
				isSelect="false" />
		</c:otherwise>
	</c:choose>
	
	<div class="easyui-panel" id="p2" title="请假信息" style="width: 100%; padding: 5px; margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">申请日期：</th>
				<td width="23%"><fmt:formatDate value="${askLeave.doDate}"
						pattern="yyyy-MM-dd" /></td>
				<th width="10%">外出目的地：</th>
				<td width="23%">${askLeave.place }</td>
				<th width="10%">经手人：</th>
				<td width="23%">${askLeave.approvePerson }</td>
			</tr>
			<tr>
				<th>请假开始时间：</th>
				<td><fmt:formatDate value="${askLeave.beginDate }"
						pattern="yyyy-MM-dd" /></td>
				<th>请假截止时间：</th>
				<td><fmt:formatDate value="${askLeave.endDate }"
						pattern="yyyy-MM-dd" /></td>
				<th>活动范围：</th>
				<td>${askLeave.activeArea }</td>
			</tr>
			<tr>
				<th>请假理由：</th>
				<td colspan="5"><textArea id="reason" name="reason" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,100)' onKeyUp="textarealength(this,100)" maxlength="100">${askLeave.reason}</textArea>
				</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="被访问者基本信息" style="width: 100%; padding: 5px; margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被访问者姓名：</th>
				<td width="23%">${askLeave.askName }</td>
				<th width="10%">与矫正人关系：</th>
				<td width="23%">${askLeave.relation }</td>
				<th width="10%">职业及单位：</th>
				<td width="23%">${askLeave.job }</td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td>${askLeave.dicPoliticStatusKey }</td>
				<th>家庭住址：</th>
				<td colspan="3">${askLeave.askAddress }</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="报到情况相关" style="width: 100%; padding: 5px; margin: 0 auto;">
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
	
	<div id="pOrder" class="easyui-panel" title="流程详情" style="width: 100%; padding: 5px; margin: 0 auto;margin-bottom: 5px;">
		<table class="easyui-datagrid" style="width: auto; min-height: 100px;"
			data-options="singleSelect:true,rownumbers:true,method:'get',url:'${ctx}/flow/processDetail/instanceDetail?processId=${askLeave.processInstanceId}'"
			fitcolumns="true" striped="true">
			<thead>
				<tr>
					<th data-options="field:'createrCnName',align:'center',width:70">操作人</th>
					<th data-options="field:'created',align:'center',width:150">操作时间</th>
					<th data-options="field:'auditName',align:'center',width:100">操作环节</th>
					<th data-options="field:'dicDecideType',width:100,align:'center',formatter:function(value,rowData,rowIndex){    
					    if(typeof(rowData.dicDecideType) != 'undefined' && rowData.dicDecideType!=''){
					    	 return sy.getDicValue('common_table','audit_result',rowData.dicDecideType,''); 
					    }
					}">意见
					</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div style="text-align: center;display: none;">
		<a id="askLeaveWorkerPrint1" class="easyui-linkbutton" >打印社区服刑人员外出证明</a>
	</div>

</form>
<script type="text/javascript">
$('#askLeaveWorkerPrint1').click(function (){
	var url = '${ctx}/dailymgr/askLeave/printwczm?id=${askLeave.id}&processInstanceId=${askLeave.processInstanceId}';
	$('#askLeavePrint').dialog({
	    title: '打印社区服刑人员外出证明',
        iconCls:'fi-print icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#askLeavePrintBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#askLeavePrint').dialog('close');
			}
		}]
	});
	$('#askLeavePrint').window('center');
});
</script>

