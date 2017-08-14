<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提请治安管理处罚</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/jiangcheng/securityPunishment/save" method="post" id="culpritInfo">
 <input type="hidden" name="id" id="id" value="${securityPunishment.id}"/>
 	<c:choose>
 		<c:when test="${empty securityPunishment.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
     <div class="easyui-panel" title="治安管理处罚相关信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                    <td width="10%"><span style="color: red;">*</span>违规违纪原因:</td>
					<td>
					<input id="reasonTypeId" name="reasonTypeId" class="easyui-combobox" required=true editable=false style="width:173px;" value="${securityPunishment.reasonTypeId}" 
    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_security_punishment&columnName=reason_type_id&parentKey=99000',panelHeight:'auto'">
					</td>
                </tr>
                <tr>
                	<td>
                	结案报告:
                	</td>
                	<td><a id="upload1" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
                </tr>
                <tr>
                	<td>
                	已上传附件:
                	</td>
                	<td>
                	</td>
                </tr>
                <tr>
                	<td>
                	证据材料:
                	</td>
					<td><a id="upload2" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
                </tr>
                <tr>
                	<td>
                	已上传附件:
                	</td>
                	<td>
                	</td>
                </tr>
                <tr>
                	<td>
                	简要违纪情况:
                	</td>
                	<td>
                	<input id="detailInfo" name="detailInfo" data-options="multiline:true" class="easyui-textbox" value="${securityPunishment.detailInfo}" style="width: 800px;height:50px;"/>
                	</td>
                </tr>
                <tr>
                	<td>
                	处理依据:
                	</td>
                	<td>
                	<input id="reason" name="reason" data-options="multiline:true" class="easyui-textbox" value="${securityPunishment.reason}" style="width: 800px;height:50px;"/>
                	</td>
                </tr>
                <tr>
                	<td align="center" colspan="6">
                	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
                	</td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/jiangcheng/securityPunishment/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				parent.location.reload();
        				
            			var index = parent.layer.getFrameIndex(window.name);
    					parent.layer.close(index);
    					
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
        
        $('#culpritId').combogrid({    
        	delay: 500,
        	 panelWidth: 300, 
        	 striped:true,
        	 panelHeight: 300,
    		mode: 'remote',  
			idField: 'id',
			textField: 'name',
			url: '${ctx}/culpritinfo/culprit/list',
			columns: [[
				{field:'name',title:'姓名',width:120,align:'center'},
				{field:'dicSexKey',title:'性别',width:80,align:'center'}
			]],
			fitColumns: true,
			pagination: true,           //是否分页  
        rownumbers: true,           //序号  
        collapsible: false,         //是否可折叠的  
        method: 'post',
        onSelect:function(record){
        	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
        	 $('#culpritInfo').form('load',arr[0]);
       	}
        }); 
        
        
      //取得分页组件对象  
        var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
        if (pager) {  
            $(pager).pagination({  
                pageSize: 10,               //每页显示的记录条数，默认为10  
                beforePageText: '第',       //页数文本框前显示的汉字  
                afterPageText: '',
                displayMsg: ''
            });  
        }  
        });
        
	
    </script>
</body>
</html>
