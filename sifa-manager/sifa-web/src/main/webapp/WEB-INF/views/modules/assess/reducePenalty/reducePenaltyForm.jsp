<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/askLeave/save" method="post" id="culpritInfo" enctype="multipart/form-data" >
    	<c:choose>
 		<c:when test="${empty revokeParole.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${revokeParole.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>结案报告:</td>
					<td><input name="endCasePat" type="file" multiple="multiple"
						 style="width:300px;"></td>
				<tr>
					<td><span class="c-red">*</span>证据上传:</td>
					<td><input name="evidencePat" type="file" multiple="multiple"
						 style="width:300px;"></td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>法律依据:</td>
					<td><input class="f1 easyui-textbox"
						data-options="multiline:true" name="reason" required=true 
						style="width: 300px; height: 100px"></td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>表现概括:</td>
					<td><input class="f1 easyui-textbox"
						data-options="multiline:true" name="actions" required=true 
						style="width: 300px; height: 100px"></td>
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
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/jiangcheng/reducePenalty/save',
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
