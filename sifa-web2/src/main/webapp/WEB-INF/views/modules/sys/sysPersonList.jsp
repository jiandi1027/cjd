<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="sysPersonSearchForm"
		style="padding-bottom: 10px; padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'"
			style="width: 240px;">

			<div class="easyui-layout" data-options="fit:true,border:false">
				<div region="center" border="false">

					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="sysPersonGroupId" hiddenName="groupId"
							dataGridId="sys_person_list" isAll="1" />
					</c:if>

					<div class="easyui-panel search-form"
						data-options="fit:true,border:false" id="p2"
						title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"
						style="width: 100%;">

						<table>
							<tr>
								<td class="search-title">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
								<td><input name="name" class="easyui-textbox" /></td>
							</tr>
							<tr>
								<td class="search-title">身&nbsp;&nbsp;份&nbsp;&nbsp;证：</td>
								<td><input name="sfzh" class="easyui-textbox" /></td>
							</tr>
							<tr>
							<tr>
								<td class="search-title">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</td>
								<td><input name="mobile" class="easyui-textbox" /></td>
							</tr>
							<tr>
						</table>

					</div>
				</div>
				<div data-options="region:'south',border:false"
					style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
					<a href="#" class="easyui-linkbutton" iconCls="icon-search"
						onclick="javascript:$('#sys_person_list').datagrid('load' ,$.serializeObject($('#sysPersonSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#sysPersonSearchForm').form('clear');">清空</a>
				</div>
			</div>

		</div>
	</form>


	<div region="center" border="false">
		<table class="easyui-datagrid" id="sys_person_list" title="人员列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#sysPersonToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/sysPerson/list',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'">姓名</th>
					<th
						data-options="field:'dicRybzKey',width:120,align:'center',formatter:function(value,rowData,rowIndex){    
    
    if(typeof(rowData.dicRybzKey) != 'undefined' && rowData.dicRybzKey!=''){
    	 return sy.getDicValue('sys_person','bzlx',rowData.dicRybzKey,''); 
    }
     
}">编制</th>
					<th data-options="field:'sfzh',width:250,align:'center'">身份证号</th>
					<th
						data-options="field:'groupId',width:130,align:'center',formatter:formatGroup">所属单位</th>

					<th
						data-options="field:'mobile',width:140,align:'center',sortable:true">手机号</th>
					<th
						data-options="field:'_opt',width:160,align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>

</div>
<div id="sysPersonToolbar" style="display: none;">

	<a onclick="editSysPerson('');" href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a> <a
		onclick="deleteSysPerson();" href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>

</div>
<script type="text/javascript">
	function formatRole(value, row, index) {
		var str = '';
		if (value != '') {
			$.ajax({
				type : 'get',
				url : '${ctx}/sys/sysRole/findById?id=' + value,
				cache : false,
				async : false, //同步请求
				dataType : 'json',
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					/* alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus); */
				},
				success : function(result) {
					if (result != null && result != '') {
						str = result.name;
					}

				}
			});
		}

		return str;

	}
	function editSysPerson(id) {

		parent.$.modalDialog({
			title : '编辑人员',
	        iconCls:'fi-pencil icon-blue',
			width : 800,
			height : 500,
	        resizable : true,
	        maximizable:true, 
			href : '${ctx}/sys/sysPerson/form?id=' + id,
			buttons : [
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $(
									'#sys_person_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#sysPersonForm');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#sysPersonForm');
							f.get(0).reset(); //清空表单数据 
						}
					} ]
		});
	}

	function deleteSysPerson(id) {

		parent.$.messager.confirm('询问', '您是否要删除当前人员？删除当前人员会连同子人员一起删除!',
				function(b) {
					if (b) {
						progressLoad();
						$.post('${ctx}/sys/sysPerson/delete', {
							id : id
						}, function(result) {
							if (result.success) {
								$('#sys_person_list').datagrid('reload');
							} else {
								parent.$.messager.alert('提示', result.msg,
										'info');
							}
							progressClose();
						}, 'JSON');
					}
				});
	}
	function formatOper(val, row, index) {
		var str = '';
		 <shiro:hasPermission name="sys/sysPerson/save">
		str += $
				.formatString(
						'<a href="javascript:void(0)" class="easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editSysPerson(\'{0}\');" >编辑</a>',
						row.id);
		</shiro:hasPermission>
		str += '&nbsp;';
		<shiro:hasPermission name="sys/sysPerson/delete">
		str += $
				.formatString(
						'<a href="javascript:void(0)" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysPerson(\'{0}\');" >删除</a>',
						row.id);
		</shiro:hasPermission>
		return str;
	}

	

	function formatGroup(value, row, index) {
		var str = '';
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysGroup/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 /* alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus); */
				   },
			success : function(result) {
				str = result.name;
			}
		});
		return str;

	}
</script>

</html>
