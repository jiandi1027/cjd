<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div class="easyui-panel" style="width:100%;">
    	<table class="easyui-datagrid" id="monitor_content1" style="height: 500px;"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarMonitor1,loadMsg: '数据正在加载,请耐心的等待...',
			fitColumns:true,url:'${ctx}/culpritinfo/Monitor/list?culpritId='+'${culprit.id }',method:'post',
			onLoadSuccess:function (data) {
                     $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                     $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                     $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'name',width:'15%',align:'center'">姓名</th>
					<th data-options="field:'dicSexKey',width:'10%',align:'center',formatter:function(value,row,index){
				if (value==10001){return '男';}else{return '女';}}">性别</th>
					<th data-options="field:'groupTypeId',width:'15%',align:'center' ">成员类别</th>
					<th data-options="field:'xzcylx',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){    
						    if(typeof(rowData.xzcylx) != 'undefined' && rowData.xzcylx!=''){
						    	 return sy.getDicValue('common_table','xzcylx',rowData.xzcylx,''); 
						    }   
						}" editor="text">成员类型</th>
					<th data-options="field:'org',width:'20%',align:'center'">单位</th>
					<th data-options="field:'prison',width:'23%',align:'center'" formatter="formatMonitor1">操作</th>
				</tr>
			</thead>
		</table>          
	</div> 

   <div id="monitor1" title="矫正小组" modal=true draggable=false closable=true resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width:600px;padding:5px;">
		<form id="monitorForm1" action="" method="post" autocomplete="off">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="" />
			<table width="100%" class="grid">
				<tr>
					<th width="15%"><span class="c-red">*</span>姓名：</th>
					<td width="35%"><input name="name" id="monitorName1" class="easyui-textbox" required=true data-options="validType:'chinaName'"/></td>
					<th width="15%"><span class="c-red">*</span>成员类型：</th>
					<td width="35%"><input name="xzcylx" id="xzcylx1" class="easyui-combobox" required=true value=""
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=38000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>工作单位：</th>
					<td><input name="org" class="easyui-textbox" id="monitorOrg1" /></td>
					<th>性别：</th>
					<td ><input name="dicSexKey" class="easyui-combobox" value="" id="monitorDicSexKey1"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>联系电话：</th>
					<td><input name="mobile" class="easyui-textbox"id="monitorMobile1" data-options="validType:'telno'"/></td>
					<th>学历：</th>
					<td><input name="qulifId" class="easyui-combobox" value="" id="monitorQulifId1"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>成员类别：</th>
					<td colspan="3">
						<select id="monitorRelation1" class="easyui-combobox" name="groupTypeId" style="width:173px;" required=true data-options="panelHeight:'auto',editable:false">   
						    <option value="组长">组长</option>   
						    <option value="成员">成员</option>    
						</select>  
					</td>
				</tr>
				<tr>
					<th>家庭住址：</th>
					<td colspan="3"><input name="address" class="easyui-textbox" id="monitorAddress1" style="width:400px;"/></td>
				</tr>
			</table>
		</form>
	</div>

<div id="printScheme"></div>
 <script type="text/javascript">
var culpritId='${culprit.id}';
var toolbarMonitor1 = [ {
	text : '新增',
	iconCls : 'fi-plus icon-green',
	handler : function() {
		$('#monitor1').dialog({
			title : '新增矫正小组',
			iconCls : 'fi-plus icon-green',
			buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){monitorSave1();}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){monitorClose1();}
			}]
		});
		$('#monitorName1').textbox('enable');
		$('#monitorOrg1').textbox('enable');
		$('#xzcylx1').combobox('enable');
		$('#monitorDicSexKey1').combobox('enable');
		$('#monitorQulifId1').combobox('enable');
		$('#monitorMobile1').textbox('enable');
		$('#monitorAddress1').textbox('enable');
		$('#monitorRelation1').textbox('enable');
		$('#monitorForm1').form('clear');
		$('#monitorForm1').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			culpritId : culpritId
		});
		$('#monitor1').dialog('open');
	}

}]
    
function monitorClose1(){
	$('#monitorForm1').form('clear');
	$('#monitor1').dialog('close');
	$('#monitorName1').textbox('enable');
	$('#monitorOrg1').textbox('enable');
	$('#xzcylx1').combobox('enable');
	$('#monitorDicSexKey1').combobox('enable');
	$('#monitorQulifId1').combobox('enable');
	$('#monitorMobile1').textbox('enable');
	$('#monitorAddress1').textbox('enable');
	$('#monitorRelation1').combobox('enable');
}

