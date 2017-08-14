<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/askLeave/save" method="post" id="culpritInfo">
 <input type="hidden" name="id" id="id" value="${askLeave.id}"/>
 	<c:choose>
 		<c:when test="${empty askLeave.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${askLeave.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
   
     <div class="easyui-panel" title="请假信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td width="10%"><span class="c-red">*</span>申请日期:</td>
							<td><input type="text" name="doDate" id="doDate" value="<fmt:formatDate value="${askLeave.doDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />" required=true missingMessage="申请日期不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td width="10%"><span class="c-red">*</span>外出目的地:</td>
							<td ><input type="text" name="place" value="${askLeave.place }" required=true missingMessage="外出目的地不能为空!"
								class="f1 easyui-textbox" /></td>
							<td width="10%">经手人:</td>
							<td ><input type="text" name="approvePerson" value="${askLeave.approvePerson }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>请假开始时间:</td>
							<td><input type="text" name="beginDate" required=true missingMessage="请假开始时间不能为空!"
								class="f1 easyui-datetimebox" value="<fmt:formatDate value="${askLeave.beginDate }"
									pattern="yyyy-MM-dd HH:mm:ss" />"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td><span class="c-red">*</span>请假截止时间:</td>
							<td><input type="text" name="endDate" value="<fmt:formatDate value="${askLeave.endDate }"
									pattern="yyyy-MM-dd HH:mm:ss" />" required=true missingMessage="请假截止时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td><span class="c-red">*</span>请假理由:</td>
							<td><input type="text" name="reason" value="${askLeave.reason }" required=true missingMessage="请假理由不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>活动范围:</td>
							<td colspan="5"><input type="text" name="activeArea" value="${askLeave.activeArea }" required=true missingMessage="活动范围不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="被访问者基本信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                    <td width="10%">被访问者姓名:</td>
							<td><input type="text" name="askName" value="${askLeave.askName }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
							<td width="10%">与矫正人关系:</td>
							<td><input type="text" name="relation" value="${askLeave.relation }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
					<td width="10%">职业及工作单位:</td>
							<td><input type="text" name="job" id="job" value="${askLeave.job }"
								class="f1 easyui-textbox easyui-validatebox" /></td>
                </tr>
                <tr>
                   <td>政治面貌:</td>
							<td><input type="text" name="dicPoliticStatusKey"
								class="f1 easyui-textbox easyui-validatebox" value="${askLeave.dicPoliticStatusKey }"/></td>
				<td>家庭住址:</td>
							<td colspan="3"><input type="text" name="askAddress"
								class="f1 easyui-textbox easyui-validatebox" value="${askLeave.askAddress}"/></td>
				
                </tr>
                <tr>
                </tr>
                <tr>
                	<td align="center" colspan="6">
                	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清楚</a>
                	</td>
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
        		url:'${ctx}/dailymgr/askLeave/save',
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
