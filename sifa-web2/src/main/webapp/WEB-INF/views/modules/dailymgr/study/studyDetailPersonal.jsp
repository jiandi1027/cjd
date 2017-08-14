<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学习教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
<body>
 <form  action="${ctx}/dailymgr/study/save" method="post" id="culpritInfo">
	<c:choose>
 		<c:when test="${empty study.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${study.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="学习教育" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%">学习内容:</th>
							<td width="23%">${study.studyContent}</td>
							<th width="10%">学习方式:</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_STUDY','DIC_STUDY_TYPE_KEY',study.dicStudyTypeKey,'')}</td>
					<th width="10%">学习时间:</th>
							<td width="23%"><fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                
                <tr>
                    <th width="10%">学习时长:</th>
							<td width="23%">${study.studyTime}</td>
							<th width="10%">考核人:</th>
							<td width="23%">${study.assessManager}</td>
					<th width="10%">人员表现：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_STUDY_CULPRIT','STATUS_ID',study.statusId,'')}
							</td>
                </tr>
                <tr>
                    <th width="10%">备注:</th>
                    <td colspan="5" align="left">${study.note}</td>
                </tr>
                <tr>
            </table>
            </div>
    </form>

</body>
</html>
