<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="#" method="post" id="culpritInfo">
 <input type="hidden" name="id" id="id" value="${monthlyPerformance.id}"/>
 	<c:choose>
 		<c:when test="${empty monthlyPerformance.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${monthlyPerformance.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="月度考核评议信息" style="width:99%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">评定月份:</th>
							<td><input readonly = 'readonly' type="text" class="f1 easyui-textbox" name="monthlyDate" id="monthlyDate" value="${monthlyPerformance.monthlyDate}"
									/></td>
                </tr>
                <tr>
                    <th>ni主要表现:</th>
							<td ><input readonly = 'readonly'type="text" name="mainShow" value="${monthlyPerformance.mainShow }"  
								class="f1 easyui-textbox" multiline="true" style = "width:50%"/></td>
                </tr>
                  <tr>
                    <th>其他情况:</th>
							<td ><input readonly = 'readonly' type="text" name="otherShow" value="${monthlyPerformance.otherShow }"  
								class="f1 easyui-textbox" multiline="true" style = "width:100px"/></td>
                </tr>
                <tr>
                <th>评议等级:</th>
                <td ><input readonly = 'readonly' type="text" name="otherShow" value="${monthlyPerformance.monthlyPerGradeId }"  
								class="f1 easyui-textbox"  style = "width:50%"/></td>
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
        		url:'${ctx}/rewardspunishment/monthlyPerformance/submitMonthly',
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
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			progressClose();
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
