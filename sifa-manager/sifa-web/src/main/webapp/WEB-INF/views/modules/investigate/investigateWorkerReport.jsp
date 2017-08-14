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
<title>审前调查审核</title>
</head>
<body>
<form id="submitPushForm" name="submitPushForm" action="${ctx}/investigate/submitUpdate" method="post">
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
								<input id="dicSexKeyName" name="dicSexKeyName" class="easyui-validatebox" 
								value="${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }" readonly="readonly"/>
								<input type="hidden" id="dicSexKey" name="dicSexKey" class="easyui-validatebox" value="${investigate.dicSexKey}"/>
								</TD>
								<TD height=30 width="10%" align=right >民族：</TD>
								<TD class=category >
								<input name="nation" class="easyui-validatebox" value="${investigate.nation}" />
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >曾用名：</TD>
								<TD class=category width="23%">
								<input name="oldName" class="easyui-validatebox" value="${investigate.oldName}" />
								</TD>
								<TD height=30 width="10%" align=right >别名：</TD>
								<TD class=category width="23%">
								<input name="alias" class="easyui-validatebox" value="${investigate.alias}" />
								</TD>
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>相关证件号：</TD>
								<TD class=category >
								<input id="relevantNumber" name="relevantNumber" class="easyui-validatebox" value="${investigate.relevantNumber}" required="true"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>出生日期：</TD>
								<TD class=category width="23%">
								<input id="bornDate" name="bornDate" class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
								required="true" value="<fmt:formatDate value='${investigate.bornDate}' pattern="yyyy-MM-dd" />"/>
								</TD>
								<TD height=30 width="10%" align=right >籍贯：</TD>
								<TD class=category width="23%">
								<input name="origin" class="easyui-validatebox" value="${investigate.origin}" />
								</TD>
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>家庭住址：</TD>
								<TD class=category >
								<input name="address" class="easyui-validatebox" value="${investigate.address}" required="true"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>联系方式：</TD>
								<TD class=category width="23%">
								<input name="contactPhone" class="easyui-validatebox" value="${investigate.contactPhone}" required="true"/>
								</TD>
								<TD height=30 width="10%" align=right >案由：</TD>
								<TD class=category width="23%">
								<input id="crimeReason" name="crimeReason" class="easyui-validatebox" value="${investigate.crimeReason}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>经常居住地：</TD>
								<TD class=category >
								<input id="habitualResidence" name="habitualResidence" class="easyui-validatebox" value="${investigate.habitualResidence}" required="true"/>
								
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >职业：</TD>
								<TD class=category width="23%">
								<input name="job" class="easyui-validatebox" value="${investigate.job}" />
								</TD>
								<TD height=30 width="10%" align=right >拟提请类型：</TD>
								<TD class=category width="23%">
								<input id="entrustTypeId" name="entrustTypeId" class="easyui-combobox" editable=false style="width:173px;" value="${investigate.entrustTypeId}"
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000',panelHeight:'auto'">
								</TD>
								<TD height=30 width="10%" align=right >户籍类型：</TD>
								<TD class=category >
								<input id="dicResudenceKey" name="dicResudenceKey" class="easyui-combobox" editable=false style="width:173px;" value="${investigate.dicResudenceKey}"
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hklx&parentKey=12000',panelHeight:'auto'">
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
								<TD height=30 width="10%" align=right ><span style="color: red;">*</span>姓名：</TD>
								<TD class=category width="23%">
								<input id="investigator1" name="investigator1" class="easyui-validatebox" value="${investigate.investigator1}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position1" name="position1" class="easyui-validatebox" value="${investigate.position1}"/>
								</TD>
							</TR>
							<TR>
								<c:choose>
								<c:when test="${investigate.investigatorId2 == '' || investigate.investigatorId2 == null}">
								<TD height=30 width="10%" align=right ><span style="color:red;">*</span>姓名：</TD>
								<TD class=category width="23%">
								<input id="investigatorId2" name="investigatorId2" class="easyui-combobox" 
								url="${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003" valueField="id" textField="name" value="" required="true" editable="false" />
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
								<input id="position2" name="position2" class="easyui-validatebox" value="${investigate.position2}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >协理员：</TD> 
								<TD class=category width="23%">
								<input id="assistor1" name="assistor1" class="easyui-validatebox" value="${investigate.assistor1}" readonly="readonly"/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position3" name="position3" class="easyui-validatebox" value="${investigate.position3}"/>
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
								<input id="familySituation" name="familySituation" data-options="multiline:true" class="easyui-textbox" value="${investigate.familySituation}" style="width: 800px;height:50px;"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >家庭经济状况：</TD>
								<TD class=category width="56%" colspan="3">
								<input id="economicStatus" name="economicStatus" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >未成年对象的其他情况：</TD> 
								<TD class=category width="56%" colspan="3">
								<input id="minorOtherCases" name="minorOtherCases" data-options="multiline:true" class="easyui-textbox" value="${investigate.minorOtherCases}" style="width: 800px;height:50px;"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 colspan="4">
								<div id="toolbar" style="height:auto">
									<a id="tbAdd" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-add" plain="true"><span style="color: black;">新增家庭成员</span></a>
									<div class="datagrid-btn-separator"></div>
									<a id="tbModify" href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"><span style="color: black;">更新</span></a>
								</div>
								<table class="easyui-datagrid" id="t_list_content" title="家庭成员信息列表"
									style="height: 400px;" 
									data-options="singleSelect:true,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
									pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/investigate/investigateFamily/list?preInvestId=${investigate.id }',method:'post'">
									<thead>
										<tr>
											<th data-options="field:'dicRelationKey',width:'10%',align:'center'" editor="text">关系</th>
											<th data-options="field:'name',width:'20%',align:'center'" editor="text">姓名</th>
											<th data-options="field:'birthday',width:'20%',align:'center'" editor="text">出生日期</th>
											<th data-options="field:'job',width:'20%',align:'center'" editor="text">职业</th>
											<th data-options="field:'phone',width:'10%',align:'center'" editor="text">联系方式</th>
											<th data-options="field:'_opt',width:250,formatter:formatOper">操作</th> 
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
								<input id="physiConditions" name="physiConditions" class="easyui-validatebox" value="${investigate.physiConditions}"/>
								</TD>
								<TD height=30 width="10%" align=right >心理特征：</TD>
								<TD class=category width="23%">
								<input id="psychFeature" name="psychFeature" class="easyui-validatebox" value="${investigate.psychFeature}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >性格类型：</TD>
								<TD class=category width="23%">
								<input id="mettleType" name="mettleType" class="easyui-validatebox" value="${investigate.mettleType}"/>
								</TD>
								<TD height=30 width="10%" align=right >爱好特长：</TD>
								<TD class=category width="23%">
								<input id="hobbies" name="hobbies" class="easyui-validatebox" value="${investigate.hobbies}"/>
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
								<input id="display" name="display" class="easyui-validatebox" value="${investigate.physiConditions}"/>
								</TD>
								<TD height=30 width="10%" align=right >业余生活：</TD>
								<TD class=category width="23%">
								<input id="amateurLife" name="amateurLife" class="easyui-validatebox" value="${investigate.psychFeature}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >邻里关系：</TD>
								<TD class=category width="23%">
								<input id="neighborhoodRelations" name="neighborhoodRelations" class="easyui-validatebox" value="${investigate.mettleType}"/>
								</TD>
								<TD height=30 width="10%" align=right >社会交往：</TD>
								<TD class=category width="23%">
								<input id="socialInteraction" name="socialInteraction" class="easyui-validatebox" value="${investigate.hobbies}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >违纪违法情况：</TD>
								<TD class=category width="23%">
								<input id="badFact" name="badFact" class="easyui-validatebox" value="${investigate.mettleType}"/>
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
								<input id="crimeAcquaint" name="crimeAcquaint" class="easyui-validatebox" value="${investigate.physiConditions}"/>
								</TD>
								<TD height=30 width="10%" align=right >悔过态度：</TD>
								<TD class=category width="23%">
								<input id="repentantAttitude" name="repentantAttitude" class="easyui-validatebox" value="${investigate.psychFeature}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >罚金刑履行情况及履行能力：</TD>
								<TD class=category width="23%">
								<input id="fineFulfillAbility" name="fineFulfillAbility" class="easyui-validatebox" value="${investigate.mettleType}"/>
								</TD>
								<TD height=30 width="10%" align=right >附带民事赔偿履行情况及履行能力：</TD>
								<TD class=category width="23%">
								<input id="reparationFulfillAbility" name="reparationFulfillAbility" class="easyui-validatebox" value="${investigate.hobbies}"/>
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
								<input id="victimAttitude" name="victimAttitude" class="easyui-validatebox" value="${investigate.physiConditions}"/>
								</TD>
								<TD height=30 width="10%" align=right >社会公众态度：</TD>
								<TD class=category width="23%">
								<input id="publicAttitude" name="publicAttitude" class="easyui-validatebox" value="${investigate.psychFeature}"/>
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
								<input id="familyAttitude" name="familyAttitude" class="easyui-validatebox" value="${investigate.physiConditions}"/>
								</TD>
								<TD height=30 width="10%" align=right >生活环境：</TD>
								<TD class=category width="23%">
								<input id="lifeEnvironment" name="lifeEnvironment" class="easyui-validatebox" value="${investigate.psychFeature}"/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >村（居、社区）基层组织意见：</TD>
								<TD class=category width="23%" colspan="3">
								<input id="basicView" name="basicView" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;"/>
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
								<TD class=category width="23%" colspan="3">
								<input id="policeView" name="policeView" data-options="multiline:true" class="easyui-textbox" value="${investigate.economicStatus}" style="width: 800px;height:50px;"/>
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
			<a id="submitbtn" class="easyui-linkbutton" iconCls="icon-save" href="#" onclick="doAudit()">保存</a>
			<a id="reportbtn" class="easyui-linkbutton" iconCls="icon-annex" href="#" onclick="doReport()">草拟评估意见上报</a>
			<a id="cancelbtn" class="easyui-linkbutton" iconCls="icon-cancel" href="#" onclick="doClose()">返回</a>
		  </td>
		</tr>
   </TBODY>
