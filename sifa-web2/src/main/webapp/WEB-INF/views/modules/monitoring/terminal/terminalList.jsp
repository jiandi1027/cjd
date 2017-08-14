<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="http://a.amap.com/jsapi_demos/static/resource/heatmapData.js"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="terminalSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="terminal_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="name" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">绑定号码：</td>
						<td><input name="bindNumber" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">终端类型：</td>
						<td>
							<select id="type" name="type" class='easyui-combobox' data-options="panelHeight:'auto',panelMaxHeight:'200'">
								<option value="">全部</option>
								<option value='手机'>手机</option>
								<option value='定位手环'>定位手环</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="search-title">绑定状态：</td>
						<td>
							<select id="bindstatus" name="bindstatus" class='easyui-combobox' data-options="panelHeight:'auto',panelMaxHeight:'200'">
								<option value="">全部</option>
								<option value='已绑定'>已绑定</option>
								<option value='未绑定'>未绑定</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="search-title">定位间隔：</td>
						<td>
							<select id="intervalTime" name="intervalTime" class="easyui-combobox" data-options="panelHeight: 'auto',panelMaxHeight: '200'" > 
								<option value="">全部</option>
								<option value="5分钟/次">5分钟/次</option>
								<option value="10分钟/次">10分钟/次</option>
								<option value="30分钟/次">30分钟/次</option>
								<option value="1小时/次">1小时/次</option>
								<option value="2小时/次">2小时/次</option>
								<option value="12小时/次">12小时/次</option>
								<option value="24小时/次">24小时/次</option>
			                </select>
						</td>
					</tr>
					<tr>
						<td class="search-title">绑定起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">绑定截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#terminal_list').datagrid('load' ,$.serializeObject($('#terminalSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#type').combobox('reset');$('#bindstatus').combobox('reset');$('#intervalTime').combobox('reset');$('#terminalSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div style="width:100%;" region="center" border="false">
		<table style="width:100%;" class="easyui-datagrid" id="terminal_list" title="终端绑定列表"
			data-options="singleSelect:true,fit:true,border:true,collapsible:true,striped:true,nowrap:false,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/terminal/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-terminal-link').linkbutton({text:'绑定终端',plain:true,iconCls:'fi-link icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true" ></th>
					<th data-options="field:'name',align:'center',width:'10%'" editor="text" >矫正对象</th>
					<th data-options="field:'groupName',align:'center',width:'10%'" editor="text">司法所</th>
					<th data-options="field:'bindNumber',align:'center',width: '10%'" editor="text">绑定号码</th>
					<th data-options="field:'type',align:'center',width: '10%'" editor="text" >终端类型</th>
					<th data-options="field:'intervalTime',align:'center',width: '10%'" editor="text" >定位间隔</th>
					<th data-options="field:'bindtime',width:'15%',align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd hh:mm:ss');
					}">绑定时间</th>
					<th data-options="field:'bindstatus',align:'center',width: '10%'" >绑定状态</th>
					<th data-options="field:'_opt',align:'center',formatter:overformatOper,width:'23%'" >操作</th> 
				</tr>
			</thead>
		</table>
	</div>
</div>

<script type="text/javascript">
function overformatOper(val,row,index){
	var operation='';
	<shiro:hasPermission name="monitoring/terminal/bind">
	operation +='<a href="javascript:void(0);" class="organization-easyui-linkbutton-terminal-link" onclick="terminalBinding(\''+row.id+'\')">绑定终端</a>';
	</shiro:hasPermission>
    return operation;
}

function terminalBinding(id) {
	parent.$.modalDialog({
		title : '绑定终端',
		iconCls : 'fi-link icon-blue',
		width : 700,
		height : 260,
		href : '${ctx}/monitoring/terminal/form?id=' + id,
		resizable:true,
        maximizable:true,
		buttons : [ {
			id : 'bangding',
        	text : '终端绑定',
            iconCls:'fi-link icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#terminal_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	var f = parent.$.modalDialog.handler.find('#bindingform');
                f.submit();
            }
        },{
			id : 'jiechu',
	        text : '解除绑定',
	        iconCls:'fi-unlink icon-blue',
	        handler : function() {
	        	$.messager.confirm('提示信息', '确认解绑?', function(r) {
					if (r) {
						$.ajax({
		      				url : '${ctx}/monitoring/terminal/delete?culpritId=' + id,
		      				method : 'post',
		      				success : function(result) {
		      					$.messager.show({
		      	    				title : "提示信息",
		      	    				msg : "解绑成功"
		      	    			});	
		      					$('#terminal_list').datagrid('reload');
	      						parent.$.modalDialog.handler.dialog('close');
      						},
      						error : function() {
	      						parent.$.modalDialog.handler.dialog('close');
	      	            		$.messager.show({
		      	    				title : "提示信息",
		      	    				msg : "解绑失败!请联系管理员！"
		      	    			});
		      				}
		      			});
					}else{
						return;
					}
	            });
	         }
	     }]
	});
}

</script>