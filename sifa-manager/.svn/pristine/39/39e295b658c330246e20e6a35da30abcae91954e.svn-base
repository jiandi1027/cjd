<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>假释</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/gradeChange/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty gradeChange.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${gradeChange.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="gradeChangeId" value="${gradeChange.id }"></input>
            <table width="100%">
                <tr>
                    <td>原监管等级:</td>
                    <td><input name="dicOldMonitorGradeKey" id="dicOldMonitorGradeKey" style="width:200px;" class="easyui-combobox" 
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000',panelHeight:'auto'"readonly="readonly" value="${culprit.dicGldxjbKey }"></input></td>
                    <td>新监管等级:</td>
                    <td><input name="dicMonitorGradeKey" id="dicMonitorGradeKey" class="easyui-combobox" required=true style="width:200px;"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000',panelHeight:'auto'"></input></td>
                </tr>
                <tr>
                    <td>确定监管等级缘由:</td>
                    <td><input id="dicChangeReasonKey" name="dicChangeReasonKey" class="easyui-combobox" required=true style="width:500px;"></td>
                </tr>
                 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>修改原因及依据：</td>
							<td colspan="5"><input type="text" name="accountOpinion"  multiline=true 
								class="f1 easyui-textbox" value=""  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>司法所意见：</td>
							<td colspan="5"><input type="text" name="SFSOpinion"multiline=true 
								class="f1 easyui-textbox" value="" style="width:800px;height:80px;"/></td>
                </tr>
                 <tr>
                    <td>相关材料:</td>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr> 
            </table>           
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">修改</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  </p>
    </div>
    </form>
    <script>
    	//保存上报
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/dailymgr/gradeChange/save',
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
        //$('#dicMonitorGradeKey').combobox('setValues', ['27003','27004','27005']);
        });
        


        $('#dicMonitorGradeKey').combobox({
        	onSelect: function(record){
        		var value;
        		if(record.id=='27003'){
        			value=121000;
        		}
        		if(record.id=='27004'){
        			value=83000;
        		}
        		if(record.id=='27005'){
        			value=88000;
        		}
        		$('#dicChangeReasonKey').combobox({
        			
        			url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey='+value,    
        			panelHeight:'250',
        			valueField:'id',    
        		    textField:'value'   
        		}); 
			}
		});
    </script>
</body>
</html>
