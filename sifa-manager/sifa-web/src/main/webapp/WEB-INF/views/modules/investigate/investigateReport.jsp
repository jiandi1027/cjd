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
</style>
<title>审前调查审核</title>
</head>
<body>
<form id="submitReportForm" name="submitReportForm" action="" method="post">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   		<TBODY>
   			<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;被调查人员基本信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4 align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								<input id="name" name="name" class="easyui-validatebox" value="${investigate.name}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >性别：</TD>
								<TD class=category width="23%">
								<input id="dicSexKeyName" name="dicSexKeyName" class="easyui-validatebox" value="${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }" readonly="readonly"/>
								<input type="hidden" id="dicSexKey" name="dicSexKey" class="easyui-validatebox" value="${investigate.dicSexKey}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >民族：</TD>
								<TD class=category >
								<input name="nation" class="easyui-validatebox" value="${investigate.nation}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >曾用名：</TD>
								<TD class=category width="23%">
								<input name="oldName" class="easyui-validatebox" value="${investigate.oldName}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >别名：</TD>
								<TD class=category width="23%">
								<input name="alias" class="easyui-validatebox" value="${investigate.alias}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >相关证件号：</TD>
								<TD class=category >
								<input id="relevantNumber" name="relevantNumber" class="easyui-validatebox" value="${investigate.relevantNumber}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >出生日期：</TD>
								<TD class=category width="23%">
								<input id="bornDate" name="bornDate" class="easyui-validatebox" value="<fmt:formatDate value='${investigate.bornDate}' pattern="yyyy-MM-dd" />" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >籍贯：</TD>
								<TD class=category width="23%">
								<input name="origin" class="easyui-validatebox" value="${investigate.origin}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >家庭住址：</TD>
								<TD class=category >
								<input name="address" class="easyui-validatebox" value="${investigate.address}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >联系方式：</TD>
								<TD class=category width="23%">
								<input name="contactPhone" class="easyui-validatebox" value="${investigate.contactPhone}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >案由：</TD>
								<TD class=category width="23%">
								<input id="crimeReason" name="crimeReason" class="easyui-validatebox" value="${investigate.crimeReason}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >经常居住地：</TD>
								<TD class=category >
								<input id="habitualResidence" name="habitualResidence" class="easyui-validatebox" value="${investigate.habitualResidence}" readonly="readonly"/>
								
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >职业：</TD>
								<TD class=category width="23%">
								<input name="job" class="easyui-validatebox" value="${investigate.job}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >拟提请类型：</TD>
								<TD class=category width="23%">
								<input id="entrustTypeIdName" name="entrustTypeIdName" class="easyui-validatebox" 
								value="${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', investigate.entrustTypeId, '') }" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >户籍类型：</TD>
								<TD class=category >
								<input id=""dicResudenceKeyName"" name="dicResudenceKeyName" class="easyui-validatebox" 
								value="${fns:getSysDicValueByKey('common_table', 'hklx', investigate.dicResudenceKey, '') }" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >附件下载：</TD>
								<TD class=category colspan="5">
									无附件
								</TD>
							</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   		<TBODY>
   			<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;调查人员基本信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								<input id="investigator1" name="investigator1" class="easyui-validatebox" value="${investigate.investigator1}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position1" name="position1" class="easyui-validatebox" value="${investigate.position1}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<c:choose>
								<c:when test="${investigate.investigatorId2 == '' || investigate.investigatorId2 == null}">
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								<input id="investigatorId2" name="investigatorId2" class="easyui-combobox" 
								url="${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003" valueField="id" textField="name" value="" readonly="readonly" editable="false" />
								</TD>
								</c:when>
								<c:otherwise>
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								<input id="investigator2" name="investigator2" class="easyui-validatebox" value="${investigate.investigator2}" readonly="readonly"/>
								</TD>
								</c:otherwise>
								</c:choose>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position2" name="position2" class="easyui-validatebox" value="${investigate.position2}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >协理员：</TD> 
								<TD class=category width="23%">
								<input id="assistor1" name="assistor1" class="easyui-validatebox" value="${investigate.assistor1}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position3" name="position3" class="easyui-validatebox" value="${investigate.position3}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >调查开始时间：</TD> 
								<TD class=category width="23%">
									<fmt:formatDate value="${investigate.begTime}"
									pattern="yyyy-MM-dd" />
								</TD>
								<TD height=30 width="10%" align=right >调查结束时间：</TD>
								<TD class=category width="23%">
									<fmt:formatDate value="${investigate.endTime}"
									pattern="yyyy-MM-dd" />
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;家庭背景</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >家庭成员与调查对象相处情况：</TD> 
								<TD class=category width="56%" colspan="3">
								<input id="familySituation" name="familySituation" data-options="multiline:true" class="easyui-textbox" value="${investigate.familySituation}" style="width: 800px;height:50px;" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >家庭经济状况：</TD> 
								<TD class=category width="56%" colspan="3">
								<input id="economicStatus" name="economicStatus" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >未成年对象的其他情况：</TD> 
								<TD class=category width="56%" colspan="3">
								<input id="minorOtherCases" name="minorOtherCases" data-options="multiline:true" class="easyui-textbox" value="${investigate.minorOtherCases}" style="width: 800px;height:50px;" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 colspan="4">
								<table class="easyui-datagrid" id="t_list_content" title="家庭成员信息列表"
									style="height: 400px;" 
									data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
									pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/investigate/investigateFamily/list?preInvestId=${investigate.id }',method:'post'">
									<thead>
										<tr>
											<th data-options="field:'dicRelationKey',width:'10%',align:'center'" editor="text">关系</th>
											<th data-options="field:'name',width:'20%',align:'center'" editor="text">姓名</th>
											<th data-options="field:'birthday',width:'20%',align:'center'" editor="text">出生日期</th>
											<th data-options="field:'job',width:'20%',align:'center'" editor="text">职业</th>
											<th data-options="field:'phone',width:'10%',align:'center'" editor="text">联系方式</th>
										</tr>
									</thead>
								</table>
								</TD> 
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;个性特点</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >生理状况：</TD>
								<TD class=category width="23%">
								<input id="physiConditions" name="physiConditions" class="easyui-validatebox" value="${investigate.physiConditions}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >心理特征：</TD>
								<TD class=category width="23%">
								<input id="psychFeature" name="psychFeature" class="easyui-validatebox" value="${investigate.psychFeature}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >性格类型：</TD>
								<TD class=category width="23%">
								<input id="mettleType" name="mettleType" class="easyui-validatebox" value="${investigate.mettleType}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >爱好特长：</TD>
								<TD class=category width="23%">
								<input id="hobbies" name="hobbies" class="easyui-validatebox" value="${investigate.hobbies}" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>


