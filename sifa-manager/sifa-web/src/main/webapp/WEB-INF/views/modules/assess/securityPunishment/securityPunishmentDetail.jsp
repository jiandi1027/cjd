<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提请治安管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>

 	<form id="myform" action="">
		<input type="hidden" id="id" name="id" value="${securityPunishment.id}" />
		<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
		<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
     <sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="myform" isSelect="false"/>
 	</form>
   
     <div class="easyui-panel" id="p2" title="治安管理处罚信息" style="width:100%;padding:10px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">违规违纪原因:</td>
					<td class=category  colspan="5" width="85%">
					${fns:getSysDicValueByKey('sf_security_punishment', 'reason_type_id', securityPunishment.reasonTypeId, '') }
					</td>
                </tr>
                <tr>
                	<td>
                	结案报告:
                	</td>
                	<td class=category></td>
                </tr>
                <tr>
                	<td>
                	证据材料:
                	</td>
					<td class=category></td>
                </tr>
                <tr>
                	<td>
                	简要违纪情况:
                	</td>
                	<td class=category>
                	${securityPunishment.detailInfo}
                	</td>
                </tr>
                <tr>
                	<td>
                	处理依据:
                	</td>
                	<td class=category>
                	${securityPunishment.reason}
                	</td>
                </tr>
            </table>
    </div>
    
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                   <td width="20%">操作人</td>
                   <td width="20%">操作时间</td>
                   <td width="20%">审批环节</td>
                   <td width="20%">意见</td>
                   <td width="20%">备注</td>
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
    <div style="text-align: center;">
    <c:if test="${sysAccount.roleId == '2007' && securityPunishment.auditType == 'workerPrint'}">
    <a href="#" class="easyui-linkbutton" onclick="doPrint()">打印</a>
    </c:if>
    <a href="#" class="easyui-linkbutton" onclick="doClose()">关闭</a>
    </diV>


<script type="text/javascript">
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}


function doPrint(){
	$.ajax({
		type : 'post',
		url : '${ctx}/jiangcheng/securityPunishment/securityPunishmentAudit',
		data : $('#myform').serialize(),
		dataType : 'json',
		success : function(result) {
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});

			doClose();
		},
		error : function(result) {
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});
		}
	});
	
}

</script>
</body>
</html>
