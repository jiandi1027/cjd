<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<style type="text/css">
 .texts{text-decoration:underline;}
</style>
<title>集中点验详情</title>
</head>
<body>
 <form  action="${ctx}/dailymgr/inspection/save" method="post" id="culpritInfo" name="culpritInfo">
       <table border=0 cellSpacing=0 cellPadding=0 width="60%" align="center" bgColor=#c4d8ed>
			<tbody>
	   			<tr>
					<td background="${ctxStatic}/images/r_0.gif" width="100%">
						<table cellSpacing=0 cellPadding=0 width="100%">
						<tbody>
							<TR>
								<td>&nbsp;集中点验相关信息</td>
								<td align=right>&nbsp;</td>
							</TR>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 align="center">
						<tbody>
							<tr>
								<td width="20%" align="right">
									被抽查部门：
								</td>
								<td colspan="3">
								<input id="groupsStr" name="groupsStr" class="easyui-textbox" multiple="multiple" value="${inspection.groupsStr }" readonly="readonly" style="height: 50px;width: 80%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td width="20%" align="right">
									抽查开始时间：
								</td>
								<td width="30%">
								<input id="checkStartTime" name="checkStartTime" class="easyui-textbox" editable="false" 
								value="<fmt:formatDate value='${inspection.checkStartTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
								</td>
								<td width="20%" align="right">
									抽查结束时间：
								</td>
								<td width="30%">
								<input id="checkEndTime" name="checkEndTime" class="easyui-textbox" editable="false" 
								value="<fmt:formatDate value='${inspection.checkEndTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">
									抽查部门：
								</td>
								<td>
								<input id="sysGroup.name" name="sysGroup.name" class="easyui-textbox" value="${inspection.sysGroup.name }" readonly="readonly" style="width: 70%;"/>&nbsp;
								</td>
								<td align="right">
									应到人数：
								</td>
								<td>
								<input id="amount" name="amount" class="easyui-textbox" value="${empty inspection.amount? '0':inspection.amount }" readonly="readonly" style="width: 70%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">
									实到人数：
								</td>
								<td>
								<input id="realCount" name="realCount" class="easyui-textbox" value="${empty inspection.realCount? '0':inspection.realCount }" readonly="readonly" style="width: 70%;"/>&nbsp;
								</td>
								<td align="right">
									迟到人数：
								</td>
								<td>
								<input id="lateCount" name="lateCount" class="easyui-textbox" value="${empty inspection.lateCount? '0':inspection.lateCount }" readonly="readonly" style="width: 70%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">
									未到人数：
								</td>
								<td>
								<input id="disCount" name="disCount" class="easyui-textbox" value="${empty inspection.disCount? '0':inspection.disCount}" readonly="readonly" style="width: 70%;"/>&nbsp;
								</td>
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
				
				<tr>
					<td background="${ctxStatic}/images/r_0.gif" width="100%">
						<table cellSpacing=0 cellPadding=0 width="100%">
						<tbody>
							<TR>
								<td>&nbsp;被抽查人员相关信息</td>
								<td align=right>&nbsp;</td>
							</TR>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="easyui-datagrid" id="t_list_content" title="被抽查人员相关信息列表"
							style="height: 400px;" 
							data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
							pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/inspectionDeal/list?inspectionId=${inspection.id }',method:'post'">
							<thead>
								<tr>
									<th data-options="field:'culpritName',width:'20%',align:'center'" editor="text">矫正对象</th>
									<th data-options="field:'groupName',width:'30%',align:'center'" editor="text">所属司法所</th>
									<th data-options="field:'dicCheckStatusKey',width:'20%',align:'center',formatter:function(value,rowDate,rowIndex){
									if(rowDate.dicCheckStatusKey !=null){
										return sy.getDicValue('sf_inspection_deal','dic_Check_Status_Key',rowDate.dicCheckStatusKey,'未抽查');
									}
									else return '未抽查';
									}" editor="text">点验结果</th>
								</tr>
							</thead>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<a id="btn2" class="easyui-linkbutton">返回</a>
					</td>
				</tr>
			</tbody>
			</table>
</form>
<script>
    
    function doClose(){
    	parent.location.reload(); // 父页面刷新
    	var index = parent.layer.getFrameIndex(window.name);
    	parent.layer.close(index);
    }

    $('#btn2').click(function (){
    	doClose();
    });
    
</script>
</body>
</html>
