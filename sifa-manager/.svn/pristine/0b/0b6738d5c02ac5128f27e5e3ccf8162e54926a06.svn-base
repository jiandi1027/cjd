<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>新增走访登记</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/endcorrect/death/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty death.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${interview.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="死亡登记信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="paroleId" />
            <table width="100%">
				<tr>
					<td width="10%">死亡时间:</td>
					<td width="23.5%"><input 
						name="deathlTime" editable="false" class="easyui-datetimebox" /></td>
				<tr rowspan="5">
                    <td>死亡原因：</td>
							<td colspan="5"><input type="text" name="deathReason"   multiline=true 
								class="f1 easyui-textbox" value="${death.deathReason }"  style="width:49%;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td>具体死亡情况：</td>
							<td colspan="5"><input type="text" name="situation"   multiline=true 
								class="f1 easyui-textbox" value="${death.situation }"  style="width:49%;height:80px;"/></td>
                </tr> 
                <tr >
                    <td>死亡通知书：</td>
							<td><input type="text" name="file"  id = "file" 
								class="f1 easyui-textbox"  /></td>
								<td><input type="button" name="file" value = "上传" id = "btn1"  
								class="easyui-linkbutton"   /></td>
                </tr> 
            </table>           
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">新增</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
			  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div>
    </form>
   <script type="text/javascript">
    var reportType;
    
    $("#btn1").click(function(){
    	alert(1);
    	var f = $("#file").val();
    	  $.ajax({
              type: "post",
              url: "${ctx}/statistics/upload",
              data:{file:f},
              dataType: "json",
              async: false,
              success: function(data){
            	  
              }
            	
          });
    });
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/endcorrect/death/save',
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
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        			}
        			
        		}
        	});	
        
        	  function back(){
              	parent.location.reload();
      			var index = parent.layer.getFrameIndex(window.name);
      			parent.layer.close(index);
              }
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
        $('.easyui-combobox').combo({    
            edit:false
        });  
	
    </script>
</body>
</html>
