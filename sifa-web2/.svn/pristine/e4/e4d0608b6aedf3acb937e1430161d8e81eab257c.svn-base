<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/dailymgr/askLeave/save" method="post" id="culpritInfo" enctype="multipart/form-data" >
   
     	<c:choose>
 		<c:when test="${empty reducePenalty.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${reducePenalty.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
     	<input name="id" value="${reducePenalty.id}" type="hidden"/>
            <table width="100%" class="grid">
            	<tr>
                   <th width="10%"><span class="c-red">*</span>减刑年限：</th>
					<td>
						<input name="reduceTime" class="easyui-textbox" required=true value="${reducePenalty.reduceTime}"/>
					</td>
				</tr>
				<tr>
					<th ><span class="c-red">*</span>表现概括：</th>
					<td >
					<textArea class="easyui-validatebox"   style="width:685px;height:130px;"
					data-options="multiline:true" name="actions" required=true id="actions"
					 onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300">${reducePenalty.actions }</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				   </td>
				</tr>
				<tr>
                   <th width="10%"><span class="c-red"></span>附件上传：</th>
					<td >
						<div id="endCasePat"></div>
					</td>
				</tr>
				 <c:if test="${not empty reducePenalty.id}">
                <tr>
					<th>已上传结案报告：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
			</table>
    </div>
 </form>
<script>
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
       	
   	   $(function() {
		 $("#endCasePat").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});

   	       	$('#culpritInfo').form({
   	       		url:'${ctx}/rewardspunishment/reducePenalty/save',
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

