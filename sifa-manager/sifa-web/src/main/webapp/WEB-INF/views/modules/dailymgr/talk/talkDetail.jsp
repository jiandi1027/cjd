<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>新增谈话教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/talk/save" method="post" id="culpritInfo">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${talk.culpritId}" formId="culpritInfo" isSelect="false"/>
     <div class="easyui-panel" title="谈话教育信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden"  name="id" id="paroleId" value="${talk.id }"/>
            <table width="100%">
                <tr>
                    <td width = "5%">谈话人:</td>
                    <td width = "20%"><input readonly= 'readonly' value="${talk.talkor }" required=true missingMessage="谈话人不能为空！" name="talkor" id="talkor" class="f1 easyui-textbox"/></td>
                     <td width = "5%">谈话地点:</td>
                    <td><input readonly= 'readonly' value="${talk.place }" required=true missingMessage="谈话地点不能为空！" name="place" id="place"  class="f1 easyui-textbox"/></td>
                </tr>
                 <tr>
                    <td width = "5%">谈话日期:</td>
                    <td width = "20%"><input readonly= 'readonly' value="${talk.talkTime }" name="talkTime"
                    editable="false" class= "easyui-datebox" /></td>
                     <td width = "5%">记录人:</td>
                    <td><input readonly= 'readonly' value="${talk.recorder }" name="recorder" id="recorder" class="f1 easyui-textbox" /></td>
                </tr>
                  <tr>
                    <td width = "10%">谈话开始时间:</td>
                    <td width = "23.4%"><input readonly= 'readonly' value="<fmt:formatDate value='${talk.talkStartTime}' pattern="yyyy-MM-dd HH:mm:ss" />" required=true missingMessage="谈话开始时间不能为空！" name="talkStartTime"
                    editable="false" class="easyui-datetimebox" /></td>
                     <td width = "10%">谈话结束时间:</td>
                    <td><input readonly= 'readonly' value="<fmt:formatDate value='${talk.talkEndTime}' pattern="yyyy-MM-dd HH:mm:ss" />" required=true  missingMessage="谈话结束时间不能为空！" class="easyui-datetimebox" name="talkEndTime" 
					editable="false" /></td>
                </tr>
                <tr rowspan="5">
                    <td>谈话记录：</td>
							<td colspan="5"><input readonly= 'readonly' type="text" name="record"   multiline=true 
								class="f1 easyui-textbox" value="${talk.record }"  style="width:49%;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td>备注：</td>
							<td colspan="5"><input readonly= 'readonly' type="text" name="note"  multiline=true 
								class="f1 easyui-textbox" value="${talk.note }" style="width:49%;height:80px;"/></td>
                </tr>
            </table>           
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" >打印《社区矫正人员个别谈话教育登记表》</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div>
    </form>
    <script>
    var reportType;
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function back(){
        	parent.location.reload();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/dailymgr/talk/save',
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
