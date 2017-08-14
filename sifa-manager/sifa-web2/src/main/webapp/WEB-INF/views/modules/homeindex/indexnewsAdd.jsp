<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<script type="text/javascript" charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh_CN.js"></script>

<form action="${ctx}/homeindex/indexnews/save" method="post" id="indexnewsAddForm">
	<input type="hidden" name="id" id="id" value="${record.id}"/>
	
	<div class="easyui-panel" title="" style="width:99%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="10%"><span class="c-red">*</span>新闻标题:</th>
				<td width="90%">
					<input type="text" name="title" class="f1 easyui-textbox " value="${record.alias }" 
					data-options="validType:'length[0,20]'"/>
				</td>
	        </tr>
			
			<tr>
            	<th>新闻分类:</th>
            	<td><select name="type" class="easyui-combobox" style="width: 173px;" panelHeight="auto">
						<option value="">全部</option>
						<option value="1">文件通知</option>
						<option value="2">工作提醒</option>
						<option value="3">督察通报</option>
						<option value="4">工作动态</option>
						<option value="5">月重要工作</option>
						<option value="6">工作日志</option>
						<option value="7">大事记</option>
						<option value="8">学习园地</option>
					</select>
            	</td>
            </tr>
            <tr>
            	<th>新闻简介:</th>
            	<td><input type="text" name="alias" class="f1 easyui-textbox " value="${record.alias }" 
					data-options="validType:'length[0,50]'"/>
            	</td>
            </tr>
            <tr>
            	<th>具体内容:</th>
				<td>
				 
				<textarea id="pubcontent" name="pubcontent"  style="height:300px; width:80%;"></textarea>
				 
				 
				<%-- <textArea id="detailInfo" name="detailInfo" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${record.detailInfo}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p> --%>
				</td>
            </tr>
		</table>
    </div>
</form>
<script>

$(function() {
	KindEditor.ready(function(K) {
	    //window.editor = K.create('#pubcontent');
	    	KindEditor.ready(function(K) {
	    		K.create('#pubcontent'), {
					autoHeightMode : true,
					afterCreate : function() {
						this.loadPlugin('autoheight');
					}
				});
			
	});
	
	$('#indexnewsAddForm').form({
		url:'${ctx}/homeindex/indexnews/save',
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            }
			
            setFilePathAndName('endCaseUpload');
            setFilePathAndName('noteUpload');

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

//设置文件path和name
function setFilePathAndName(uploadname){
	var filename = "";
	var filepath = "";
	$('input[name=url]').each(function (index){
		if (this.id.indexOf(uploadname) > 0) {
			filepath += this.value + '/' +$('#hiddenInputFileName'+this.id.replace('hiddenInputUrl', '')).val() + ',';
			filename += $('#hiddenInput'+this.id.replace('hiddenInputUrl', '')).val() + ',';
		}
	});
	if (filepath.length > 0) {
		filepath = filepath.substr(0,filepath.length-1);
		$('#'+uploadname.replace('Upload','Path')).val(filepath);
	}
	if (filename.length > 0) {
		filename = filename.substr(0,filename.length-1);
		$('#'+uploadname.replace('Upload','PathName')).val(filename);
	}
}

</script>