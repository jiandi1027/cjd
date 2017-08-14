<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_gradeChange">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;变更时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_gradeChange">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_gradeChange">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="监管等级修改记录">
		<table class="easyui-datagrid" id="gradeChange_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/gradeChange/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'created',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">变更时间</th>
					<th data-options="field:'dicOldMonitorGradeKey',width:'15%',align:'center',formatter:formatOld,sortable:true"
						editor="text">原监管等级</th>
					<th data-options="field:'dicMonitorGradeKey',width:'15%',align:'center',formatter:formatNew"
						editor="{type:'validatebox',options:{required:true}}">新监管等级</th>
					<th data-options="field:'printStatus',width:'10%',align:'center',formatter:function(value,row,index){
							if (value==1){return '已打印';}else{return '未打印';}}"
						editor="{type:'validatebox',options:{required:true}}">打印状态</th>
					<th data-options="field:'blankFlag',width:'10%',align:'center',formatter:function(value,row,index){
							if (value==2){return '已作废';}else{return '未作废';}}"
						editor="{type:'validatebox',options:{required:true}}">是否作废</th>
					<th data-options="field:'activityName',width:'15%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'18%',formatter:formatOper,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="gradeChangeDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:1200px;padding:5px;">
		<form id="gradeChangeForm" action="" method="post">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">原监管等级：</th>
                    <td width="23%"><span id="dicOldMonitorGradeKey"> </span></td>
                    <th width="10%">新监管等级：</th>
                    <td><span id="dicMonitorGradeKey"> </span></td>
                </tr>
                <tr>
                    <th>确定监管等级缘由：</th>
                    <td colspan="3">
                    <span id="dicChangeReasonKey"> </span></td>
                </tr>
                 
                <tr>
                    <th>修改原因及依据：</th>
					<td colspan="3">
					<textarea id="accountOpinion" readOnly=true style="width:800px;height:80px;border: 0 none;"></textarea></td>
                </tr> 
                <tr>
                    <th>司法所意见：</th>
					<td colspan="3">
							<textarea id="SFSOpinion" readOnly=true style="width:800px;height:80px;border: 0 none;"></textarea></td>
                </tr>
                 <tr>
                    <th>相关材料：</th>
                    <td colspan="3"><span id="notePath"></span></td>
                </tr>
                <tr>
                    <th>已上传附件:</th>
                   <td colspan="3"><span id="notePathName"></span></td>
                </tr> 
               </table>
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#gradeChangeForm').form('clear');$('#gradeChangeDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>

<script type="text/javascript">
	$(function() {

		$('#searchbtn_gradeChange').click(function() {
			$('#gradeChange_list_content').datagrid('load',serializeForm($('#searchForm_gradeChange')));
		});
		$('#cleanBtn_gradeChange').click(function() {
			$('#gradeChange_list_content').datagrid('load', {});
			$('#searchForm_gradeChange').form().find('input').val('');
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
		var operation='<a href="javascript:void(0);"  class="easyui-linkbutton-detail" onclick="gradeChangeDetail(\''+index+'\')">详情</a>';

	    return operation;
	} 

	function gradeChangeDetail(index){
		$('#gradeChange_list_content').datagrid('selectRow',index); 
		var arr = $('#gradeChange_list_content').datagrid('getSelections');
	 	$('#gradeChangeForm').form('clear');
	 	
	 	var dicOldMonitorGradeKey=sy.getDicValue('sf_culprit','dic_gldxjb_key',arr[0].dicOldMonitorGradeKey,'');
	 	var dicMonitorGradeKey=sy.getDicValue('sf_culprit','dic_gldxjb_key',arr[0].dicMonitorGradeKey,'');
	 	$('#dicOldMonitorGradeKey').html(dicOldMonitorGradeKey);
	 	$('#dicMonitorGradeKey').html(dicMonitorGradeKey);
		var dicChangeReasonKey=sy.getDicValue('sf_culprit','dicChangeReasonKey',arr[0].dicChangeReasonKey,'');
	 	
	 	$('#dicChangeReasonKey').html(dicChangeReasonKey);
	 	$('#accountOpinion').val(arr[0].accountOpinion);
	 	$('#SFSOpinion').val(arr[0].SFSOpinion);
	 	$('#notePath').html(arr[0].notePath);
	 	$('#notePathName').html(arr[0].notePathName);
	 	$('#gradeChangeDialog').dialog('open');
	 	$('#gradeChange_list_content').datagrid('unselectAll'); 

	}
	
	
   
	
	function formatOld(value,row,index){
		if(value){
			return sy.getDicValue('sf_culprit','dic_gldxjb_key',value,'')
		}else{
			return '无';
		}
	}
	function formatNew(value,row,index){
		if(value){
			return sy.getDicValue('sf_culprit','dic_gldxjb_key',value,'')
		}else{
			return '无';
		}
	}
</script>
