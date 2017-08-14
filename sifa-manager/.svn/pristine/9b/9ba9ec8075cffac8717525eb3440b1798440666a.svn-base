<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊原因终止矫正信息</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/endcorrect/redressStop/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="矫正对象基本信息" style="width:100%;padding:10px;">
     		
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>姓名:</td>
                    <td colspan="5"><input name="culpritId" id="culpritId" class="easyui-combogrid" required=true
						 missingMessage="姓名不能为空!"
						 /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input name="dicSexKey" id="dicSexKey" class="f1 easyui-textbox" readonly="readonly" 
                    ></input></td>
                     <td>民族:</td>
                    <td><input name="nation" id="nation" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>身份证号:</td>
                    <td><input name="identification" id="identification" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td>曾用名:</td>
                    <td><input name="alias" id="alias" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>出生日期:</td>
                    <td><input name="birthday" id="birthday" class="f1 easyui-textbox"  readonly="readonly"></input></td>
                     <td>文化程度:</td>
                    <td><input name="dicWhcdKey" id="dicWhcdKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                
                 <tr>
                    <td>婚姻状况:</td>
                    <td><input name="dicHyzkKey" id="dicHyzkKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>职业:</td>
                    <td><input name="job" id="job" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>原政治面貌:</td>
                    <td><input name="oldPoliticStatusId" id="oldPoliticStatusId" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td><input name="origin" id="origin" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>户籍所在地:</td>
                    <td><input name="regResidence" id="regResidence" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>现居住地:</td>
                    <td><input name="addressDetail" id="addressDetail"  class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td>刑法执行类别:</td>
                    <td><input name="dicPenalTypeKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正开始时间:</td>
                    <td><input name="redressStartDate" id="redressStartDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正结束时间:</td>
                    <td><input name="redressEndDate" id="redressEndDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
               
            </table>
           
    </div>
    
   
     <div class="easyui-panel" title="特殊原因终止矫正信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>终止矫正日期：</td>
							<td><input type="text" name="jjrq" id="jjrq" required=true missingMessage="终止矫正日期不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                <tr rowspan="5">
                    <td><span class="c-red">*</span>终止矫正原因：</td>
							<td colspan="5"><input type="text" name="jjsm" required=true missingMessage="终止矫正原因不能为空!"
								class="f1 easyui-textbox"  style="width:800px;height:80px;"/></td>
                </tr> 
               <tr rowspan="5">
                    <td><span class="c-red">*</span>采取的措施和处理结果：</td>
							<td colspan="5"><input type="text" name="measure" 
								class="f1 easyui-textbox"  style="width:800px;height:80px;"/></td>
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
        		url:'${ctx}/endcorrect/redressStop/save',
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
