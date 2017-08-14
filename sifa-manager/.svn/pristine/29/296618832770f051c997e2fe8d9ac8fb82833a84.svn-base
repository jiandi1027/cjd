<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>假释</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/rewardspunishment/paroleController/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty parole.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${parole.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="假释相关信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="paroleId" value="${parole.id }"></input>
            <table width="100%">
                <tr>
                    <td>结案报告:</td>
                    <td><input type="file" multiple="multiple" name="endCasePath" id="endCasePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr>
                
                 <tr>
                    <td>证据材料:</td>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>法律依据：</td>
							<td colspan="5"><input type="text" name="reason" required=true  multiline=true missingMessage="简要描述不能为空!"
								class="f1 easyui-textbox" value="${parole.reason }"  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>表现概况：</td>
							<td colspan="5"><input type="text" name="actions" required=true multiline=true missingMessage="简要描述不能为空!"
								class="f1 easyui-textbox" value="${parole.actions }" style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                    <td>短信发送至：</td>
					<td></td>
                </tr>  
            </table>           
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm(0)">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm(1)">上报</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  </p>
    </div>
    </form>
    <script>
    var reportType;
    	//保存上报
        function submitForm(obj){
        	reportType=obj;
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/rewardspunishment/paroleController/save',
        		onSubmit:function(o){
        			o.reportType1=reportType;
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
