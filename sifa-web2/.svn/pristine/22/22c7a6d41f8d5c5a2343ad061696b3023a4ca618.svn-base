<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="volunteer_saveform" method="post">
     <input type="hidden" name="id" value="${volunteer.id }" />
	 <input type="hidden" name="culpritId" value="${volunteer.culpritId }" />
		<table width="100%" class="grid">
				<tr>
					<th width="15%"><span class="c-red">*</span>姓名：</th>
					<td width="35%"><input name="name" class="easyui-textbox" value="${volunteer.name }" required=true data-options="validType:'chinaName'"/></td>
					<th width="15%"><span class="c-red">*</span>性别：</th>
					<td width="35%"><input name="dicSexKey"  value="${volunteer.dicSexKey }"  class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>聘用开始日期：</th>
					<td><input type="text" name="startDate" value="<fmt:formatDate value="${volunteer.startDate }" pattern="yyyy-MM-dd" />"  required=true  id="volunteerStartDate"
								class="Wdate easyui-validatebox" onfocus="var volunteerEndDate=$dp.$('volunteerEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'volunteerEndDate\')}'})" /></td>
					<th><span class="c-red">*</span>聘用结束日期：</th>
					<td><input type="text" name="endDate" value="<fmt:formatDate value="${volunteer.endDate }" pattern="yyyy-MM-dd" />" required=true id="volunteerEndDate"
								class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'volunteerStartDate\')}'})" /></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>聘用时限(年)：</th>
					<td><input name="limit" value="${volunteer.limit }"  class="easyui-numberbox" data-options="min:1" required=true /></td>
					<th>手机号：</th>
					<td><input name="linkMobile" value="${volunteer.linkMobile }" class="easyui-numberbox" data-options="validType:'telno'"/></td>
					
				</tr>
				<tr>
					<th>工作单位：</th>
					<td colspan="3"><input name="job" value="${volunteer.job }"  class="easyui-textbox"  style="width:400px;"/></td>
				</tr>
				<tr>
					<th>住址：</th>
					<td colspan="3"><input name="address" value="${volunteer.address }"  class="easyui-textbox"  style="width:400px;"/></td>
				</tr>
			</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="volunteer_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
   <script type="text/javascript">
$(function() {
	$('#volunteer_saveform').form({
		url:'${ctx}/sys/volunteer/save',
		onSubmit:function(){
			 progressLoad();
			/*  var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid; */
		},
		success:function(data){
			progressClose();
			$.messager.show({
				title:'提示信息!' ,
				msg:'保存成功！'
			});
			 $('#volunteerDialog').dialog('close');
			 $('#volunteer_content').datagrid('reload');
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#volunteer_saveform_btn').click(function(){
		$('#volunteer_saveform').form('submit');
	});
	
	

});

</script>