function monitorSave1(){
		if($('#monitorForm1').form('validate')){	
			$.ajax({
				type: 'post' ,
				url: '${ctx}/culpritinfo/Monitor/save',
				data:$('#monitorForm1').serialize(),
				dataType:'json',
				success:function(result){
					//1 关闭窗口
					$.messager.show({
    					title:'提示信息!',
    					msg:result.msg
    				});	
					$('#monitor1').dialog('close');
					$('#monitor_content1').datagrid('reload');
					$.ajax({
						type : 'post',
						url : '${ctx}/culpritinfo/culprit/updateFinshInfo?finshInfo4=1&id='+culpritId,
						dataType : 'json',
						cache : false,
						async : false, //同步请求
						success : function(result) {
							$('#finshInfo4').html('已完成');
						},
						error : function(result) {
							
						}
					});
				} ,
				error:function(result){
					$.meesager.show({
						title:'提示信息!'  ,  
						msg:result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title:'提示信息!' ,
				msg:'数据验证不通过'
			});
		}
}
    	
      
 function formatMonitor1(val,row,index){  
	 var space = '&nbsp;';
 	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="monitorDetail1(\''+index+'\')">详细</a>'+space; 
 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="monitorUpdate1(\''+index+'\')">修改</a>'+space;
 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="monitorDelete1(\''+row.id+'\')">删除</a>';

 	return operation;
}
 function monitorUpdate1(index){  
 	$('#monitor_content1').datagrid('selectRow',index); 
  	var arr = $('#monitor_content1').datagrid('getSelections');
  	$('#monitorName1').textbox('enable');
	$('#monitorOrg1').textbox('enable');
	$('#xzcylx1').combobox('enable');
	$('#monitorDicSexKey1').combobox('enable');
	$('#monitorQulifId1').combobox('enable');
	$('#monitorMobile1').textbox('enable');
	$('#monitorAddress1').textbox('enable');
	$('#monitorRelation1').combobox('enable');
 	$('#monitorForm1').form('clear')
 	$('#monitorForm1').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			culpritId : arr[0].culpritId,
			name : arr[0].name,
			xzcylx : arr[0].xzcylx,
			org : arr[0].org,
			dicSexKey : arr[0].dicSexKey,
			mobile : arr[0].mobile,
			qulifId : arr[0].qulifId,
			address :arr[0].address,
			groupTypeId:arr[0].groupTypeId
		});
 	$('#monitor1').dialog({
		title : '修改矫正小组',
		iconCls:'fi-pencil icon-blue',
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){monitorSave1();}
		},{
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){monitorClose1();}
		}]
	});
	$('#monitor1').dialog('open');
 	$('#monitor_content1').datagrid('unselectAll'); 
 }
 function monitorDetail1(index){
 	$('#monitor_content1').datagrid('selectRow',index); 
 	var arr = $('#monitor_content1').datagrid('getSelections');
 	$('#monitor1').dialog({
			title : '详细',
			iconCls:'fi-info icon-blue',
			buttons:[{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){monitorClose1();}
			}]
		});
 	$('#monitor1').dialog('open');
 	$('#monitorForm1').form('clear')
 	$('#monitorForm1').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			name : arr[0].name,
			xzcylx : arr[0].xzcylx,
			org : arr[0].org,
			dicSexKey : arr[0].dicSexKey,
			mobile : arr[0].mobile,
			qulifId : arr[0].qulifId,
			address :arr[0].address,
			groupTypeId:arr[0].groupTypeId
		});
 	$('#monitorName1').textbox('disable');
 	$('#monitorOrg1').textbox('disable');
 	$('#xzcylx1').combobox('disable');
 	$('#monitorDicSexKey1').combobox('disable');
 	$('#monitorQulifId1').combobox('disable');
 	$('#monitorMobile1').textbox('disable')
 	$('#monitorAddress1').textbox('disable')
 	$('#monitorRelation1').combobox('disable')
 	$('#monitorBtn1').linkbutton('disable')
 	$('#monitor_content1').datagrid('unselectAll'); 
 }
 function monitorDelete1(id){
 	   $.messager.confirm('提示信息', '确认删除?', function(r) {
 			if (r) {
 				$.post('${ctx}/culpritinfo/Monitor/batchDelete', {
 					ids : id
 				}, function(result) {
 					//1 刷新数据表格 
 					$('#monitor_content1').datagrid('reload');
 					$.messager.show({
 						title : '提示信息!',
 						msg : '删除成功'
 					});
 				});
 			} else {
 				return;
 			}
 		});
 	}
        
    </script>
 
