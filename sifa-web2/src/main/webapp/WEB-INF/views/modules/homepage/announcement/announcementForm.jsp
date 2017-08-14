<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form action="${ctx}/homepage/announcement/save" method="post"
	id="culpritInfo">




	<div class="easyui-panel" title="" style="width:100%; margin-bottom:10px; padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>公告标题：</th>
				<td width="80%"><input name="announcementTopic" data-options="validType:'length[1,20]'" class="f1 easyui-textbox" required=true style="width: 280px;"/></td>
			</tr>
			<tr>
					<th><span class="c-red">*</span>部门选择：</th>
				<td><select id="placeTheUnit" name="placeTheUnit" required=true
					class="easyui-combotree"  style="width: 280px;"
					data-options="url:'${ctx}/sys/sysGroup/loadGroupTree'"">
				</select></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>公告内容：</th>
				<td><textArea class="f1 easyui-validatebox"
					data-options="multiline:true" name="announcement" required=true
					style="width: 280px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。</td>
			</tr>
			<tr>
				<th><span class="c-red"></span>上传附件：</th>
				<td >
					<div id="file2" ></div>
				</td>
			</tr>
		</table>
	</div>

</form>
<script>
   
        $(function() {
	    		 $("#file2").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
		
		        	$('#culpritInfo').form({
		        		url:'${ctx}/homepage/announcement/save',
		        		onSubmit:function(){
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
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	
         	});	
        }); 
  
        
	
    </script>
