<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">

$(function() {
	$('#searchSystemFileFormbtn').click(
			function() {
				$('#systemFile_list_content').datagrid('load',
						serializeForm($('#systemFileSearchForm')));
			});

	$('#cleanSystemFileFormSearch').click(function () {
		$('#systemFile_list_content').datagrid('load', {});
		$('#systemFileSearchForm').form('clear');
		
	});
});

function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(),
			function(index) {
				if (obj[this['name']]) {
					obj[this['name']] = obj[this['name']] + ','
							+ this['value'];
				} else {
					obj[this['name']] = this['value'];
				}
			});
	return obj;
}


function formatOper(val,row,index){
    var space = '&nbsp;';
    var operation='<a href="javascript:void(0);" class="systemFile-down"  onclick="downRegulation(\''+row.id+'\')">下载</a>'
    +space+'<a href="javascript:void(0);" class="systemFile-del"  onclick="deleteRegulation(\''+row.id+'\')">删除</a>';
    return operation;
} 

//下载
function downRegulation(id){
	window.location.href='${ctx}/sys/file/download?id='+id;
}

function deleteRegulation(id){
	sysFileDel(id);
	$('#systemFile_list_content').datagrid('reload');
}

//增加
function addSystemFile(){
	 parent.$.modalDialog({
         title : '上传制度文件',
         iconCls:'fi-plus icon-green',
         width : 600,
         height : 250,
         resizable:true,
         maximizable:true,
         href : '${ctx}/datacenter/systemFile/form',
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#systemFile_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#systemFileInfo');
                 f.submit();
             }
         },{
             text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         }  ]
     });
}

</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	 <form id="systemFileSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
          <div class="easyui-panel search-form" data-options="fit:true,border:false" style="width:100%;">
			<table>
				<tr>
				<td class="search-title">资料名称：</td>
					<td><input name="originName" class="easyui-textbox" /></td>
				</tr>
				<tr>
				<td class="search-title">上传起始：</td>
					<td><input name="searchStartDate" class="Wdate easyui-validatebox" 
					onfocus="var graspTimeEnd=$dp.$('graspTimeEnd');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd  HH:mm'})" editable="false" /></td>
				</tr>
				<tr>
				<td class="search-title">上传截至：</td>
					<td><input name="searchEndDate" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd  HH:mm'})"  editable="false"  /></td>
				</tr>
			</table>
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" id="searchSystemFileFormbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanSystemFileFormSearch" iconCls="icon-undo" >清空</a></div>
		</div>
	</div>
	</form>
    <div data-options="region:'center',border:true" >
        <table class="easyui-datagrid" id="systemFile_list_content" title="制度文件列表"
			data-options="singleSelect:true,fit:true,toolbar:'#systemFile_toolbar',rownumbers: true,
			collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/datacenter/systemFile/list',method:'post',onLoadSuccess:function (data) {
                    	$('.systemFile-down').linkbutton({text:'下载',plain:true,iconCls:'fi-arrow-down icon-blue'});
                    	$('.systemFile-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'originName',width:'60%',align:'center'">资料名称</th>
				 	<th data-options="field:'created',width:'20%',align:'center'">上传时间</th>
				 	<th data-options="field:'_opt',width:'18%',align:'center',formatter:formatOper">操作</th>  
				</tr>
			</thead>
		</table>
    </div>
</div>
<div id="systemFile_toolbar" style="display: none;">
        <a onclick="addSystemFile();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">上传</a>
</div>