<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;犯罪前表现</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >工作(学习)表现：</TD>
								<TD class=category width="23%">
								<input id="display" name="display" class="easyui-validatebox" value="${investigate.physiConditions}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >业余生活：</TD>
								<TD class=category width="23%">
								<input id="amateurLife" name="amateurLife" class="easyui-validatebox" value="${investigate.psychFeature}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >邻里关系：</TD>
								<TD class=category width="23%">
								<input id="neighborhoodRelations" name="neighborhoodRelations" class="easyui-validatebox" value="${investigate.mettleType}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >社会交往：</TD>
								<TD class=category width="23%">
								<input id="socialInteraction" name="socialInteraction" class="easyui-validatebox" value="${investigate.hobbies}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >违纪违法情况：</TD>
								<TD class=category width="23%">
								<input id="badFact" name="badFact" class="easyui-validatebox" value="${investigate.mettleType}" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>


<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;悔罪表现</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >对犯罪行为的认识：</TD>
								<TD class=category width="23%">
								<input id="crimeAcquaint" name="crimeAcquaint" class="easyui-validatebox" value="${investigate.physiConditions}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >悔过态度：</TD>
								<TD class=category width="23%">
								<input id="repentantAttitude" name="repentantAttitude" class="easyui-validatebox" value="${investigate.psychFeature}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >罚金刑履行情况及履行能力：</TD>
								<TD class=category width="23%">
								<input id="fineFulfillAbility" name="fineFulfillAbility" class="easyui-validatebox" value="${investigate.mettleType}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >附带民事赔偿履行情况及履行能力：</TD>
								<TD class=category width="23%">
								<input id="reparationFulfillAbility" name="reparationFulfillAbility" class="easyui-validatebox" value="${investigate.hobbies}" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>


