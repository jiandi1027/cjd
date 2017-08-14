<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_study">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学习日期：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_study">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_study">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="学习教育列表">
		<table class="easyui-datagrid" id="study_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/dailymgr/study/list1?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'studyContent',width:80,align:'center',formatter:function(value,rowData,rowIndex){
						return rowData.study.studyContent}"  >学习内容</th>
					<th data-options="field:'studyDate',width:80,align:'center',formatter:function(value,rowData,rowIndex){
						return rowData.study.studyDate}"  >学习日期</th>
					<th data-options="field:'dicStudyTypeKey',width:230,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_STUDY','DIC_STUDY_TYPE_KEY',rowData.study.dicStudyTypeKey,'')},align:'center'">学习方式</th>
					<th data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th> 
			</tr>
			</thead>
		</table>
	</div>
	
	
	
	<div id="studyDialog" title="详情" modal=true resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:500px;padding:5px;">
		<form id="studyForm" action="" method="post">
			 <table width="100%" class="grid">
                <tr>
                    <th width="30%">学习内容：</th>
					<td width="70%"><span id="studyContent"></span></td>
				</tr>
				<tr>
					<th>学习形式：</th>
					<td><span id="dicStudyTypeKey"></span></td>
				</tr>
				<tr>
					<th>学习时间：</th>
					<td><span id="studyDate"></span></td>
                </tr>
                
                <tr>
                    <th>学习时长：</th>
					<td><span id="studyTime"></span></td>
				</tr>	
				<tr>	
					<th>考核人：</th>
					<td><span id="rewardspunishmentManager"></span></td>
					
                </tr>
                <tr>
                    <th>备注：</th>
                    <td  align="left" id="note"></td>
                </tr>
                <tr>
            </table>
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#studyForm').form('clear');$('#studyDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
<script type="text/javascript">

	$(function() {
		$('#searchbtn_study').click(function() {
			$('#study_list_content').datagrid('load',serializeForm($('#searchForm_study')));
		});
		$('#cleanBtn_study').click(function() {
			$('#study_list_content').datagrid('load', {});
			$('#searchForm_study').form().find('input').val('');
		});
	
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="studyDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	//详细
	function studyDetail(index){
		$('#study_list_content').datagrid('selectRow',index); 
		var arr = $('#study_list_content').datagrid('getSelections');
	 	$('#studyDialog').dialog({
				title : '详情'
			});
	 	
	 	$('#studyForm').form('clear');
	 	 //var dicReasonTypeKey=sy.getDicValue('sf_revoke_probation','REASON_TYPE_ID',arr[0].dicReasonTypeKey,'');
	 	$('#studyContent').html(arr[0].study.studyContent);
	 	var dicStudyTypeKey=sy.getDicValue('SF_STUDY','DIC_STUDY_TYPE_KEY',arr[0].study.dicStudyTypeKey,'')
	 	$('#dicStudyTypeKey').html(dicStudyTypeKey);
	 	$('#studyDate').html(arr[0].study.studyDate);
	 	$('#studyTime').html(arr[0].study.studyTime);
	 	$('#rewardspunishmentManager').val(arr[0].study.rewardspunishmentManager);
	 	$('#note').val(arr[0].study.note); 
	 	
	 	$('#studyDialog').dialog('open');
	 	$('#study_list_content').datagrid('unselectAll'); 
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
