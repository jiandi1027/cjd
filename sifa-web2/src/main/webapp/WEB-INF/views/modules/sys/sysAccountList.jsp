<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="sysAccountSearchForm"
			style="padding-bottom: 10px; padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 240px;">
		
			<div class="easyui-layout" data-options="fit:true,border:true">
				<div region="center" border="false">
					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="sysAccountGroupId" hiddenName="groupId"
							dataGridId="sys_account_list" isAll="1"/>
					</c:if>

					<div class="easyui-panel search-form"
						data-options="fit:true,border:false" id="p2"
						title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"
						style="width: 100%;">

						<table>
							<tr>
								<td class="search-title">登&nbsp;&nbsp;陆&nbsp;&nbsp;号：</td>
								<td><input name="account" class="easyui-textbox" /></td>
							</tr>
							<tr>
								<td class="search-title">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
								<td><input id="accountname" class="easyui-textbox"
									name="accountName" /></td>
							</tr>
							<tr>
								<td class="search-title">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</td>
								<td><input name="mobile" class="easyui-textbox" /></td>
							</tr>

						</table>

					</div>
				</div>
				<div data-options="region:'south',border:false"
					style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
					<a href="#" class="easyui-linkbutton" iconCls="icon-search"
						onclick="javascript:$('#sys_account_list').datagrid('load' ,$.serializeObject($('#sysAccountSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#sysAccountSearchForm').form('clear');">清空</a>
				</div>
			</div>
		
	</div>
</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sys_account_list" title="账号列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#sysAccountToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,url:'${ctx}/sys/sysAccount/list',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'account',width:80,align:'center'">登陆号</th>
					<th data-options="field:'accountname',width:100,align:'center'">名称</th>
					<th data-options="field:'mobile',width:160,align:'center'">手机号</th>
					<th
						data-options="field:'roleId',width:80,align:'center',formatter:formatRole">所属角色</th>
					<th data-options="field:'remark',width:130,align:'center'">备注</th>
					<th
						data-options="field:'_opt',width:120,align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>

</div>
<div id="sysAccountToolbar" style="display: none;">

	<a onclick="editSysAccount('');" href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a> <a
		onclick="deleteSysAccount();" href="javascript:void(0);"
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
	function editSysAccount(id) {

		parent.$.modalDialog({
			title : '编辑账号',
	        iconCls:'fi-pencil icon-blue',
			width : 800,
			height : 350,
	        resizable : true,
	        maximizable:true, 
			href : '${ctx}/sys/sysAccount/form?id=' + id,
			buttons : [
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $(
									'#sys_account_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#sysAccountForm');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#sysAccountForm');
							f.get(0).reset(); //清空表单数据 
						}
					} ]
		});
	}

	function deleteSysAccount(id) {
		/*    if (id != undefined&&id!='') {
		   	$('#t_list_content').treegrid('select', id);
		   } */

		parent.$.messager.confirm('询问', '您是否要删除当前账号？删除当前账号会连同子账号一起删除!',
				function(b) {
					if (b) {
						progressLoad();
						$.post('${ctx}/sys/sysAccount/delete', {
							id : id
						}, function(result) {
							if (result.success) {
								$('#sys_account_list').datagrid('reload');
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
		str += $
				.formatString(
						'<a href="javascript:void(0)" class="easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editSysAccount(\'{0}\');" >编辑</a>',
						row.id);
		str += '&nbsp;';
		str += $
				.formatString(
						'<a href="javascript:void(0)" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysAccount(\'{0}\');" >删除</a>',
						row.id);
		return str;
	}
</script>

</html>
