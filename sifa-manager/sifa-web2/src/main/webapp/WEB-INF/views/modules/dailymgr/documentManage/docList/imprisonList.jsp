<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
    	  <table class="easyui-datagrid"  
			data-options="singleSelect:true,fit:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/endcorrect/imprison/list?culpritId=${culprit.id}',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-chakan').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'applyDate',width:'50%',align:'center',sortable:true">申请提交时间</th>
			 	<th data-options="field:'_opt',width:'48%',align:'center',formatter:formatOper_imprison">操作</th>
				</tr>
			</thead>
		</table>
	<div id="detailDoc_imprison"></div>
<script >
function formatOper_imprison(val,row,index){
	return '<a href="javascript:void(0);" class="organization-easyui-chakan" onclick="viewDocDetail_imprison(\''+row.id+'\')"></a>';
}

function viewDocDetail_imprison(id){
	var dialogParent = $('#detailDoc_imprison').parent();  
    var dialogOwn = $('#detailDoc_imprison').clone();  
    dialogOwn.hide();  
	$('#detailDoc_imprison').dialog({
		onClose : function() {
			 dialogOwn.appendTo(dialogParent);  
            $(this).dialog("destroy").remove();
        },
		iconCls:'fi-zoom-in icon-blue',
		href:'${ctx}/endcorrect/imprison/printJianyi?id='+id,
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
				$('#printImprisonBookBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#detailDoc_imprison').dialog('close');
			}
		}]
	});
	
}


</script>