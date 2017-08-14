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

<form id="submitPushForm" name="submitPushForm" action="" method="post">
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
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<TR>
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								${investigate.name}
								</TD>
								<TD height=30 width="10%" align=right >性别：</TD>
								<TD class=category width="23%">
								${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }
								</TD>
								<TD height=30 width="10%" align=right >民族：</TD>
								<TD class=category >
								${investigate.nation}
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >曾用名：</TD>
								<TD class=category width="23%">
								${investigate.oldName}
								</TD>
								<TD height=30 width="10%" align=right >别名：</TD>
								<TD class=category width="23%">
								${investigate.alias}
								</TD>
								<TD height=30 width="10%" align=right >相关证件号：</TD>
								<TD class=category >
								${investigate.relevantNumber}
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >出生日期：</TD>
								<TD class=category width="23%">
									<fmt:formatDate value="${investigate.bornDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								<TD height=30 width="10%" align=right >籍贯：</TD>
								<TD class=category width="23%">
								${investigate.origin}
								</TD>
								<TD height=30 width="10%" align=right >家庭住址：</TD>
								<TD class=category >
								${investigate.address}
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >联系方式：</TD>
								<TD class=category width="23%">
								${investigate.contactPhone}
								</TD>
								<TD height=30 width="10%" align=right >案由：</TD>
								<TD class=category width="23%">
								${investigate.crimeReason}
								</TD>
								<TD height=30 width="10%" align=right >经常居住地：</TD>
								<TD class=category >
								${investigate.habitualResidence}
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >职业：</TD>
								<TD class=category width="23%">
								${investigate.job}
								</TD>
								<TD height=30 width="10%" align=right >拟提请类型：</TD>
								<TD class=category width="23%">
								${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', investigate.entrustTypeId, '') }
								</TD>
								<TD height=30 width="10%" align=right >户籍类型：</TD>
								<TD class=category >
								${fns:getSysDicValueByKey('common_table', 'hklx', investigate.dicResudenceKey, '') }
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
								<input id="investigatorId1" name="investigatorId1" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'name',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003',panelHeight:'auto'">
								<input type="hidden" id="investigator1" name="investigator1" class="easyui-validatebox" value=""/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position1" name="position1" class="easyui-validatebox" value=""/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								<input id="investigatorId2" name="investigatorId2" class="easyui-combobox"  editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'name',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003',panelHeight:'auto'">
								<input type="hidden" id="investigator2" name="investigator2" class="easyui-validatebox" value=""/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position2" name="position2" class="easyui-validatebox" value=""/>
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >协理员：</TD> 
								<TD class=category width="23%">
								<input id="assistorId1" name="assistorId1" class="easyui-combobox" editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'name',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52004',panelHeight:'auto'">
								<input type="hidden" id="assistor1" name="assistor1" class="easyui-validatebox" value=""/>
								</TD>
								<TD height=30 width="10%" align=right >单位职务：</TD>
								<TD class=category width="23%">
								<input id="position3" name="position3" class="easyui-validatebox" value=""/>
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
			<a id="sub-btn" class="easyui-linkbutton" iconCls="icon-save" href="#" onclick="doAudit()">提交</a>
		  </td>
		</tr>
   </TBODY>
</TABLE>
</form>
<script type="text/javascript">
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

$('#investigatorId1').combobox({
	onChange:function(){ 
		$('#investigator1').val($('#investigatorId1').combobox('getText'));
	}
});
$('#investigatorId2').combobox({
	onChange:function(){ 
		$('#investigator2').val($('#investigatorId2').combobox('getText'));
	}
});
$('#assistorId1').combobox({
	onChange:function(){ 
		$('#assistor1').val($('#assistorId1').combobox('getText'));
	}
});

$(function() {
	$('#submitPushForm').form({
		url:'${ctx}/investigate/investigateAudit',
		onSubmit:function(param){
			param.update = "true";
			param.type = type;
			return $('#submitPushForm').form('validate');
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				
				parent.location.reload(); // 父页面刷新
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			}else{
				alert(data.msg);
			}
		}
	});	
});

</script>
</body>
</html>