<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;社会反响</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >被害人或其亲属态度：</TD>
								<TD class=category width="23%">
								<input id="victimAttitude" name="victimAttitude" class="easyui-validatebox" value="${investigate.physiConditions}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >社会公众态度：</TD>
								<TD class=category width="23%">
								<input id="publicAttitude" name="publicAttitude" class="easyui-validatebox" value="${investigate.psychFeature}" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;监管条件</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >家庭成员态度：</TD>
								<TD class=category width="23%">
								<input id="familyAttitude" name="familyAttitude" class="easyui-validatebox" value="${investigate.physiConditions}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >生活环境：</TD>
								<TD class=category width="23%">
								<input id="lifeEnvironment" name="lifeEnvironment" class="easyui-validatebox" value="${investigate.psychFeature}" readonly="readonly"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >村（居、社区）基层组织意见：</TD>
								<TD class=category width="56%" colspan="3">
								<input id="basicView" name="basicView" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
	
	   <TBODY>
	   		<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;公安派出所意见</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >公安派出所意见：</TD>
								<TD class=category width="56%" colspan="3">
								<input id="policeView" name="policeView" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;" readonly="readonly"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   <TBODY>
		<tr>
		  <td colspan=4 align=center class=category>
			<c:choose>
			<c:when test="${investigate.applyUnLock == '1'}">
				<a id="lockbtn" class="easyui-linkbutton" iconCls="icon-back" href="#" onclick="doUnLock()">上报解锁</a>
			</c:when>
			<c:otherwise>
			  	<c:if test="${sysAccount.roleId == '3002' || sysAccount.roleId == '2002'}">
					<a id="submitbtn" class="easyui-linkbutton" iconCls="icon-annex" href="#" onclick="doAudit()">审核</a>
			  	</c:if>
			  	<c:if test="${sysAccount.roleId == '2006' || sysAccount.roleId == '2003'}">
					<a id="submitbtn" class="easyui-linkbutton" iconCls="icon-annex" href="#" onclick="doAudit()">审核评定</a>
			  	</c:if>
				<a id="reportbtn" class="easyui-linkbutton" iconCls="icon-back" href="#" onclick="doBack()">退回</a>
				<a id="cancelbtn" class="easyui-linkbutton" iconCls="icon-cancel" href="#" onclick="doClose()">返回</a>
			</c:otherwise>
			</c:choose>
		  </td>
		</tr>
   </TBODY>
</TABLE>
</form>

