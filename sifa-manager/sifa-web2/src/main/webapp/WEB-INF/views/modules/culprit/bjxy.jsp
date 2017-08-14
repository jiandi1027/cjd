<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="bjxy_saveform" method="post">
     <input name="culpritId" type="hidden" value="${culprit.id}"/>
        <table width="100%" class="grid">
        	<tr>
        		<th width="20%">姓名：</th>
        		<td width="80%">${culprit.name }</td>
        	</tr>
        	<!--  <tr>
        		<th>文档编号：</th>
        		<td><input class="easyui-textbox"  name="fileNo"/></td>
        	</tr> -->
        	<tr>
        		<th>文档类型：</th>
        		<td><input name="dicDocTypeKey"   value="48009" type="hidden">
        			社区矫正志愿者帮教协议书
        		</td>
        	</tr>
        	<tr>
        		<th>文书上传：</th>
        		<td><div id="legalDocsUpload"></div>
	     				<input type="hidden" name="legalDocsUploadPathName" id="legalDocsPathName" >
						<input type="hidden" name="legalDocsUploadPath" id="legalDocsPath" >
						<input type="hidden" name="legalDocsUploadUrl" id="legalDocsUrl" >
				</td>
        	</tr>
        	<c:if test="${not empty azbjList}">
        	<tr>
				<th>已上传文书：</th>
				<td>
					<c:forEach var="sysFile" items="${azbjList}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
				</td>
			</tr>
			</c:if>
         </table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="bjxy_saveform_btn" class="easyui-linkbutton" >提交</a>
</div>
   <script type="text/javascript">
$(function() {
	$("#legalDocsUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	$('#bjxy_saveform').form({
		url:'${ctx}/culpritinfo/culpritDoc/save',
		onSubmit:function(){
			 progressLoad();
			/*  var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid; */
		},
		success:function(data){
			progressClose();
			$.messager.show({
				title:'提示信息!' ,
				msg:'保存成功！'
			});
			 $('#bjxyDialog').dialog('close');
			 $.ajax({
					type : 'post',
					url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id=${culprit.id}&finshInfo8=1',
					dataType : 'json',
					cache : false,
					async : false, //同步请求
					success : function(result) {
						$('#finshInfo8').html('已完成');
					},
					error : function(result) {
						
					}
				});
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#bjxy_saveform_btn').click(function(){
		 setFilePathAndName('legalDocsUpload');
		$('#bjxy_saveform').form('submit');
	});
	
	

});

</script>