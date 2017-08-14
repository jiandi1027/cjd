<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="actionSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="action_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">矫正人员：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">发生地点：</td>
					<td><input name="occurrencePlace" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">发生起始：</td>
					<td><input name="occurrenceStartDate" id="occurrenceStartDate" class="Wdate" 
                   			onfocus="var occurrenceEndDate=$dp.$('occurrenceEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){occurrenceEndDate.focus();},maxDate:'#F{$dp.$D(\'occurrenceEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">发生截止：</td>
					<td><input name="occurrenceEndDate" id="occurrenceEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'occurrenceStartDate\')}'})" /></td>
				</tr>
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#action_list').datagrid('load' ,$.serializeObject($('#actionSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#actionSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="action_list" title="行为异常列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#toolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/policeCheck/exceptionInfo/actionList',method:'post',onLoadSuccess:function (data) {
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'"  >姓名</th>
				<th data-options="field:'groupName',width:80,align:'center'">司法所</th>
				<th data-options="field:'occurrencePlace',width:80,align:'center'" >发生地点</th>
				<th data-options="field:'occurrenceTime',width:80,align:'center',sortable:true,formatter:Common.formatDate" >发生时间</th>
			</tr>
		</thead>
	</table>
	</div>

</div>

<script type="text/javascript">
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

</html>
