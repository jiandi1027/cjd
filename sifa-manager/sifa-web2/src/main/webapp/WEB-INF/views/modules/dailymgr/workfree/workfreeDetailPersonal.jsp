<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>社区服务</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
<body>
 <form>
	<c:choose>
 		<c:when test="${empty workfree.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${workfree.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="社区服务" style="width:100%;padding:10px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%">劳动内容:</th>
							<td width="23%">${workfree.workContent}</td>
							<th width="10%">劳动地点:</th>
							<td width="23%">${workfree.workPlace}</td>
					<th width="10%">劳动时间:</th>
							<td width="23%"><fmt:formatDate value="${workfree.workDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                
                <tr>
                    <th width="10%">工时:</th>
							<td width="23%">${workfree.taskTime}</td>
							<th width="10%">考核人:</th>
							<td width="23%">${workfree.assessManager}</td>
					<th width="10%">人员表现：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_STUDY_CULPRIT','STATUS_ID',workfree.statusId,'')}
							</td>
                </tr>
                <tr>
                    <th width="10%">备注:</th>
                    <td colspan="5" align="left">${workfree.note}</td>
                </tr>
                <tr>
            </table>
            </div>
    </form>
    <script>
    $('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
