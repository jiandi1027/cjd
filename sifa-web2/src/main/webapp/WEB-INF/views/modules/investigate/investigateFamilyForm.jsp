<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="${ctx}/investigateFamily/save" method="post" id="investigateMemberFormInfo">
	<input type="hidden" name="id" id="id" value="${investigateFamily.id}"/>
	<input type="hidden" name="preInvestId" value="${investigateFamily.preInvestId}"/>
	
	<div class="easyui-panel" title="" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="30%"><span class="c-red">*</span>姓名：</th>
				<td width="70%"><input id="name" name="name" class="easyui-textbox easyui-validatebox" data-options="validType:'length[0,20]'" 
					required=true missingMessage="姓名不能为空!" value="${investigateFamily.name }" /></td>
	        </tr>
						
			<tr>
				<th>出生日期：</th>
				<td><input id="birthday" name="birthday" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" 
					value="${investigateFamily.birthday }" /></td>
			</tr>
			<tr>
				<th>职业：</th>
				<td><input id="job" name="job" class="f1 easyui-combobox " value="${investigateFamily.job }" data-options="valueField:'value',textField:'value',limitToList:true,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto'" >
				</td>
			</tr>
			<tr>
				<th>关系：</th>
				<td><input id="dicRelationKey" name="dicRelationKey" class="easyui-combobox" value="${investigateFamily.dicRelationKey }" editable="false"
 					data-options="valueField:'value',textField:'value',panelMaxHeight:'200',panelHeight:'auto',limitToList:true,
 					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate_family&columnName=dic_relation_key&parentKey=1530000'">
				</td>
			</tr>
			<tr>
				<th>联系方式：</th>
				<td><input id="phone" name="phone" class="easyui-textbox easyui-validatebox" data-options="validType:'telno'" value="${investigateFamily.phone }" /></td>
			</tr>
			<tr>
				<th>住址：</th>
				<td><input id="address" name="address" class="easyui-textbox easyui-validatebox" data-options="multiline:true,validType:'length[0,50]'" 
					value="${investigateFamily.address }" style="height: 70px;"/></td>
			</tr>
			
			<tr align="center" style="display: none;">
				<td colspan="2">
					<a id="familyBtn1" class="easyui-linkbutton" icon="fi-save">保存</a>
					<a id="familyBtn2" class="easyui-linkbutton" icon="icon-undo">重置</a>
				</td>
			</tr>
		</table>
    </div>
</form>
<script>
$('#familyBtn1').click(function(){
	$('#investigateMemberFormInfo').submit();
});
$('#familyBtn2').click(function(){
	$('#investigateMemberFormInfo').get(0).reset();
});

$(function() {
	$('#investigateMemberFormInfo').form({
		url:'${ctx}/investigate/investigateFamily/save',
		async : false,
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            }
            
            return isValid;
   		},
   		success:function(data){
        	progressClose();
   			data = JSON.parse(data);
   			if(data.status==200){
   				$.messager.show({
   					title:'提示信息!' ,
   					msg:data.msg
   				});
   				
   				$('#investigateMember_list').datagrid("reload");
   				$('#investigateFamily').dialog("close");
   			}else{
   				$.messager.show({
   					title:'错误信息!' ,
   					msg:data.msg
   				});
   			}
   		}
   	});	
     
});

</script>