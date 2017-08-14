<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>帮困解难</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/helpDifficulty/save" method="post" id="culpritInfo">
 <input type="hidden" name="id" id="id" value="${helpDifficulty.id}"/>
 	<c:choose>
 		<c:when test="${empty helpDifficulty.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${helpDifficulty.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
   
     <div class="easyui-panel" title="帮困解难信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
        
					<td width="10%"><span class="c-red">*</span>解决与否:</td>
							<td ><select id="dicSolveStatusKey" class="f1 easyui-combobox" name="dicSolveStatusKey" 
							required="true"		style="width: 400px;">
									<option value="已解决">已解决</option>
									<option value="未解决">未解决</option>
							
					</select></td>
							<td width="10%">解决方式:</td>
							<td ><input type="text" name="dicSolveTypeKey" value="${helpDifficulty.dicSolveTypeKey }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
					<td>监督人:</td>
							<td ><input type="text" name="monitorSolve" value="${helpDifficulty.monitorSolve }" required=true missingMessage="不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td>解决时间::</td>
							<td><input type="text" name="solveDate" required=true missingMessage="时间不能为空!"
								class="f1 easyui-datetimebox" value="<fmt:formatDate value="${helpDifficulty.solveDate }"
									pattern="yyyy-MM-dd HH:mm:ss" />"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>补助金额:</td>
							<td ><input type="text" name="subsidy" value="${helpDifficulty.subsidy }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
					<td><span class="c-red">*</span>帮困解难机关:</td>
							<td><input type="text" name="solveUnit" value="${helpDifficulty.solveUnit }" required=true missingMessage="不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                	<td>困难情况记录:</td>
							<td ><input class="f1 easyui-textbox"
							data-options="multiline:true" name="description" required=true 
							style="width: 300px; height: 100px" value="${helpDifficulty.description }" ></td>
                	<td>备注:</td>
							<td ><input class="f1 easyui-textbox"
							data-options="multiline:true" name="note" required=true 
							style="width: 300px; height: 100px" value="${helpDifficulty.note }" ></td>
                </tr>
                <tr>
					<td align="center" colspan="6"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="submitForm()">提交</a> <a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()">清楚</a></td>
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
        		url:'${ctx}/dailymgr/helpDifficulty/save',
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
