<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/dailymgr/helpDifficulty/save" method="post"
	id="helpDifficulty">

	<input type="hidden" name="id" id="id" value=" ${helpDifficulty.id }" />
	<c:choose>
		<c:when test="${empty helpDifficulty.culpritId }">

			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="true" hiddenValue=""
				formId="culpritInfo" isSelect="true" />
		</c:when>
		<c:otherwise>

			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="false"
				hiddenValue="${helpDifficulty.culpritId}" formId="culpritInfo"
				isSelect="false" />
		</c:otherwise>
	</c:choose>

	<div class="easyui-panel" title="帮困解难信息" style="padding:5px;width:100%" >
		<table width="100%" class="grid" >
			<tr>

				<th width="10%">解决与否：</th>
				<td width="23%">${helpDifficulty.dicSolveStatusKey }</td>
				<th width="10%">解决方式：</th>
				<td width="23%">${helpDifficulty.dicSolveTypeKey }
					</td>
				<th width="10%"><span class="c-red"></span>监督人：</th>
				<td width="23%">${helpDifficulty.monitorSolve }</td>
			</tr>
			<tr>
				<th><span class="c-red"></span>解决时间：</th>
				<td>
					<fmt:formatDate value="${helpDifficulty.solveDate }"
									pattern="yyyy-MM-dd" />
				</td>
				<th>补助金额：</th>
				<td>${helpDifficulty.subsidy }
					</td>
				<th><span class="c-red"></span>解决单位：</th>
				<td>${helpDifficulty.solveUnit }</td>
			</tr>
			<tr>
				<th>困难情况记录：</th>
				<td colspan="5"><textArea class="f1 easyui-validatebox" readonly="readonly"
						data-options="multiline:true" name="description" id='description'
						style="width: 40%; height: 60px; overflow: hidden;"
						onkeydown='textarealength(this,300)'
						onMouseOut="textarealength(this,200)"
						onKeyUp="textarealength(this,300)" maxlength="300">${helpDifficulty.description }</textArea>
				</td>
			<tr>
				<th>备注：</th>
				<td colspan="5"><textArea class="f1 easyui-validatebox" readonly="readonly"
						data-options="multiline:true" name="note" id='note'
						style="width: 40%; height: 60px; overflow: hidden;"
						onMouseOut="textarealength(this,200)"
						onkeydown='textarealength(this,300)'
						onKeyUp="textarealength(this,300)" maxlength="300">${helpDifficulty.note }</textArea>
					<br> </td>
			</tr>
		</table>
	</div>
</form>
<script>
    
    
        	
        	   $(function() {
        		  
               	$('#helpDifficulty').form({
               		url:'${ctx}/dailymgr/helpDifficulty/save',
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
               			progressClose();
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
        	 $('#helpDifficulty').form('load',arr[0]);
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

