<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="culpritLawSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
	<div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="culprit_law_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">文书标题：</td>
					<td><input name="legalDocsName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">文&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
					<td><input name="indictmentNum" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">主送单位：</td>
					<td><input name="mainDept" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">抄送单位：</td>
					<td><input name="copyDept" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">拟&nbsp;&nbsp;稿&nbsp;&nbsp;人：</td>
					<td><input name="drafter" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">审&nbsp;&nbsp;批&nbsp;&nbsp;人：</td>
					<td><input name="passer" class="easyui-textbox"   /></td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#culprit_law_list').datagrid('load' ,$.serializeObject($('#culpritLawSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#culpritLawSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="culprit_law_list" title="法律文书登记列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#toolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/culprit/culpritLaw/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'legalDocsName',width:100,align:'center'"  >文书标题</th>
				<th data-options="field:'indictmentNum',width:100,align:'center'" >文号</th>
				<th data-options="field:'mainDept',width:80,align:'center'" >主送单位</th>
				<th data-options="field:'copyDept',width:80,align:'center'" >抄送单位</th>
				<th data-options="field:'drafter',width:80,align:'center'">拟稿人</th>
				<th data-options="field:'passer',width:80,align:'center'">审批人</th>
			</tr>
		</thead>
	</table>
	</div>

</div>

<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#sys_account_list').datagrid('load', {
        		 groupId: node.id
             });
         }
     });


});

function formatOper(val,row,index){  
	  var str = '';
    return str;
} 
</script>

</html>
