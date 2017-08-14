<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/endcorrect/detached/save" method="post" id="culpritInfo">
    <c:choose>
 		<c:when test="${empty detached.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${detached.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="脱管信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="detachedId" id="detachedId" value="${detached.id }"></input>
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>脱管日期：</td>
							<td><input type="text" name="detachedTime" id="detachedTime" required=true missingMessage="脱管日期不能为空!" value="${detached.detachedTime}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
					<td><span class="c-red">*</span>通报民警姓名：</td>
							<td><input type="text" name="policeName" required=true missingMessage="民警姓名不能为空!" value="${detached.policeName}"
								class="f1 easyui-textbox" /></td>
					<td><span class="c-red">*</span>通报机关名称：</td>
							<td><input type="text" name="reportUnit" required=true missingMessage="通报机关名称不能为空!" value="${detached.reportUnit}"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>通报公安机关时间：</td>
							<td><input type="text" name="reportTime" required=true missingMessage="通报公安时间不能为空!" value="${detached.reportTime}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
							<td><span class="c-red">*</span>掌握信息时间：</td>
							<td><input type="text" name="graspTime" required=true missingMessage="掌握信息时间不能为空!" value="${detached.graspTime}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
					<td><span class="c-red">*</span>掌握信息方式：</td>
							<td><select  name="dicGraspTypeKey" required=true missingMessage="请假理由不能为空!" value="${detached.dicGraspTypeKey}"
								class="easyui-combobox">
									<option>未按时报到</option>   
							    	<option>未按时电话报到</option>   
							    	<option>未按时学习劳动</option>   
							   	 	<option>公安部门通报</option>   
							    	<option>与派出所信息核查核对</option>
							    	<option>群众举报</option>
							    	<option>走访排查</option>
							    	<option>其他</option>   
								</select ></td>
                </tr>
                <tr>
                    <td>通报人:</td>
							<td><input type="text" name="reportPerson" value="${detached.reportPerson}"
								class="f1 easyui-textbox" /></td>
                </tr>
                 <tr rowspan="5">
                    <td><span class="c-red">*</span>简要描述情况：</td>
							<td colspan="5"><input type="text" name="description" required=true missingMessage="简要描述不能为空!" value="${detached.description}"
								class="f1 easyui-textbox"  style="width:800px;height:80px;"/></td>
                </tr> 
                
            </table>
    </div>
    <div class="easyui-panel" title="短信通知" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                    <td>短信发送至：</td>
                </tr>
            </table>
    </div>
     <div align="center">
          <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
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
        		url:'${ctx}/endcorrect/detached/save',
        		onSubmit:function(o){
        			o.id=$('#detachedId').val();
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
