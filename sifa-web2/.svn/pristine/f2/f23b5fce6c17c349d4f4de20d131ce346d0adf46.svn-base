<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#searchHolidayFormbtn').click(
				function() {
					$('#holiday_list_content').datagrid('load',
							serializeForm($('#holidaySearchForm')));
				});

		$('#cleanHolidayFormSearch').click(function () {
			$('#holiday_list_content').datagrid('load', {});
			$('#searchDayOfWeek').combobox('reset');
			$('#searchIsLeap').combobox('reset');
			$('#holidaySearchForm').form('clear');
			
		});
		
		//js方法：序列化表单 			
		
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
	
	
	
//操作
var roleId='${sysAccount.roleId}';
function formatterAct(value,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-holiday-pencil" onclick="editHoliday(\''+row.id+'\')">修改</a>';
    return operation;
	 
}

function editHoliday(id){
	parent.$.modalDialog({
        title :'修改节假日信息',
        iconCls:'fi-pencil icon-blue',
        width : 500,
        height : 270,
        resizable:true,
        maximizable:true,
        href : "${ctx}/sys/holiday/form?id=" + id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
            	 parent.$.modalDialog.openner_dataGrid = $('#holiday_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#holidayInfo');
                f.submit();
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



</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="holidaySearchForm" class="confirmForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:true">
			<div region="center" border="false">
		            <div class="easyui-panel search-form" data-options="fit:true,border:false" style="width:100%;">
					<table>
						<tr>
							<td class="search-title">时间起始：  </td>
							<td><input name="searchStartDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">时间截至： </td>
							<td><input name="searchEndDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期： </td>
							<td><select class="easyui-combobox" id="searchDayOfWeek" name="dayOfWeek" editable=false >   
								    <option value="">全部</option>
								    <option value="星期一">星期一</option> 
								    <option value="星期二">星期二</option>   
								    <option value="星期三">星期三</option>   
								    <option value="星期四">星期四</option>   
								    <option value="星期五">星期五</option> 
								    <option value="星期六">星期六</option>
								    <option value="星期日">星期日</option>  
								</select>  
							</td>
						</tr>
						<tr>	
							<td class="search-title">是否节假： </td>
							<td><input name="isLeap" id="searchIsLeap" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=yes_no&parentKey=1&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
					</table>
					</div>
				</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="confirmButton easyui-linkbutton" id="searchHolidayFormbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanHolidayFormSearch" iconCls="icon-undo" >清空</a>
			</div>
		</div>
		</div>
	</form>

	<div region="center" border="false">
		<table class="easyui-datagrid" id="holiday_list_content" title="节假日管理列表"  
			data-options="singleSelect:true,collapsible:true,rownumbers:true,fit:true,striped:true,fitColumns:true,toolbar:'#toolbarCulprit',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/sys/holiday/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-holiday-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'year',width:'15%',align:'center',sortable:true">年</th>
					<th data-options="field:'month',width:'15%',align:'center',sortable:true">月</th>
					<th data-options="field:'day',width:'15%',align:'center',sortable:true">日</th>
					<th data-options="field:'dayOfWeek',width:'15%',align:'center'">星期</th>
					<th data-options="field:'isLeap',width:'20%',align:'center',formatter:function(value,row,index){
						if(row.isLeap=='1'){return '是' }else{return '否'}}">是否为节假日或双休日</th>
					<th data-options="field:'action',width:'18%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

