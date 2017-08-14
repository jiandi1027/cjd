<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
    	<table class="easyui-datagrid"  
			data-options="singleSelect:true,fit:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/rewardspunishment/reducePenalty/list?culpritId=${culprit.id}',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-chakan').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'endTime',width:'50%',align:'center'">申请时间</th>
			 	<th data-options="field:'_opt',width:'48%',align:'center',formatter:formatOper_reducePenalty">操作</th>
				</tr>
			</thead>
		</table>
	<div id="detailDoc_reducePenalty"></div>
<script >
function formatOper_reducePenalty(val,row,index){
	return '<a href="javascript:void(0);" class="organization-easyui-chakan" onclick="viewDocDetail_reducePenalty(\''+row.id+'\')"></a>';
}

function viewDocDetail_reducePenalty(id){
	var dialogParent = $('#detailDoc_reducePenalty').parent();  
    var dialogOwn = $('#detailDoc_reducePenalty').clone();  
    dialogOwn.hide();  
	$('#detailDoc_reducePenalty').dialog({
		onClose : function() {
			 dialogOwn.appendTo(dialogParent);  
            $(this).dialog("destroy").remove();
        },
		iconCls:'fi-zoom-in icon-blue',
		href:'${ctx}/rewardspunishment/reducePenalty/print?id='+id,
		title:'查看',
		width : 900,
	    height : 700,
		shadow:false,
	    modal:true,
	    resizable:true,
        maximizable:true,
        loadingMessage:'加载中...',
        buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#reducePenaltyPrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#detailDoc_reducePenalty').dialog('close');
			}
		}]
	});
	
}


</script>