</TABLE>
</form>

<div id="mydialog" title="评估上报" modal=true draggable=true class="easyui-dialog" align="center" closed=true style="width: 600px;">

		<form id="myform" action="" method="post" >
			<div id="tabAdd" class="easyui-tabs" >
				<div title="调查评估意见书" data-options="iconCls:'icon-view'" style="padding: 5px 5px">
					<input type="hidden" id="id" name="id" value="${investigate.id}" />
					<input type="hidden" name="taskId" value="${investigate.taskId}"/>
					<input type="hidden" name="auditType" value="${investigate.auditType}"/>
					<table align="center">
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
							<c:otherwise>${investigate.begTime}</c:otherwise>
							</c:choose>
							至
							<c:choose>
							<c:when test="${investigate.endTime == null}">
							&nbsp;年&nbsp;月&nbsp;日
							</c:when>
							<c:otherwise>${investigate.endTime}</c:otherwise>
							</c:choose>
							对${investigate.name}
							进行了调查评估。有关情况如下:
							</td>
						</tr>
						<tr>
							<td>
							<input id="situation" name="situation" data-options="multiline:true" class="easyui-textbox" 
							value="${investigate.situation}" style="width: 500px;height:400px;"/>
							</td>
						</tr>
						<tr>
							<td>综合以上情况:</td>
						</tr>
						<tr>
							<td>
							<span style="color: red;">*</span>评估意见为：
							<input id="dicEvalueViewKey" name="dicEvalueViewKey" class="easyui-combobox" required=true editable=false style="width:173px;" value="${investigate.dicEvalueViewKey}" 
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=dic_evalue_view_key&parentKey=82000',panelHeight:'auto'">
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
							<a id="btn1" class="easyui-linkbutton">保存</a>
							<a id="btn2" class="easyui-linkbutton">上报</a>
							<a id="btn3" class="easyui-linkbutton">关闭</a></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	
	<div id="mydialog2" title="审前调查家庭成员对象" modal=true draggable=true align="center" class="easyui-dialog" closed=true style="width: 600px;">

		<form id="myform2" action="" method="post" >
			<div id="tabAdd" class="easyui-tabs" >
				<div title="审前调查家庭成员对象" data-options="iconCls:'icon-view'" style="padding: 5px 5px">
					<input type="hidden" id="id" name="id" class="mydialog2id" value="" />
					<input type="hidden" name="preInvestId" value="${investigate.id}"/>
					<table align="center">
						<tr>
						</tr>
						<tr>
							<td align="right" width="20%"><span style="color: red;">*</span>姓名：
							</td>
							<td>
							<input id="name" name="name" class="easyui-validatebox" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="20%">出生日期：
							</td>
							<td>
							<input id="birthday" name="birthday" class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</td>
						</tr>
						<tr>
							<td align="right" width="20%">职业：
							</td>
							<td>
							<input id="job" name="job" class="easyui-validatebox"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="20%">关系：
							</td>
							<td>
							<input id="dicRelationKey" name="dicRelationKey" class="easyui-combobox" editable=true style="width:173px;"  
    				data-options="valueField:'value',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate_family&columnName=dic_relation_key&parentKey=1530000',panelHeight:'auto'">
							</td>
						</tr>
						<tr>
							<td align="right" width="20%">联系方式：
							</td>
							<td>
							<input id="phone" name="phone" class="easyui-validatebox"/>
							</td>
						</tr>
						<tr>
							<td align="right" width="20%">住址：
							</td>
							<td>
							<input id="address" name="address" class="easyui-validatebox"/>
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
							<a id="btnFamily1" class="easyui-linkbutton">保存</a>
							<a id="btnFamily2" class="easyui-linkbutton">关闭</a></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
