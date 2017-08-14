<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="indexnewsSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'搜索'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
        		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
						<td><input name="name" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">新闻类型：</td>
						<td><select name="type" class="easyui-combobox" panelHeight="auto">
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
						<td class="search-title">创建起始：</td>
						<td><input name="searchStartDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
					<tr>
						<td class="search-title">创建截止：</td>
						<td><input name="searchEndDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#indexnews_list').datagrid('load' ,$.serializeObject($('#indexnewsSearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#indexnewsSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="indexnews_list" title="首页新闻列表" 
			data-options="singleSelect:false,fit:true,collapsible:true,striped:true,toolbar:'#indexnewsToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-map').linkbutton({text:'查看流程图',plain:true,iconCls:'fi-map icon-blue'});
                        $('.organization-easyui-linkbutton-play').linkbutton({text:'开始调查',plain:true,iconCls:'fi-play icon-blue'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'aa1',width:80,align:'center'">姓名</th>
				<th data-options="field:'aa2',width:80,align:'center',sortable:true,formatter:Common.formatDate">创建时间</th>
				<!-- 
				<th data-options="field:'sqrq',width:100,align:'center',sortable:true,formatter:Common.formatDate">申请时间</th>
				<th data-options="field:'aa',width:100,align:'center'">矫正状态</th>
				 -->
				<th data-options="field:'aa3',width:200,align:'center',formatter:function(value,rowData,rowIndex){
					return Common.formatDate(rowData.aa) + '至' + Common.formatDate(rowData.aa);
				}">类型</th>
				<th data-options="field:'_opt',width:250,align:'center',formatter:formatOper">操作</th> 
			</tr>
		</thead>
		</table>
	</div>
</div>

<div id="indexnewsToolbar" style="display: none;">
	<a onclick="addIndexnews();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
	<a onclick="batchDeleteRedressStop();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>
</div>

<script type="text/javascript">
function addIndexnews(){
	parent.$.modalDialog({
        title : '新增首页新闻',
        iconCls:'fi-plus icon-green',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/homeindex/indexnews/add',
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#indexnews_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#indexnewsInfo');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#indexnewsInfo');
           	 f.get(0).reset(); //清空表单数据 
            }
        }  ]
    });
}

function batchDeleteRedressStop(){
	var arr = $('#indexnews_list').datagrid('getSelections');
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
				$.post('${ctx}/endcorrect/indexnews/batchDelete', {
					ids : ids
				}, function(result) {
					//1 刷新数据表格 
					$('#indexnews_list').datagrid('reload');
					//2 清空idField   
					$('#indexnews_list').datagrid('uncheckAll');
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

function formatOper(val,row,index){  
	var operation='';
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" '
			+'onclick="indexnewsDetail(\''+row.id+'\')"></a>';
	}
	if(row.hasPermission==1){
		operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" '
		+'onclick="submitAuditindexnews(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/endcorrect/indexnews/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" '
			+'onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')"></a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" '
			+'onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')"></a>';
		}
	}
	
    return operation;
} 
function viewProcess(url){
	parent.$.modalDialog({
        title : '特殊情况矫正终止流程',
        iconCls:'fi-map icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : url
    });
}
function submitAuditindexnews(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '特殊情况矫正终止审批',
        iconCls:'fi-clipboard-pencil icon-blue',
        width : 800,
        height : 450,
        href : "${ctx}/endcorrect/indexnews/indexnewsAudit?id=" + id + "&taskId=" + taskId + "&auditType=" + auditType + "&processInstanceId=" + processId,
        buttons : [ {
            text : '提交',
            iconCls:'fi-clipboard-pencil icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#indexnews_list').datagrid(); //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#indexnewsAuditBtn');
                f.click();
            }
        } ]
    });
}
function indexnewsDetail(id){
	var url = '${ctx}/endcorrect/indexnews/detail?id=' + id;
	parent.$.modalDialog({
        title : '特殊情况矫正终止流程详情',
        iconCls:'fi-info icon-green',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : url,
        buttons : [ {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	$('#indexnews_list').datagrid().datagrid('reload');
            	parent.$.modalDialog.handler.dialog('close');
            }
        } ]
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
</script>
</body>
</html>