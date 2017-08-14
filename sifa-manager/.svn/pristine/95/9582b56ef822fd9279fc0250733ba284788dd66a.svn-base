<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<title>流程定义列表</title>
<script type="text/javascript">
    
    function deleteDeployment(id){
    	if(window.confirm("您确认删除该流程定义吗？")){
    		window.location="${ctx}/flow/deleteProcessDefinition?processDefinitionId="+id;
    	}
    }
    
    
    
</script>

</head>
<body >

	  <table class="toptable grid">
        <thead>
            <tr>
              <th data-options="width:80">流程部署id</th>
					<th data-options="width:80">流程定义id</th>
					<th data-options="width:80">流程定义名称</th>
					<th data-options="width:80">流程定义key</th>
					<th data-options="width:80">流程定义版本</th>
					<th data-options="width:80">bpmn</th>
					<th data-options="width:80">图片</th>
					<th data-options="width:80">删除流程</th>
            </tr>
        </thead>
        <c:forEach items="${list}" var="processDefinition">
					<tr>
						<td class=category>${processDefinition.deploymentId}</td>
						<td class=category>${processDefinition.id}</td>
						<td class=category>${processDefinition.name}</td>
						<td class=category>${processDefinition.key}</td>
						<td class=category>${processDefinition.version}</td>
						<td class=category><a href="${ctx}/flow/queryProcessDefinitionResource?processDefinitionId=${processDefinition.id}&resourceType=bpmn" target="_blank">查看bpmn</a></td>
						<td class=category><a href="${ctx}/flow/queryProcessDefinitionResource?processDefinitionId=${processDefinition.id}&resourceType=png" target="_blank">查看图片</a></td>
						<td class=category><a href=javascript:deleteDeployment('${processDefinition.id}') >删除流程</a></td>
					</tr>
				</c:forEach>
    </table>
	
<script type="text/javascript">


</script>
</body>
</html>