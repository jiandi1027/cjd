<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/homepage/draft/update" method="post" id="draft">
 <input type="hidden" name="id" id="id" value=" ${sender.id }"/>
     <div class="easyui-panel" title="" style="width:100%;margin-bottom: 30px;padding:5px;">
            
             <table width="100%" class="grid">
                <tr width="100%">
                    <th width="10%">公文标题：</th>
					<td style="border-style:none">${sender.documentTitle }</td>
					<td style="width:10%;border:0px;"></td>
					<td style="width:40%;border:0px;"></td>

                </tr>
                <tr width="100%">
                	<th width="10%">发件单位：</th>
					<td >${sender.sendUnit }</td>
					<th width="10%">收件单位：</th>
					<td >${sender.receiverUnit }</td>
                </tr>
                <tr width="100%">
                	<th width="10%">公文附件：</th>
							<td  width="23%" style="border-right-style:none" colspan="3">
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
				<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
                </tr>
                <tr>
                	<th width="10%">公文内容：</th>
							<td colspan="3"><input class="easyui-textbox" data-options="multiline:true" value="${receipt.flle1 }" style="width:400px;height:100px"> </td>
                
                </tr>
                
            </table>
    </div> 
	
 </form>
<script>
   $(function() {
   	$('#draft').form({
   		url:'${ctx}/homepage/draft/update',
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
   				 parent.$.messager.alert('错误', data.msg, 'error');
   			}
   			
   		}
   	});	
   });
   
</script>

