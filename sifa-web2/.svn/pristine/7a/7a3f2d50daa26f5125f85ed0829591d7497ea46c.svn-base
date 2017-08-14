<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form:form action="${ctx}/sys/sysPerson/save" method="post"
	class="form form-horizontal" id="sysPersonForm" commandName="sysPerson">
	<form:hidden path="id" id="id" />
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin:0 auto;">
	<table width="100%" class="grid">
		<tr>
			<th width="17%"><span class="c-red">*</span>姓名：</th>
			<td><form:input path="name" class="f1 easyui-textbox "
					style="width:170px;" required="true" missingMessage="名称不能为空!" /></td>
			<th width="17%"><span class="c-red">*</span>单位：</th>
			<td><select id="groupId" name="groupId" class="easyui-combotree"
				required="true" missingMessage="所属部门不能为空!"
				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree?isAll=1',editable:true,value:'${sysPerson.groupId }'"
				style="width: 170px;">
			</select></td>

		</tr>
		<tr>
			<th width="17%">英文名：</th>
			<td><form:input path="ywm" class="f1 easyui-textbox "
					style="width:170px;" /></td>
			<th width="17%">身份证：</th>
			<td><form:input path="sfzh" id="sfzh"  data-options="onChange: function () { createBirthday();} " class="f1 easyui-textbox "
					style="width:170px;" /></td>


		</tr>
		<tr>
			<th width="17%">性别：</th>
			<td><form:radiobuttons path="dicSexKey"
					items="${fns:getSysDicList('common_table','sex','10000')}"
					itemLabel="value" itemValue="key" /></td>
			<th width="17%">出生年月：</th>
			<td><input type="text" id="csrq" name="csrq" class="Wdate" style="width:170px;" value="<fmt:formatDate value="${investigate.bornDate }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>


		</tr>
		<tr>

			<th width="17%">是否接收越界短信：</th>
			<td><form:radiobuttons path="isSms"
					items="${fns:getSysDicList('common_table','yes_no','169ef30f5332428da7ac7bb1d576ac3d')}"
					itemLabel="value" itemValue="key" /></td>
			<th width="17%"><span class="c-red">*</span>编制类型：</th>
			<td><input id="dicRybzKey" class="easyui-combobox" required=true 
				style="width: 170px;" name="dicRybzKey"
				data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPerson.dicRybzKey }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sys_person&columnName=bzlx&parentKey=52000'" />
			</td>


		</tr>
		<tr>

			<th width="17%">职务：</th>
			<td><form:input path="zw" class="f1 easyui-textbox "
					style="width: 170px; " /></td>
			<th width="17%">民族：</th>
			<td><input id="mz" class="easyui-combobox" style="width: 170px;"
				missingMessage="不能为空!" name="mz"
				data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPerson.mz }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=nation&parentKey=104000'" />
			</td>

		</tr>
		<tr>

			<th width="17%">住址：</th>
			<td><form:input path="address" class="f1 easyui-textbox "
					style="width:170px;" /></td>
			<th width="17%">政治面貌：</th>
			<td><input id="dicZzmmKey" class="easyui-combobox"
				style="width: 170px;" missingMessage="不能为空!" name="dicZzmmKey"
				data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPerson.dicZzmmKey }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=zzmm&parentKey=65000'" />
			</td>

		</tr>
		<tr>

			<th width="17%"><span class="c-red">*</span>手机号码：</th>
			<td><form:input path="mobile" class="f1 easyui-textbox easyui-validatebox" data-options="validType:'telNum'" required="true" missingMessage="手机号码不能为空!" 
					style="width:170px;" /></td>
			<th width="17%">婚姻状况：</th>
			<td><input id="dicHyzkKey" class="easyui-combobox"
				style="width: 170px;" missingMessage="不能为空!" name="dicHyzkKey"
				data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPerson.dicHyzkKey }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hyzk&parentKey=11000'" />
			</td>

		</tr>
		<tr>

			<th width="17%">电子邮箱：</th>
			<td><form:input path="dzyx" class="f1 easyui-textbox "
					style="width:170px;" /></td>
			<th width="17%">毕业院校：</th>
			<td><form:input path="byyx" class="f1 easyui-textbox "
					style="width: 170px; " /></td>

		</tr>
		<tr>

			<th width="17%">学历：</th>
			<td><input id="dicXlKey" class="easyui-combobox"
				style="width: 170px;" missingMessage="不能为空!" name="dicXlKey"
				data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPerson.dicXlKey }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=whcd&parentKey=19000'" />
			</td>
			<th width="17%">专业：</th>
			<td><form:input path="zy" class="f1 easyui-textbox "
					style="width: 170px; " /></td>

		</tr>
		<tr>

			<th width="17%">工作单位(资源者)：</th>
			<td><form:input path="job" class="f1 easyui-textbox "
					style="width:170px;" /></td>
			<th width="17%">最高学历：</th>
			<td><form:input path="zgxw" class="f1 easyui-textbox "
					style="width: 170px; " /></td>

		</tr>

		<!--  
				<tr>
					
					<th>文件上传：</th>
					<td colspan="3">
						<div id="uploader"></div>
					</td>
					
					
				</tr>
				-->



	</table>
	</div>
</form:form>
<script>
    function createBirthday() {
		var certificateNum = $("#sfzh").val();
		alert("hi");
		if (certificateNum.length == 16 || certificateNum.length == 18) {
			var birthday = certificateNum.substring(6, 14);
			$("#csrq").val(
					birthday.substring(0, 4) + "-" + birthday.substring(4, 6)
							+ "-" + birthday.substring(6, 8));
		} else {
			$("#csrq").val("");
		}

	}
        function submitForm(){
        	 $('#sysPersonForm').form('submit');
        }
        function clearForm(){
            $('#sysPersonForm').form('clear');
        }
        $(function() {
        	
        	//$("#uploader").powerWebUpload({ auto: true,fileNumLimit:5,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
        	
        	$('#sysPersonForm').form({
        		url:'${ctx}/sys/sysPerson/save',
        		onSubmit:function(){
        			 progressLoad();
        			 var isValid = $(this).form('validate');
                     if (!isValid) {
                    	 progressClose();
                     }
                     return isValid;
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				  progressClose();
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
