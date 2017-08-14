<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>期满解矫</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	<c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="期满解矫信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${finishRedress.id}"/>
            <table width="100%">
                <tr>
                   <td>矫正期间表现:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_REDRESS_SHOW_KEY',finishRedress.dicRedressShowKey,'')}</td>
					<td>认罪态度:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_PLEA_ATTITUDE_KEY',finishRedress.dicPleaAttitudeKey,'')}</td>
							<td>是否三无人员:</td>
							<td><c:if test="${finishRedress.dicSThreeNonKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSThreeNonKey==0}">否</c:if> </td>
                </tr>
                <tr>
							<td>是否参加职业技能培训:</td>
							<td> <c:if test="${finishRedress.dicIsTrainKey==1}">是</c:if>  　<c:if test="${finishRedress.dicIsTrainKey==0}">否</c:if></td>
					<td>是否获得技能证书:</td>
							<td><c:if test="${finishRedress.dicSkillsCertificateKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSkillsCertificateKey==0}">否</c:if> </td>
							<td>技术特长及等级:</td>
							<td>${finishRedress.skillInfo}</td>
                </tr>
				<tr>
                   <td>危险性评估:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','RISK_ID',finishRedress.riskId,'')}</td>
					<td>家庭联系情况:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','FAMILY_CONTACT_ID',finishRedress.familyContactId,'')}</td>
							<td></td>
							<td></td>
                </tr>
                <tr>
                    <td>特殊情况备注:</td>
                    <td colspan="5" align="left">${finishRedress.remark}</td>
                </tr>
            </table>
    </div>
    
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                   <td>操作人</td>
                   <td>操作时间</td>
                   <td>审批环节</td>
                   <td>意见</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.opinion }</td>
                 
                </tr>
                 </c:forEach>
                <tr>
                <td align="center" colspan="5">
                	<a id="btn2" class="easyui-linkbutton">关闭</a>
                </td>
                </tr>
            </table>
    </div>
    <script>
	$('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