<script type="text/javascript">
var save = false;
var type = 1;
function doAudit(){
	if ($('#submitPushForm').form('validate')) {
		$('#submitPushForm').form('submit');
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
}
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}
function doReport(){
	$.messager.confirm('提示信息', '是否所有信息都已经保存?', function(r) {
		if (save == true) {
			$('#mydialog').dialog({
				title : '调查评估意见书'
			});
			$('#mydialog').dialog('open');
		}
		else {
			$.messager.show({
				title : "提示信息!",
				msg : "请先保存信息!"
			});
		}
	});
}

$('#btnFamily1').click(function(){
	if ($('#myform2').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateFamily/save',
			cache : false,
			data : $('#myform2').serialize(),
			dataType : 'json',
			beforeSend :function (){
			},
			success : function(result) {
				$('#myform2').get(0).reset(); //清空表单数据 
				//1 关闭窗口
				$('#mydialog2').dialog('close');
				//2刷新datagrid 
				$('#t_list_content').datagrid('reload');
				//3 提示信息
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			},
			error : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	} else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#btnFamily2').click(function(){
	$('#mydialog2').dialog('close');
});

//新增家庭成员
$('#tbAdd').click(function(){
	$('#mydialog2').dialog({
		title : '新增审前调查对象家庭成员'
	});
	$('#myform2').get(0).reset();
	//清空下拉框选择
	$('.mydialog2id').val('');
	$('#dicRelationKey').combobox('setValue','');
	
	$('#mydialog2').dialog('open');
});


