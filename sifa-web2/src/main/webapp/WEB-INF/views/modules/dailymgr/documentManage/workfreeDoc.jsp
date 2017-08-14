<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_workfree">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;劳动日期：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_workfree">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_workfree">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="社区服务列表">
		<table class="easyui-datagrid" id="workFree_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/dailymgr/workfree/list1?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'workContent',width:80,align:'center',formatter:function(value,rowData,rowIndex){
						return rowData.workfree.workContent}" >劳动内容</th>
					<th data-options="field:'workDate',width:80,align:'center',formatter:function(value,rowData,rowIndex){
						return rowData.workfree.workDate}"  >劳动日期</th>
					<th data-options="field:'workPlace',width:80,align:'center',formatter:function(value,rowData,rowIndex){
						return rowData.workfree.workPlace}"  >劳动地点</th>
					<th data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th> 
			</tr>
			</thead>
		</table>
	</div>
	
	
	
	<div id="workfreeDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:700px;padding:5px;">
		<form id="workfreeForm" action="" method="post">
			 <table width="100%" class="grid">

                <tr>
                    <th width="30%">劳动内容：</th>
					<td width="70%"><span id="workContent"></span></td>
				</tr>
				<tr>
					<th>劳动地点：</th>
					<td><span id="workPlace"></span></td>
				</tr>
				<tr>
					<th>劳动时间：</th>
					<td><span id="workDate"></span></td>
                </tr>
                
                <tr>
                    <th>工时：</th>
					<td><span id="taskTime"></span></td>
				</tr>
				<tr>
					<th>考核人：</th>
					<td><span id="rewardspunishmentManager"></span></td>
                </tr>
                <tr>
                    <th>备注：</th>
                    <td id="note"></td>
                </tr>
                <tr>
            </table>
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#workfreeForm').form('clear');$('#workfreeDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
<script type="text/javascript">

	$(function() {
		$('#searchbtn_workfree').click(function() {
			$('#workFree_list_content').datagrid('load',serializeForm($('#searchForm_workfree')));
		});
		$('#cleanBtn_workfree').click(function() {
			$('#workFree_list_content').datagrid('load', {});
			$('#searchForm_workfree').form().find('input').val('');
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
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="workfreeDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	//详细
	function workfreeDetail(index){
		$('#workFree_list_content').datagrid('selectRow',index); 
		var arr = $('#workFree_list_content').datagrid('getSelections');
	 	$('#workfreeForm').form('clear');
	 	$('#workContent').html(arr[0].workfree.workContent);
	 	$('#workPlace').html(arr[0].workfree.workPlace);
	 	$('#workDate').html(arr[0].workfree.workDate);
	 	$('#taskTime').html(arr[0].workfree.taskTime);
	 	$('#rewardspunishmentManager').val(arr[0].workfree.rewardspunishmentManager);
	 	$('#note').val(arr[0].workfree.note); 
	 	
	 	$('#workfreeDialog').dialog('open');
	 	$('#workFree_list_content').datagrid('unselectAll'); 
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
