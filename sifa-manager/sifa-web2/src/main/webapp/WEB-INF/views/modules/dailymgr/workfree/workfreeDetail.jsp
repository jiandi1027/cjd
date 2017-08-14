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
 <form  action="${ctx}/dailymgr/workfree/save" method="post" id="culpritInfo">

     <div class="easyui-panel" title="社区服务" style="width:100%;padding:10px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%">劳动内容：</th>
							<td width="23%">${workfree.workContent}</td>
							<th width="10%">劳动地点：</th>
							<td width="23%">${workfree.workPlace}</td>
					<th width="10%">劳动时间：</th>
							<td width="23%"><fmt:formatDate value="${workfree.workDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                
                <tr>
                    <th width="10%">工时：</th>
							<td width="23%">${workfree.taskTime}</td>
							<th width="10%">考核人：</th>
							<td width="23%">${workfree.assessManager}</td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">${workfree.note}</td>
                </tr>
                <tr>
            </table>
            </div>
            <div class="easyui-panel" title="矫正人员表现" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">优秀：</th>
							<td><c:forEach items="${workfree.excellentList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">良好：</th>
							<td><c:forEach items="${workfree.goodList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">一般：</th>
							<td><c:forEach items="${workfree.commonlyList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <th width="10%">差：</th>
							<td><c:forEach items="${workfree.differenceList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
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
