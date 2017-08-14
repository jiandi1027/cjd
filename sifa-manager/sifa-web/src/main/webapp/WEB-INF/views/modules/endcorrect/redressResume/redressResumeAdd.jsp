<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊原因恢复矫正</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/endcorrect/redressResume/save" method="post" id="culpritInfo">
     <c:choose>
 		<c:when test="${empty redressResume.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressResume.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="特殊原因恢复矫正" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
					<td><span class="c-red">*</span>矫正恢复时间:</td>
							<td><input type="text" name="redressStartTime" required=true missingMessage="矫正恢复时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td><span class="c-red">*</span>矫正结束时间:</td>
							<td><input type="text" name="redressEndTime" required=true missingMessage="矫正结束时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td>处理部门:</td>
							<td><input type="text" name="examineUnit"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>恢复矫正原因:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="reason" name="reason" style="height:50px;"required=true missingMessage="恢复矫正原因不能为空!"
								class="f1 easyui-textbox"></textarea></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>主要事实:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="fact" name="fact" style="height:50px;"required=true missingMessage="主要事实不能为空!"
								class="f1 easyui-textbox"></textarea></td>
                </tr>
                <tr>
                <td align="center" colspan="5">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
                </td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){
        		
        		if($('#culpritInfo').form('validate')==true){
        			$('#culpritInfo').submit();
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
