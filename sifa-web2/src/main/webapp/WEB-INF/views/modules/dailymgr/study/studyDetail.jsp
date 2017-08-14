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

     <div class="easyui-panel" title="学习教育" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%">学习内容：</th>
							<td width="23%">${study.studyContent}</td>
							<th width="10%">学习方式：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_STUDY','DIC_STUDY_TYPE_KEY',study.dicStudyTypeKey,'')}</td>
					<th width="10%">学习时间：</th>
							<td width="23%"><fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                
                <tr>
                    <th width="10%">学习时长：</th>
							<td width="23%">${study.studyTime}</td>
							<th width="10%">考核人：</th>
							<td width="23%">${study.assessManager}</td>
					<td></td><td></td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">${study.note}</td>
                </tr>
                <tr>
            </table>
            </div>
            <div class="easyui-panel" title="矫正人员表现" style="width:100%;padding:10px;">
            <table width="100%" class="grid">
             	
                <tr>
                    <th width="10%">优秀：</th>
							<td><c:forEach items="${study.excellentList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">良好：</th>
							<td><c:forEach items="${study.goodList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">一般：</th>
							<td><c:forEach items="${study.commonlyList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">差：</th>
							<td><c:forEach items="${study.differenceList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
            </table>
    </div>
    </form>

</body>
</html>
