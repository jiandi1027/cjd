<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
	<form:form  action="${ctx}/sys/sysPermisson/save" method="post" class="form form-horizontal" id="sysPermissonForm" commandName="sysPermisson">
	<form:hidden path="id" id="id"/>
            <table width="100%" class="grid">
           
				<tr>
					
					<th width="10%"><span class="c-red">*</span>名称：</th>
					<td width="40%">
					<form:input path="name"
						class="f1 easyui-textbox " style="width: 170px; " required="true" missingMessage="名称不能为空!" />
					</td>
					<th width="10%">资源类型：</th>
					  <td>
					  <input id="type" class="easyui-combobox" style="width: 170px; "   name="type"   
    data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPermisson.type}',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sys_permission&columnName=resource_type&parentKey=1f5057652ea14d9887193cc6f3a38fa6'" />  
                
					</td>
					
				</tr>
				<tr>
					
					<th>资源路径：</th>
					<td>
					<form:input path="url"  placeholder="请输入资源路径" class="f1 easyui-textbox " style="width: 170px; "/>
					</td>
					<th>是否可用：</th>
					<td>
					<input id="available" class="easyui-combobox" style="width: 170px; "   name="available"   
    data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysPermisson.available}',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=yes_no&parentKey=169ef30f5332428da7ac7bb1d576ac3d'" />  
                
					</td>
					
				</tr>
				<tr>
					
					<th>菜单图标：</th>
					<td>
					<form:input path="icon" class="f1 easyui-textbox " style="width: 170px; " />
					</td>
					<th>排序：</th>
					<td>
					<form:input path="perSort"  class="easyui-numberspinner" style="width: 170px; " required="required" data-options="editable:true"/>
					</td>
					
				</tr>
				<tr>
					
                    
                    <th><span class="c-red">*</span>上级资源：</th>
					<td colspan="3">
					<select id="parentId" name="parentId" class="easyui-combotree" 
    data-options="url:'${ctx}/sys/sysPermisson/selectDownTree',editable:true,value:'${sysPermisson.parentId }'" style="width: 170px; ">
</select>
  <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#parentId').combotree('clear');" >清空</a>
					</td>
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
    </form:form>
    <script>
        function submitForm(){
        	 $('#sysPermissonForm').form('submit');
        }
        function clearForm(){
            $('#sysPermissonForm').form('clear');
        }
        $(function() {
        	
        	//$("#uploader").powerWebUpload({ auto: true,fileNumLimit:5,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
        	
        	$('#sysPermissonForm').form({
        		url:'${ctx}/sys/sysPermisson/save',
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
        				
        				 parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
