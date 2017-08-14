<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="" method="post" id="moveInDiaoChaInfo">
	<div class="easyui-panel" title="基本信息"
		style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">矫正对象：</th>
				<td width="23%" style="border-right-style: none">${moveIn.name }
				</td>
				<td width="10%" style="border-style: none"></td>
				<td width="23%" style="border-style: none"></td>
				<td width="10%" style="border-style: none"></td>
				<td style="border-style: none"></td>
			</tr>
			<tr>
				<th>身份证号：</th>
				<td>${moveIn.cedentialsNumber }</td>
				<th>性别：</th>
				<td>${fns:getSysDicValueByKey('common_table','sex',moveIn.dicSexKey ,'')}
				</td>
				<th>民族：</th>
				<td>${fns:getSysDicValueByKey('common_table','nation',moveIn.nation ,'')}</td>
			</tr>
			<tr>
				<th>曾用名：</th>
				<td>${moveIn.alias }</td>

				<th>出生日期：</th>
				<td><fmt:formatDate value="${moveIn.bornDate}"
						pattern="yyyy-MM-dd" /></td>

				<th>文化程度：</th>
				<td>${fns:getSysDicValueByKey('common_table','whcd',moveIn.dicWhcdKey ,'')}
				</td>
			</tr>
			<tr>
				<th>婚姻状况：</th>
				<td>
					${fns:getSysDicValueByKey('common_table','hyzk',moveIn.dicHyzkKey ,'')}
				</td>
				<th>职业：</th>
				<td>${moveIn.job }</td>
				<th>原政治面貌：</th>
				<td>
					${fns:getSysDicValueByKey('common_table','zzmm',moveIn.oldPoliticStatusId  ,'')}
				</td>
			</tr>
			<tr>
				<th>籍贯：</th>
				<td>${moveIn.origin }</td>
				<th>户籍所在地：</th>
				<td>${moveIn.regResidence }</td>
				<th>联系方式：</th>
				<td>${moveIn.contactPhone }</td>
			</tr>
			<tr>
				<th>原判罪名：</th>
				<td>${moveIn.crimeInfo }</td>
				<th>刑期：</th>
				<td>${moveIn.adjudgePeriod}</td>
				<th>刑期执行类别：</th>
				<td>
					${fns:getSysDicValueByKey('common_table','entrust_type_id',moveIn.dicPenalTypeKey ,'')}
				</td>
			</tr>
			<tr>
				<th>刑期变动：</th>
				<td>${moveIn.adjudgeChange }</td>
				<th>刑期开始日期：</th>
				<td><fmt:formatDate value="${moveIn.adjudgeStartTime}"
						pattern="yyyy-MM-dd" /></td>
				<th>刑期结束日期：</th>
				<td><fmt:formatDate value="${moveIn.adjudgeEndTime}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>矫正期限：</th>
				<td>${moveIn.redressPeriod }
				<th>矫正开始日期：</th>
				<td><fmt:formatDate value="${moveIn.redressStartDate}"
						pattern="yyyy-MM-dd" /></td>
				<th>矫正结束日期：</th>
				<td><fmt:formatDate value="${moveIn.redressEndDate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</table>
	</div>

	<div class="easyui-panel" title="指派人员" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>姓名：</th>
				<td width="23%"><input id="investigatorId1"
					class="easyui-combobox" name="investigatorId1" required=true
					data-options="valueField:'id',textField:'accountname',url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+${moveIn.groupId },panelHeight:'auto',
					 onChange:function(newValue,oldValue){  
    	$.post('${ctx}/sys/sysAccount/roleName',{'id':newValue},
		function(data){
    		$('#position1').textbox('setValue',data);
		});
     }  " />
				<th width="10%">单位职务：</th>
				<td><input id="position1" name="position1"
					class="easyui-textbox" /></td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td><input id="investigatorId2" class="easyui-combobox"
					name="investigatorId2"
					data-options="valueField:'id',textField:'accountname',url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+${moveIn.groupId },panelHeight:'auto',
					onChange:function(newValue,oldValue){  
    	$.post('${ctx}/sys/sysAccount/roleName',{'id':newValue},
		function(data){
    		$('#position2').textbox('setValue',data);
		});
     } " />
					<input type="hidden" id="investigator2" name="investigator2"
					value=""></td>
				<th>单位职务：</th>
				<td><input id="position2" name="position2"
					class="easyui-textbox" /></td>
			</tr>
			<tr>
				<th>协理员：</th>
				<td><input id="assistorId1" class="easyui-combobox"
					name="assistorId1" data-options="valueField:'id',textField:'accountname',url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+${moveIn.groupId },panelHeight:'auto',
					onChange:function(newValue,oldValue){  
    	$.post('${ctx}/sys/sysAccount/roleName',{'id':newValue},
		function(data){
    		$('#position3').textbox('setValue',data);
		});
     } "/> 
					<input type="hidden" id="assistor1" name="assistor1" value=""></td>
				<th>单位职务：</th>
				<td><input id="position3" name="position3"
					class="easyui-textbox" /></td>
			</tr>
		</table>
	</div>
</form>

<div style="text-align: center;display: none;">
	    <a id="diaoChaBtn" class="easyui-linkbutton" >开始调查</a>
	    <a id="diaoChaBackBtn" class="easyui-linkbutton" >退回</a>
</div>
<form id="MoveInBackForm" action="" method="post">
<div id="backMoveIn" title="退回原因" modal=true draggable=false  data-options="iconCls:'fi-arrow-left icon-blue',maximizable:true,resizable:true"
		class="easyui-dialog" closed=true style="width:420px; padding:5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="5%"><span class="c-red">*</span>退回原因：</th>
					<td width="20%">
					<textArea class="f1 easyui-validatebox"
					data-options="multiline:true" name="opinion" id="backOption" required=true
					style="width: 300px; height: 80px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</td>
				</tr>
			</table>
			</div>
</form>

<script type="text/javascript">
$('#diaoChaBtn').click(function(){
	if($('#moveInDiaoChaInfo').form('validate')){
		$.ajax({
			type : 'post',
		 	url :"${ctx}/culprit/moveIn/submitMoveInAudit?decideType=1&id=${moveIn.id }&taskId=${moveIn.taskId }&auditType=${moveIn.auditType}&processInstanceId=${moveIn.processInstanceId }",
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			data: $.serializeObject($('#moveInDiaoChaInfo')),
			success : function(result) {
				if(result.status==200){
					$.messager.show({
						title : '提示信息!',
						msg : '提交成功!'
					});
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
		             parent.$.modalDialog.handler.dialog('close');
				}	
			}
		})
	}else{
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能提交 !'
		});
	}
})

$('#diaoChaBackBtn').click(function(){
var opinion=$('#backOption').val();
if($('#MoveInBackForm').form('validate')){
		$.ajax({
			type : 'post',
		 	url :"${ctx}/culprit/moveIn/submitMoveInAudit?decideType=2&id=${moveIn.id }&taskId=${moveIn.taskId }&auditType=${moveIn.auditType}&processInstanceId=${moveIn.processInstanceId }",
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			data:{opinion:opinion},
			success : function(result) {
				if(result.status==200){
					$.messager.show({
						title : '提示信息!',
						msg : '退回成功!'
					});
					$('#backMoveIn').dialog('close');
					 parent.$.modalDialog.handler.dialog('close');
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				}	
			}
		})
	}else{
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能提交 !'
		});
	}
})
</script>