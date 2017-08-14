<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
<form id="interviewSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
				<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="interviewf"/>
	        	</c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">走&nbsp;&nbsp;访&nbsp;&nbsp;人：</td>
						<td><input  name="interviewPerson" id="searchInterviewPerson" 
					class = "easyui-combobox" data-options='panelHeight : "auto",panelMaxHeight : "200"' /></td>
					</tr>
					<tr>
						<td class="search-title">走访起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">走访截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#interviewf').datagrid('load' ,$.serializeObject($('#interviewSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#interviewSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>	
	<div region="center" border="false">
		<table class="easyui-datagrid" id="interviewf" title="走访登记列表"
			style="height: 400px;" data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#interviewToolbar',
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/dailymgr/interview/list',method:'post',onLoadSuccess:function (data) {
				$('.organization-easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
            }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th style="width: 10%;" data-options="field:'culpritName',align:'center'" editor="text">矫正对象</th>
					<th style="width: 20%;" data-options="field:'groupName',align:'center'" editor="text">司法所</th>
					<th style="width: 20%;" data-options="field:'interviewPerson',align:'center'" editor="text">走访人</th>
					<th style="width: 23%;" data-options="field:'interviewDate',align:'center',sortable:true,formatter:Common.formatDate" >走访日期</th>
					<th data-options="field:'_opt',align:'center',formatter:formatOper" style="width:25%">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="interviewToolbar" style="display: none;">
       	<a onclick="addInterview();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'" >新增</a>
	</div>
</div>
<script type="text/javascript">
/* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
/* 
function placeholderPic(){
 var w = document.documentElement.offsetWidth;
 document.documentElement.style.fontSize=w/20+'px';
}
placeholderPic();
window.onresize=function(){
 placeholderPic();
} */
function addInterview(){
	 parent.$.modalDialog({
        title : '新增走访登记',
        iconCls:'fi-plus icon-green',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/dailymgr/interview/add',
        resizable : true,
        maximizable:true, 
        buttons : [{
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#interviewf').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#interviewfrom');
                f.submit();
            }
        }, {
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
	        	var f = parent.$.modalDialog.handler.find('#interviewfrom');
	        	f.get(0).reset(); //清空表单数据 
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           		parent.$.modalDialog.handler.dialog('close');
            }
        }]
    });
}

function batchDeleteInterview(){
	var arr = $('#investigate_list').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} 
	else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				var ids = '';
				for (var i = 0; i < arr.length; i++) {
					if (i == 0) {
						ids += arr[i].id
					} else {
						ids += "," + arr[i].id;
					}
				}
				//ids = ids.substring(0, ids.length - 1);
				$.post('${ctx}/dailymgr/interview/batchDelete', {
					ids : ids
				}, function(result) {
					//1 刷新数据表格 
					$('#investigate_list').datagrid('reload');
					//2 清空idField   
					$('#investigate_list').datagrid('uncheckAll');
					//3 给提示信息 
					$.messager.show({
						title : '提示信息!',
						msg : '操作成功!'
					});
				});
			} else {
				return;
			}
		});
	}
}

//js方法：序列化表单 			
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
	var space='&nbsp;';
	var operation='';
	var operation='<a href="javascript:void(0);" class= "organization-easyui-linkbutton-info" onclick="interviewDetail(\''+row.id+'\')"></a>';
	var operation=operation + space +'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="editInterview(\''+row.id+'\')"></a>';
    return operation;
} 

function interviewDetail(id){
	parent.$.modalDialog({
		title : '走访登记详情',
		iconCls:'fi-plus icon-green',
		width : 1000,
        height : 500,
		href : '${ctx}/dailymgr/interview/detail?id='+id,
		maximizable:true, 
		resizable : true,
		buttons : [{
		    text : '关闭',
		    iconCls:'fi-x icon-blue',
		    handler : function() {
		    	parent.$.modalDialog.handler.dialog('close');
		    }
		}]
	});
} 
	
function editInterview(id){
	parent.$.modalDialog({
		title : '修改走访登记',
      	iconCls:'fi-plus icon-green',
      	width : sy.getBrowerWidth()-270,
      	height : sy.getBrowerHeight()-130,
      	href : '${ctx}/dailymgr/interview/add?id='+id,
      	maximizable:true, 
      	resizable : true,
      	buttons : [{
        	text : '保存',
        	iconCls:'fi-save icon-blue',
        	handler : function() {
        	    parent.$.modalDialog.openner_dataGrid = $('#interviewf').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	var f = parent.$.modalDialog.handler.find('#interviewfrom');
            	f.submit();
          	}
		},{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#interviewfrom');
           	 f.get(0).reset(); //清空表单数据 
            }
        },{
        	text : '关闭',
        	iconCls:'fi-x icon-blue',
        	handler : function() {
          		parent.$.modalDialog.handler.dialog('close');
        	}
      	}]
	});
}

	
function deleteInterview(id){
	 $.messager.confirm('提示信息', '确认删除?', function(r) {
 		if (r) {
			$.post('${ctx}/dailymgr/interview/delete', {
				id : id
			}, function(result) {
				//1 刷新数据表格 
				$('#interviewf').datagrid('reload');
				//2 清空idField   
				$('#interviewf').datagrid('uncheckAll');
				//3 给提示信息 
				$.messager.show({
					title : '提示信息!',
					msg : '操作成功!'
				});
			});
		}
	});
} 
	

//timestamp转换date
var Common = {
    formatDate: function (value) {
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }
        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
    }
}

$('#searchInterviewPerson').combobox({    
	mode : 'remote',
    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${fns:getSysAccount().groupId }',    
    valueField:'id',    
    textField:'accountname'
});
</script>