$('#tbModify').click(function() {
	var arr = $('#t_list_content').datagrid('getSelections');
	if (arr.length != 1) {
		$.messager.show({
			title : '提示信息!',
			msg : '只能选择一行记录进行修改!'
		});
	} else {
		$('#mydialog2').dialog({
			title : '审前调查对象家庭成员信息-修改'
		});
		$('#mydialog2').dialog('open'); //打开窗口
		$('#myform2').get(0).reset(); //清空表单数据 
		//清空下拉框选择
		$('.mydialog2id').val('');
		$('#dicRelationKey').combobox('setValue','');

		$('#myform2').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			dicRelationKey : arr[0].dicRelationKey,
			birthday : arr[0].birthday,
			name : arr[0].name,
			phone : arr[0].phone,
			address : arr[0].address,
			job : arr[0].job
		});
	}
});

$(function() {

	$('#t_list_content').datagrid({
		fit : true
	});
	
	$('#submitPushForm').form({
		url:'${ctx}/investigate/investigateAudit',
		onSubmit:function(param){
			param.update = "true";
			return $('#submitPushForm').form('validate');
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				save = true;
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
			url : '${ctx}/investigate/investigateAudit?update=true',
			data : $('#myform').serialize(),
			dataType : 'json',
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
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
	if ($('#myform').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true&type=' + type,
			data : $('#myform').serialize(),
			dataType : 'json',
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
				$('#mydialog').dialog('close');

				parent.location.reload(); // 父页面刷新
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
				
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

$('#btn3').click(function (){
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

function formatOper(val,row,index){
	var operation='<a href="javascript:void(0);" onclick="deleteFamily(\''+row.id+'\')"><span style="color:blue;">删除</span></a>';

	return operation;
}

function deleteFamily(id){
	$.messager.confirm('提示信息', '确认删除?', function(r) {
		if (r) {
			$.post('${ctx}/investigate/investigateFamily/delete', {
				id : id
			}, function(result) {
				//1 刷新数据表格 
				$('#t_list_content').datagrid('reload');
				//2 清空idField   
				$('#t_list_content').datagrid('uncheckAll');
				//3 给提示信息 
				$.messager.show({
					title : '提示信息!',
					msg : '操作成功!'
				});
			});
		} else {
			return;
		}
	});
}
</script>
</body>
</html>