<div id="mydialog" title="评估上报" modal=true draggable=true class="easyui-dialog" closed=true style="width: 600px;">

		<form id="myform" action="" method="post" >
		<!-- 
			<div id="tabAdd" class="easyui-tabs" >
				<div title="调查评估意见书" data-options="iconCls:'icon-view'" style="padding: 5px 5px">
		 -->
					<input type="hidden" id="id" name="id" value="${investigate.id}" />
					<input type="hidden" name="taskId" value="${investigate.taskId}"/>
					<input type="hidden" name="auditType" value="${investigate.auditType}"/>
					<table border=0 cellSpacing=0 cellPadding=0 width="600px" bgColor=#c4d8ed>
					<tbody>
					
						<!-- 调查评估意见书   -->
			   			<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;调查评估意见书</td>
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
										<td align="center"><span style="font-size: 30px;">调查评估意见书</span></td>
									</tr>
									<tr>
										<td>
										${investigate.entrustUnit}:<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										受你单位委托，我局于
										<c:choose>
										<c:when test="${investigate.begTime == null}">
										&nbsp;年&nbsp;月&nbsp;日
										</c:when>
										<c:otherwise>
										<fmt:formatDate value="${investigate.begTime}" pattern="yyyy-MM-dd" />
										</c:otherwise>
										</c:choose>
										至
										<c:choose>
										<c:when test="${investigate.endTime == null}">
										&nbsp;年&nbsp;月&nbsp;日
										</c:when>
										<c:otherwise>
										<fmt:formatDate value="${investigate.endTime}" pattern="yyyy-MM-dd" />
										</c:otherwise>
										</c:choose>
										对${investigate.name}
										进行了调查评估。有关情况如下:
										</td>
									</tr>
									<tr>
										<td style="padding-left: 40px;">
										<input id="situation" name="situation" data-options="multiline:true" class="easyui-textbox" 
										value="${investigate.situation}" style="width: 500px;height:150px;" readonly="readonly"/>
										</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						
						<!-- 调查情况修改记录   -->
						<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;调查情况修改记录</td>
										<td align=right>&nbsp;</td>
									</TR>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 style="text-align: center;">
								<tbody>
									<tr>
										<td>修改人
										</td>
										<td>修改时间
										</td>
										<td>历史情况
										</td>
										<td>修改情况
										</td>
									</tr>
									<tr>
										<td class=category>${modifyPersonName}
										</td>
										<td class=category><fmt:formatDate value='${investigate.bornDate}' pattern="yyyy-MM-dd" />
										</td>
										<td class=category>${investigate.situation}
										</td>
										<td class=category>${investigate.situation}
										</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						
						<!-- 评估意见 -->
						<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;评估意见</td>
										<td align=right>&nbsp;</td>
									</TR>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 style="text-align: center;">
								<tbody>
									<tr>
										<td>审批环节</td>
										<td>处理时间</td>
										<td>处理人</td>
										<td>意见</td>
										<td>备注</td>
									</tr>
									<c:forEach items="${processDetails}" var="processDetail">
									<tr>
										<td class=category>${processDetail.createrCnName }
										</td>
										<td class=category><fmt:formatDate value='${processDetail.created}' pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td class=category>${processDetail.auditName}
										</td>
										<td class=category>${processDetail.dicDecideType == '1'?'符合监管条件，同意接收':'不符合监管条件，拒绝接收'}
										</td>
										<td class=category>${processDetail.opinion}
										</td>
									</tr>
					                </c:forEach>
								</tbody>
								</table>
							</td>
						</tr>
						
						<!-- 审核意见 -->
						<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;审核意见</td>
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
									<c:if test="${investigate.auditType eq 'jzkCheck111'||investigate.auditType eq 'fzkCheck111'}">
									<tr>
										<td height=30 align=left >是否推荐为典型案例：</td>
										<td colspan="3">
										<input type="radio" name="recommendStatus" value="1"/>是
										<input type="radio" name="recommendStatus" value="2"/>否
										</td>
									</tr>
									<TR>	
										<TD height=30 align=left >输入质量：</TD>
										<TD width="35%">
											<input type="button" value="评定" onclick="pingding(1);"/>
										</TD>
										
										<TD height=30 align=left >输入质量评分：</TD>
										<TD width="35%">
											<input  class="easyui-validatebox" required=true
												 missingMessage="质量评分不能为空!"  readonly="readonly" id="handleQualityGoal" name="optScore" />
										</TD>
									</TR>
									<TR>	
										<TD height=30 align=left >执法质量：</TD>
										<TD width="35%">
											<input type="button"  value="评定" onclick="$('#tt').window('open')" />
										</TD>
										<TD height=30 align=left >执法质量评分：</TD>
										<TD width="35%">
											<input class="easyui-validatebox" required=true
												 missingMessage="执法质量不能为空!" readonly="readonly" id="actionQualityGoal" name="zfScore" />
										</TD>
									</TR>
									</c:if>
									<tr style="text-align: left;">
										<td><span style="color: red;">*</span>审核类型：</td>
										<td colspan="3">
										<input id="dicEvalueViewKey" name="dicEvalueViewKey" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=dic_evalue_view_key&parentKey=82000',panelHeight:'auto'">
										</td>
									</tr>
									<tr>
										<td>具体意见：
										</td>
										<td colspan="3">
										<input id="evalueViews" name="evalueViews" data-options="multiline:true" class="easyui-textbox" value="" style="width: 350px;height:50px;"/>
										</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a id="btn1" class="easyui-linkbutton">审核</a>
								<a id="btn2" class="easyui-linkbutton">取消</a>
							</td>
						</tr>
						<tr><td>&nbsp</td></tr>
					</tbody>
					</table>
					<!-- 
				</div>
			</div>
					 -->
		</form>
	</div>
<script type="text/javascript">
var type = 1;

function doAudit(){
	$('#mydialog').dialog({
		title : '司法所负责人审核'
	});
	$('#mydialog').dialog('open');
}
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}
function doBack(){
	$.messager.confirm('提示信息', '是否确定退回?', function(r) {
		$('#submitReportForm').form('submit');
	});
}
function doUnLock(){
	$.messager.confirm('提示信息', '是否确定解除上报锁定?', function(r) {
		if (r) {
			$.ajax({
				type : 'post',
				url : '${ctx}/investigate/investigateAudit?type=' + type,
				data : $('#myform').serialize(),
				dataType : 'json',
	  			cache : false,
	  			async : false, //同步请求
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
	});
}

$(function() {
	$('#submitReportForm').form({
		url:'${ctx}/investigate/investigateAudit',
		onSubmit:function(param){
			param.type = "2";
			return $('#submitReportForm').form('validate');
		},
		cache : false,
  		async : false, //同步请求
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				doClose();
			}else{
				alert(data.msg);
			}
		}
	});	
});

$('#btn1').click(function (){
	if ($('#myform').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true&type=' + type,
			data : $('#myform').serialize(),
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});

				$('#mydialog').dialog('close');
				doClose();
			},
			error : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#btn2').click(function (){
	$('#mydialog').dialog('close');
});

$('#dicEvalueViewKey').combobox({
	onChange:function(){
		if ($('#dicEvalueViewKey').combobox('getValue') == '82001') {
			type = 1;
		}
		if ($('#dicEvalueViewKey').combobox('getValue') == '82002') {
			type = 2;
		}
	}
});
</script>
</body>
</html>