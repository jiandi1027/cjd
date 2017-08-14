<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="inspectionSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
			<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="inspection_list"/>
	        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">抽查起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">抽查截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
					
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#inspection_list').datagrid('load' ,$.serializeObject($('#inspectionSearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#inspectionSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="inspection_list" title="集中点验列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#inspectionToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/inspection/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'groupsStr',width:'30%',title:'groupStr',align:'center'" >被抽查司法所</th>
				<th data-options="field:'checkStartTime',width:'20%',align:'center',sortable:true,formatter:Common.formatDate2" >抽查开始时间</th>
				<th data-options="field:'checkEndTime',width:'20%',align:'center',sortable:true,formatter:Common.formatDate2" >抽查结束时间</th>
				<th data-options="field:'groupName',width:'15%',align:'center',formatter:function(value,rowDate,rowIndex){
				if(rowDate.sysGroup !=null){
				return rowDate.sysGroup.name;
				}
				}" >抽查部门</th>
				<th data-options="field:'_opt',width:'13%',align:'center',formatter:formatOper" >操作</th> 
			</tr>
		</thead>
		</table>
	</div>
</div>
<div id="inspectionToolbar">
        <a onclick="addinspection();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
</div>

<script type="text/javascript">
	var levelNo = "${sysGroup.levelNo}";
	var groupId = "${sysGroup.id}";
	
	function addinspection(){
		parent.$.modalDialog({
	         title : '新增集中点验',
	         iconCls:'fi-plus icon-green',
	         //width : sy.getBrowerWidth()*0.4,
	         //height : sy.getBrowerHeight()*0.6,
	         width : 600,
	         height : 250,
	         resizable : true,
	         maximizable:true, 
	         href : '${ctx}/dailymgr/inspection/add',
	         buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#inspection_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#inspectionAddBtn1');
	                 f.click();
	             }
	         },{
	             text : '重置',
	             iconCls:'icon-undo',
	             handler : function() {
	            	 var f = parent.$.modalDialog.handler.find('#inspectionAddBtn2');
	            	 f.click();
	             }
	         }  ]
	     });
	}
	
	function formatOper(val,row,index){
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" '
			+'onclick="inspectionDetail(\''+row.id+'\')"><span style="color:blue;">详情</span></a>';
		if (levelNo == 2) {
			var flag = false;
			var groupStr = row.groupidsStr.split(",");
			for (var i = 0; i < groupStr.length; i++) {
				if(groupId == groupStr[i]) {
					flag = true;
				}
			}
			if (flag) {
				if (checkDate(Common.formatDate(row.checkEndTime))) {
					operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" '
					+'onclick="inspectionDeal(\''+row.id+'\')"></a>';
				}
			}
		}

	    return operation;
	} 
	
	function inspectionDetail(id){
		var url = '${ctx}/dailymgr/inspection/detail?id=' + id;
		
		parent.$.modalDialog({
	         title : '集中点验详情',
	         iconCls:'fi-info icon-blue',
	         width : 800,
	         height : 600,
	         href : url,
	         resizable : true,
	         maximizable:true, 
	         buttons : [{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	$('#inspection_list').datagrid().datagrid('reload');
	             	parent.$.modalDialog.handler.dialog('close');
	             }
	         }  ]
	     });
	}
	function inspectionDeal(id){
		var url = '${ctx}/dailymgr/inspection/deal?id=' + id;
		
		parent.$.modalDialog({
	         title : '集中点验处理',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         width : 800,
	         height : 600,
	         href : url,
	         resizable : true,
	         maximizable:true, 
	         buttons : [{
	             text : '刷新考勤人员',
	             iconCls:'fi-refresh icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#inspection_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#inspectionDealBtn1');
	                 f.click();
	             }
	         }, {
	             text : '点验完成',
	             iconCls:'fi-check icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#inspection_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#inspectionDealBtn2');
	                 f.click();
	             }
	         }, {
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#inspection_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#inspectionDealBtn3');
	                 f.click();
	        	}
	    	}]
	    });
		
	}
	
	$(function() {
		
	});

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
	    },
		formatDate2: function (value) {
	        if (value == null || value == '') {
	            return '';
	        }
	        var dt;
	        if (value instanceof Date) {
	            dt = value;
	        } else {
	            dt = new Date(value);
	        }
	        dt = new Date(dt.format("yyyy-MM-dd hh:mm"));
	        
	        return dt.format("yyyy-MM-dd hh:mm"); //扩展的Date的format方法(上述插件实现)
	    }
	}
	
	// 日期比较函数
	function checkDate(bDate)
	{
		var standard = new Date();
		bDate=bDate.substr(0,10);
		var temp =bDate.split("-");
		return (Number(temp[0]) == Number(standard.getFullYear())) && (Number(temp[1]) == Number(standard.getMonth()+1)) && (Number(temp[2]) == Number(standard.getDate())); 
	}
	
</script>

</html>
