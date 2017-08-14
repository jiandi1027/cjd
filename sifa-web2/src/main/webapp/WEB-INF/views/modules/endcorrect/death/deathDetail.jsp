<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="#" method="post" id="deathDeatilFrom">
	<input type="hidden" name="id" id="id" value="${death.id}"/>
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${death.culpritId}" formId="deathDeatilFrom" isSelect="false"/>
	
	
	
<div id="death_printoneDialog"></div>
<div id="death_printtwoDialog"></div>

	<a style="display:none"id="death_printone" onclick="death_printone('${death.id}')"><strong>打印社区服刑人员死亡通知书</strong></a>
	<a style="display:none"id="death_printtwo" onclick="death_printtwo('${death.id}')"><strong>打印舍弃服刑人员死亡登记表</strong></a>
	
	
	<div class="easyui-panel" title="死亡登记信息" style="width:100%;padding:5px;margin: 0 auto;">
    	<table width="100%" class="grid">
			<tr>
				<th width="10%">死亡日期：</th>
				<td width="90%"><fmt:formatDate value='${death.deathlTime}' pattern="yyyy-MM-dd" /></td>
                </tr>
            <tr>
                <th>死亡原因：</th>
				<td><textArea id="deathReason" name="deathReason" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;">${death.deathReason }</textArea>
				</td>
            </tr>
            <tr>
                <th>其他情况：</th>
				<td><textArea id="situation" name="situation" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;">${death.situation }</textArea>
				</td>
            </tr>
            <tr>
                <th>相关附件：</th>
				<td>
					<div id="wtdchUploadIng">
					<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</div>
				</td>
            </tr>
		</table>
    </div>
	<div class="easyui-panel" title="流程信息" style="width: 100%; padding: 5px;margin: 0 auto;margin-bottom: 5px;">
		<table width="100%" class="grid" style="text-align: center;">
			<tr>
				<th style="text-align: center;" >操作人</th>
				<th style="text-align: center;" >操作时间</th>
				<th style="text-align: center;" >操作环节</th>
				<th style="text-align: center;" >意见</th>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
				<tr>
					<td>${processDetail.createrCnName }</td>
					<td><fmt:formatDate value="${processDetail.created }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${processDetail.auditName }</td>
					<c:if test="${processDetail.dicDecideType==1 }" >
						<td>同意</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==2 }" >
						<td>退回</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==0 }" >
						<td>不同意</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
<script>
function death_printone(id)
{
	var width=sy.getBrowerWidth()-250;
    var height=sy.getBrowerHeight()-150;
	if(width>1100)
	{
		 var width=1100;
	}
	if(height>830)
	{
		 var height=830;
	}
     
	$('#death_printoneDialog').dialog(
	{
		title : '打印《社区服刑人员死亡通知书》',
		iconCls : 'fi-print icon-blue',
		width : width,
		height : height,
		href : '${ctx}/endcorrect/death/printone?id=' + id,
		modal : true,
		resizable : true,
		maximizable : true,
		buttons :
		[
		{
			text : '打印社区服刑人员死亡通知书',
			iconCls : 'fi-print icon-blue',
			handler : function()
			{
				$('#deathPrintBtn1').click();
			}
		},
		{
			text : '关闭',
			iconCls : 'fi-x icon-blue',
			handler : function()
			{
			
				$('#death_printoneDialog').dialog('close');
			}
		} ]
	});
		$('#death_printoneDialog').window('center');
}

 function death_printtwo(id)
{
		var width=sy.getBrowerWidth()-250;
	    var height=sy.getBrowerHeight()-150;
		if(width>800)
		{
			 var width=800;
		}
		if(height>750)
		{
			 var height=750;
		}
	$('#death_printtwoDialog').dialog(
	{
		title : '打印《社区矫正人员死亡登记表》',
		iconCls : 'fi-print icon-blue',
		width : width,
		height : height,
		href : '${ctx}/endcorrect/death/printtwo?id=' + id,
		modal : true,
		resizable : true,
		maximizable : true,
		buttons :
		[
		{
			text : '打印社区服刑人员死亡登记表',
			iconCls : 'fi-print icon-blue',
			handler : function()
			{
				$('#deathPrintBtn1').click();
			}
		},
		{
			text : '关闭',
			iconCls : 'fi-x icon-blue',
			handler : function()
			{
			
				$('#death_printtwoDialog').dialog('close');
			}
		} ]
	});
	
		$('#death_printtwoDialog').window('center');
} 
</script>