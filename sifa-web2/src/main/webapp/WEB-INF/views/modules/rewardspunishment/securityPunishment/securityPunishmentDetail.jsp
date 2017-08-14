<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="securityPunishmentDetailForm" name="securityPunishmentDetailForm" action="" method="post">
	<input type="hidden" id="id" name="id" value="${securityPunishment.id}" />
	<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
	<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
	<input type="hidden" name="dicDecideType" value="1"/>
		
     <sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="securityPunishmentReportForm" isSelect="false"/>
	
   
	 <div id="securityPunishmentPrint"></div>
     <div class="easyui-panel" title="治安管理处罚信息" style="width:100%;padding:5px;margin: 0 auto;">
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
               	<th>简要违纪情况:</th>
				<td><textArea id="detailInfo" name="detailInfo" readonly="readonly"
					style="width:80%;height:50px;overflow:auto;resize:none;">${securityPunishment.detailInfo}</textArea>
				</td>
               </tr>
               <tr>
               	<th>处理依据：</th>
				<td><textArea id="reason" name="reason" readonly="readonly" 
					style="width:80%;height:50px;overflow:auto;resize:none;">${securityPunishment.reason}</textArea>
				</td>
               </tr>
               <tr>
               	<td colspan="2" style="display: none;">
				    <a id="workerPrint1" class="easyui-linkbutton" >关闭</a>
				    <a id="workerPrint2" class="easyui-linkbutton" >结束流程</a>
				    <a id="workerPrint3" class="easyui-linkbutton" >打印治安管理处罚建议书</a>
				    <a id="workerPrint4" class="easyui-linkbutton" >打印提请治安管理处罚审核表</a>
               	</td>
               </tr>
               
           </table>
    </div>
    
    <div class="easyui-panel" title="流程信息" style="width:100%;padding:5px;margin: 0 auto;margin-bottom: 10px;">
           <table width="100%" class="grid" style="text-align: center;">
               <tr>
                  <th width="20%" style="text-align: center;">操作人</th>
                  <th width="20%" style="text-align: center;">操作时间</th>
                  <th width="20%" style="text-align: center;">操作环节</th>
                  <th width="20%" style="text-align: center;">意见</th>
                  <th width="20%" style="text-align: center;">备注</th>
               </tr>
               <c:forEach items="${processDetails}" var="processDetail">
               <tr>
                  <td>${processDetail.createrCnName }</td>
                  <td><fmt:formatDate value="${processDetail.created }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
                  <td>${processDetail.auditName }</td>
                  <td>
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
                  <td>${processDetail.opinion}</td>
               </tr>
               </c:forEach>
           </table>
    </div>
</form>
<script type="text/javascript">
$('#workerPrint1').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});

$('#workerPrint2').click(function (){
	$.messager.confirm('提示信息', '是否确定结束流程?', function(b) {
		if (b){
			$.ajax({
				type : 'post',
				url : '${ctx}/rewardspunishment/securityPunishment/securityPunishmentAudit',
				data : $('#securityPunishmentDetailForm').serialize(),
				dataType : 'json',
				success : function(result) {
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
		
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				    parent.$.modalDialog.handler.dialog('close');
				},
				error : function(result) {
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				}
			});
    	}
    });
});

$('#workerPrint4').click(function (){
	var url = '${ctx}/rewardspunishment/securityPunishment/printShenHe?id=${securityPunishment.id}';	
	$('#securityPunishmentPrint').dialog({
	    title: '打印提请治安管理处罚审核表',
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
				$('#securityPunishmentPrintBtn2').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#securityPunishmentPrintBtn3').click();
			}
		}]
	});
	$('#securityPunishmentPrint').window('center');
});

$('#workerPrint3').click(function (){
	var url = '${ctx}/rewardspunishment/securityPunishment/printJianYi?id=${securityPunishment.id}';
	$('#securityPunishmentPrint').dialog({
	    title: '打印治安管理处罚建议书',
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
				$('#securityPunishmentPrintBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#securityPunishmentPrintBtn3').click();
			}
		}]
	});
	$('#securityPunishmentPrint').window('center');
});
</script>
</body>
</html>
