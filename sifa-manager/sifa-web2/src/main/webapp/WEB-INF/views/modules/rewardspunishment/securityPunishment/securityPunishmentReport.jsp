<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="securityPunishmentReportForm" name="securityPunishmentReportForm" action="" method="post">
	<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
	<input type="hidden" name="id" value="${securityPunishment.id}"/>
	<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
	
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="securityPunishmentReportForm" isSelect="false"/>
	
	<div class="easyui-panel" title="治安管理处罚相关信息" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="10%">违规违纪原因：</th>
				<td width="90%">${fns:getSysDicValueByKey('sf_security_punishment','reason_type_id',securityPunishment.reasonTypeId,'') }</td>
	        </tr>
			
			<tr>
            	<th>结案报告：</th>
            	<td>
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList1}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
            </tr>
            <tr>
            	<th>证据材料：</th>
				<td>
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList2}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
            </tr>
            <tr>
            	<th>简要违纪情况：</th>
				<td><textArea id="detailInfo" name="detailInfo" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${securityPunishment.detailInfo}</textArea>
				</td>
            </tr>
            <tr>
            	<th>处理依据：</th>
				<td><textArea id="reason" name="reason" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${securityPunishment.reason}</textArea>
				</td>
            </tr>
            
            <tr>
			  	<td align=center style="display: none;" colspan="2">
					<a id="checkBtn1" class="easyui-linkbutton" iconCls="icon-annex" href="#">审核</a>
					<a id="checkBtn2" class="easyui-linkbutton" iconCls="icon-cancel" href="#">关闭</a>
			 	</td>
			</tr>
		</table>
    </div>
    <div id="securityPunishmentReportCheck"></div>
</form>
<script type="text/javascript">
$('#checkBtn1').click(function (){
	var url = '${ctx}/rewardspunishment/securityPunishment/securityPunishmentReportCheck?id=${securityPunishment.id}&taskId=${securityPunishment.taskId}&auditType=${securityPunishment.auditType}';
	$('#securityPunishmentReportCheck').dialog({
	    title: '审核',
        iconCls:'fi-clipboard-pencil icon-blue',
	    width: 600,
	    height: 550,
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'审核',
			iconCls:'fi-check icon-blue',
			handler:function(){
				$('#auditCheckBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#auditCheckBtn2').click();
			}
		}]
	});
	$('#securityPunishmentReportCheck').window('center');
});

$('#checkBtn2').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	parent.$.modalDialog.handler.dialog('close');
});

</script>
</body>
</html>