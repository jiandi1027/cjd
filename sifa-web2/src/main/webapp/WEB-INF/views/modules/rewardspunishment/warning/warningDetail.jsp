<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="warningDetailForm" name="warningDetailForm" action="" method="post">
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${warning.culpritId}" formId="culpritInfo" isSelect="false"/>
	<div id="warningPrint"></div>
	<input type="hidden" name="id" value="${warning.id}"/>
	
	<div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;margin:0 auto;">
    <table width="100%" class="grid">
		<tr>
			<th width="10%">违纪原因：</th>
			<td colspan="5">${warning.dicReasonTypeKey} </td>
		</tr> 

		<tr>
			<th>处理依据：</th>
			<td colspan="5">
				<c:choose>
					<c:when test="${warning.legalBasis != null && warning.legalBasis != ''}">
						<c:choose>
							<c:when test="${warning.notePathName != null && warning.notePathName != ''}">
								1、${warning.legalBasis}<br>
								2、${warning.notePathName}
								<c:if test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
									<br>3、${warning.legalBasisItems}
								</c:if>
							</c:when>
							<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
								1、${warning.legalBasis}<br>
								2、${warning.legalBasisItems}
							</c:when>
							<c:otherwise>
								${warning.legalBasis}
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${warning.notePathName != null && warning.notePathName != ''}">
						<c:choose>
							<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
								1、${warning.notePathName}<br>
								2、${warning.legalBasisItems}
							</c:when>
							<c:otherwise>
								${warning.notePathName}
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
						${warning.legalBasisItems}
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<th >附件下载：</th>
			<td colspan="5">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
			</td>
		</tr>
				
		<tr>
			<th>主要事实：</th>
			<td colspan="5">${warning.fact }</td>
		</tr>
	</table>
    </div>
    
    <div class="easyui-panel" title="审批信息" style="width:100%;padding:5px;margin:0 auto;">
	<table width="100%" class="grid">
		<tr>
			<th style="text-align:center;" width="15%">操作人</th>
			<th style="text-align:center;" width="15%">操作时间</th>
			<th style="text-align:center;" width="15%">操作环节</th>
			<th style="text-align:center;" width="15%">审批结果</th>
			<th style="text-align:center;" width="40%">审批意见</th>
		</tr>
		<c:forEach items="${processDetails}" var="processDetail">
			<tr>
				<td style="text-align:center;">${processDetail.createrCnName }</td>
				<td style="text-align:center;"><fmt:formatDate value="${processDetail.created }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td style="text-align:center;">${processDetail.auditName }</td>
				<td style="text-align:center;">
             		<c:choose>
              			<c:when test="${processDetail.dicDecideType eq 1 }">同意</c:when>
              			<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
              			<c:when test="${processDetail.dicDecideType eq 3 }">同意</c:when>
              			<c:when test="${processDetail.dicDecideType eq 4 }">退回</c:when>
              			<c:when test="${processDetail.dicDecideType eq 0 }">不同意</c:when>
              		</c:choose>                   
                 </td>
				<td style="text-align:center;">${processDetail.opinion }</td>
			</tr>
		</c:forEach>
    </table>
    </div>
	<div style="text-align: center;display: none;">
	    <a id="workerPrint3" class="easyui-linkbutton" >打印社区服刑人员警告审批表</a>
	    <a id="workerPrint4" class="easyui-linkbutton" >打印违反社区矫正规定警告决定书</a>
	    <a id="workerPrint1" class="easyui-linkbutton" >关闭</a>
    </div>
   </form>
<script >

$('#workerPrint4').click(function (){
	var url = '${ctx}/rewardspunishment/warning/print?id=${warning.id}&type=1';
	$('#warningPrint').dialog({
	    title: '打印《社区服刑人员警告审批表》',
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
				$('#warningPrintBtn2').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#securityPunishmentPrintBtn3').click();
			}
		}]
	});
	$('#warningPrint').window('center');
});

$('#workerPrint3').click(function (){
	var url = '${ctx}/rewardspunishment/warning/print?id=${warning.id}&type=2';
	$('#warningPrint').dialog({
	    title: '打印《违反社区矫正规定警告决定书》',
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
				$('#warningPrintBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#securityPunishmentPrintBtn3').click();
			}
		}]
	});
	$('#warningPrint').window('center');
});
</script>
</html>
