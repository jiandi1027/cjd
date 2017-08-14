<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form action="${ctx}/homepage/draft/modify" method="post"
	id="culpritInfo">
	<input type="hidden" name="id" id="id" value=" ${sender.id }"/>
	<div class="easyui-panel" title="" style="width: 100%;  margin-bottom: 10px;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>公文标题：</th>
				<td width="80%"><input type="text" name="documentTitle"
					class="f1 easyui-textbox" style="width: 280px;" required=true value="${sender.documentTitle }" 
					missingMessage="短信内容不能为空!" /></td>

			</tr>
			<tr>
				<th><span class="c-red">*</span>部门选择：</th> 
				<td>
					<select id="receiverUnit" name="receiverUnit" class="easyui-combotree" style="width: 280px;" required = true 
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree'" >
						<option value="${sender.receiverUnit }">${sender.receiverUnit }</option>
					</select>
				</td>
			
			</tr>
		
			<tr>
				<th><span class="c-red">*</span>发件内容：</th>
				<td>
				<textArea class="f1 easyui-validatebox"
					data-options="multiline:true" name="flle1" required=true
					style="width: 280px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300">${sender.flle1 }</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</td>
			</tr>
			<tr>
				<th><span class="c-red"></span>上传附件：</th>
				<td >
					<div id="file2"></div>
				</td>
			</tr>
		</table>
	</div>

</form>
<script>

        $(function() {
   		 $("#file2").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});

        	$('#culpritInfo').form({
        		url:'${ctx}/homepage/draft/modify',
        		onSubmit:function(o){
		        	
        			 progressLoad();
        			 var isValid = $(this).form('validate');
                     if (!isValid) {
                         progressClose();
                     }
                     return isValid;
        		},
        		success:function(data){
        			 progressClose();
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', data.msg, 'error');
        			}
        			
        		}
        	});	
        });
        
	
    </script>
