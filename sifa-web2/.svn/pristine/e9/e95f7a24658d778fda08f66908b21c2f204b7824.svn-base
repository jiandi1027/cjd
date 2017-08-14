<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>          
	<div class="easyui-panel"  style="height:50px;padding:5px; align:left;margin: 0 auto;" >
		<form id="searchForm_dailyReport">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报到时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_dailyReport">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_dailyReport">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;margin: 0 auto;" title="日常报到">
		<table class="easyui-datagrid" id="dailyReport_list_content" style="height:100%;width:100%"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'#toolbarDailyReport',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-detail').linkbutton({text:'报到记录',plain:true,iconCls:'fi-list icon-blue'});
                    }">
		<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'reportDate',width:'15%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">报到时间</th>
					<th data-options="field:'dicTypeKey',width:'20%',align:'center',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT','DIC_TYPE_KEY',value,'')}"
						editor="text" editor="{type:'numberbox',options:{required:true}}">报到方式</th>
					<th
						data-options="field:'dicReportStatusKey',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){if(value=='0'){return '按时';}　else {return '未按时'}}"
						editor="{type:'validatebox',options:{required:true}}">是否按时</th>
					<th data-options="field:'jlr',width:'20%',align:'center'"
						editor="text">记录人</th>
					<th data-options="field:'updater',width:'28%',align:'center'"
						editor="text">处理人</th>
					<!-- <th data-options="field:'_opt',width:'1%',formatter:formatOper,align:'center'">操作</th>   -->
				</tr>
			</thead>
		</table>
	</div>
	<!-- <div id="addDailyReport" title="新增记录" modal=true draggable=false resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width: 450px;padding:10px; top:250px; left:650px;">
		<form id="addDailyReportForm" action="" method="post">
			<table>
				<tr>
					<td><span class="c-red">*</span>报到日期：</td>
					<td>
					<input type="text" name="reportDate" id="reportDate" required=true editable="false" 
							class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>报到方式：</td>
					<td><select id="dicTypeKey" data-options="panelHeight:'auto'" class="easyui-combobox" name="dicTypeKey" style="width:170px;" editable="false" required=true>   
						    <option value="50202">其他</option>   
						    <option value="50203">电话</option>   
						</select>  
					</td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>是否按时：</td>
					<td><select id="dicOnscheduleKey" data-options="panelHeight:'auto'" class="easyui-combobox" name="dicOnscheduleKey" style="width:170px;" editable="false" required=true>   
						    <option value="1">是</option>   
						    <option value="0">否</option>   
						</select>  
					</td>
				</tr>
				<tr>
					<td>备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
					<td><textarea  name="note" id="note" class="easyui-validatebox"  multiline="true" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'  
							style="width:300px;height:100px;overflow:hidden;" maxlength=200></textarea>
							<br/>
							<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
							</p>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="dailyReportSave();" data-options="iconCls:'icon-save'">保存</a>
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="dailyReportClose();" data-options="iconCls:'fi-x icon-blue'">关闭</a>
				</tr>
			</table>
		</form>
	</div> -->
	<!-- <div id="toolbarDailyReport" style="display: none;">
	        <a onclick="addDailyReport();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</div> -->
	<div id="detailDialog"></div>
<script type="text/javascript">
/* //添加日常报道
function addDailyReport(){
	$('#addDailyReportForm').form('clear');
	$('#addDailyReport').dialog('open');
} */

/* //保存
function dailyReportSave(){
	if ($('#addDailyReportForm').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/dailyReport/saveDoc?culpritId=${culprit.id }',
			cache : false,
			data : $('#addDailyReportForm').serialize(),
			dataType : 'json',
			success : function(result) {
				//1 关闭窗口
				$('#addDailyReport').dialog('close');
				//2刷新datagrid 
				$('#dailyReport_list_content').datagrid('reload');
				//3 提示信息
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			},
			error : function(result) {
				$.meesager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	} else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
} */


	$(function() {

		$('#searchbtn_dailyReport').click(function() {
			$('#dailyReport_list_content').datagrid('load',serializeForm($('#searchForm_dailyReport')));
		});
		$('#cleanBtn_dailyReport').click(function() {
			$('#dailyReport_list_content').datagrid('load', {});
			$('#searchForm_dailyReport').form().find('input').val('');
		});

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

	function isTime(value,rowData,rowIndex){
		if(value=='1'){
			return '按时';
		}else {
			return '未按时'
		}
	}
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        if (row.Id != null && row.Id !== undefined)  
        alert(row.Id);  
    }  
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="easyui-linkbutton-detail" data-options="plain:true" onclick="detail(\''+row.id+'\')">报道记录</a>';
	    return operation;
	} 
	function detail(id){
		$('#detailDialog').dialog({
	        title : '报到记录',
	        width : 1000,
	        height :500,
	        resizable:true,
	        maximizable:true,
	        href : '${ctx}/dailymgr/dailyReport/get?id='+id
	    });
	}


	
	function formatStatusKey(value, row, index){
		var str = '';
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysDic/getDicValue?tabName=sf_askleave&columnName=dic_status_key&key='+value,
			cache : false,
			async : false, //同步请求
			data : {
				id : value
			},
			dataType : 'json',
			success : function(result) {
				
				if(result!=null){
					str = result.value;
				}
				
			}
		});
		return str;
		
	}
	function fomatIsOverdue(value,row,index){
		if(value==1){
			return '是';
		}else{
			return '否';
		}
	}
</script>

</html>
