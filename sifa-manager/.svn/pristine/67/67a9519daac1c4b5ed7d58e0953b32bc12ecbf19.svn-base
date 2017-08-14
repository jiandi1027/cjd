<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_askLeave">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_askLeave">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_askLeave">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="档案修改记录列表">
		<table class="easyui-datagrid" id="update_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/culpritinfo/culpritUpdateInfo/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'updaterName',align:'center',width:'15%'"
						editor="text">修改人</th>
					<th data-options="field:'created',align:'center',width:'15%'"
						editor="text" >修改时间</th>
					<th data-options="field:'note',align:'center',width:'50'"
						editor="text">备注</th>
				 <th data-options="field:'_opt',width:'18%',align:'center',formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="info" title="详细信息" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="infoForm" action="" method="post">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">修改人：</th>
					<td width="90%">
						<input type="text" name="updaterName" class="easyui-textbox" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>修改时间：</th>
					<td>
						<input type="text" name="created" class="easyui-textbox" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>修改信息：</th>
					<td><input type="text" name="updateInfo" multiline="true"
						class="easyui-textbox" readonly="readonly" 
						data-options="width:'80%',height:100"/></td>
				</tr>
				<tr>
					<th>备注：</th>
					<td><input type="text" name="note" multiline="true"
						class="easyui-textbox" readonly="readonly"
						data-options="width:'80%',height:100"/></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<a href="javascript:void(0)" id="btn2" data-options="iconCls:'fi-x icon-blue'"  class="easyui-linkbutton" onclick=" $('#info').dialog('close');">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript">

	$(function() {

		$('#update_list_content').datagrid({
			fit : true
		});
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchbtn').click(
				function() {
					$('#update_list_content').datagrid('load',
							serializeForm($('#searchForm')));
				});

		function cleanSearch() {
			$('#update_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
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
	});



	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="easyui-linkbutton-detail" onclick="info(\''+index+'\')">详情</a>';

	    return operation;
	} 	
	//打开详细窗口
	function info(index){
		$('#update_list_content').datagrid('selectRow',index); 
		var arr = $('#update_list_content').datagrid('getSelections');
		//$('#infoForm').get(0).reset(); 
		$('#infoForm').form('load',{
			updaterName:arr[0].updaterName,
			created:arr[0].created,
			updateInfo:arr[0].updateInfo,
			note:arr[0].note
			});
		$('#update_list_content').datagrid('unselectAll');
		$('#info').dialog('open');
		
	}

</script>

