<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form action="${ctx}/monitoring/overAlarm/save" method="post" id="overAlarmformAdd" name="">
     <div class="easyui-panel" style="width: 100%;padding: 5px;margin:0 auto;">
     	<table style="width:100%;height: 600px;" class="easyui-datagrid" id="overAlarm_his_list" 
			data-options="singleSelect:true,border:true,collapsible:true,striped:true,nowrap:false,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/overAlarm/hislist?culpritId=${overAlarm.culpritId }',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-overAlarmHis-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'created',width:'15%',align:'center',sortable:true">越界时间</th>
					<th data-options="field:'location',align:'center',width: '35%'" >越界位置</th>
					<th data-options="field:'askLeaveflag',align:'center',width: '10%'" editor="text">是否请假</th>
					<th data-options="field:'delmark',align:'center',width: '10%'" editor="text" >扣分</th>
					<th data-options="field:'status',align:'center',width: '10%',formatter:function(value,row,index){
						if(row.delmark == null){
							return '未处理';
						}
						else return '已处理';
					}" >状态</th>
					<th data-options="field:'_opt',align:'center',formatter:hisoverformatOper,width:'20%'" >操作</th> 
				</tr>
			</thead>
		</table>
    </div>
    <div id="overAlarmHisDealForm"></div>
</form>
<script>
$(function() {
});

function hisoverformatOper(val,row,index){
	var operation='';
	<shiro:hasPermission name="monitoring/overAlarm/dispose">
	if (row.delmark == null) {
		operation = operation + '<a href="javascript:void(0);" class="organization-easyui-linkbutton-overAlarmHis-pencil" onclick="pencilhisover(\''+row.id+'\')"></a>';
	}
	</shiro:hasPermission>
    return operation;
}

function pencilhisover(id){
	$('#overAlarmHisDealForm').dialog({
	    title : '越界警告处理',
	    iconCls:'fi-arrow-up icon-blue',
	    width : 500,
	    height : 300,
	    href : '${ctx}/monitoring/overAlarm/hisdispose?id='+id,
	    resizable:true,
	    maximizable:true, 
	    buttons : [ {
	        text : '上报',
	        iconCls:'fi-arrow-up icon-blue',
	        handler : function() {
	        	$('#overAlarmHisformAdd').submit();
	        }
	    },{
	        text : '关闭',
	        iconCls:'fi-x icon-blue',
	        handler : function() {
	        	$('#overAlarmHisDealForm').dialog('close');
	        }
	    }
	    ]
   });
	$('#overAlarmHisDealForm').window('center');
}
</script>