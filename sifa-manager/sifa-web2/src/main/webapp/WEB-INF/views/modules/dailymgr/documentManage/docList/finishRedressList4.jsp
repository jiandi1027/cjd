<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
    	 <table class="easyui-datagrid"  
			data-options="singleSelect:true,fit:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/endcorrect/finishRedress/list?culpritId=${culprit.id}',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-chakan').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'created',width:'50%',align:'center',sortable:true,formatter:Common.formatDate" editor="text" >创建时间</th>
			 	<th data-options="field:'_opt',width:'48%',align:'center',formatter:formatOper_finishRedress4">操作</th>
				</tr>
			</thead>
		</table>
	<div id="detailDoc_finishRedress4"></div>
<script >
function formatOper_finishRedress4(val,row,index){
	return '<a href="javascript:void(0);" class="organization-easyui-chakan" onclick="viewDocDetail_finishRedress4(\''+row.id+'\')"></a>';
}

function viewDocDetail_finishRedress4(id){
	var dialogParent = $('#detailDoc_finishRedress4').parent();  
    var dialogOwn = $('#detailDoc_finishRedress4').clone();  
    dialogOwn.hide();  
	$('#detailDoc_finishRedress4').dialog({
		onClose : function() {
			 dialogOwn.appendTo(dialogParent);  
            $(this).dialog("destroy").remove();
        },
		iconCls:'fi-zoom-in icon-blue',
		href:'${ctx}/endcorrect/finishRedress/jcsqjzxgs?finishRedressId='+id,
		title:'查看',
		width : 1000,
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
				$('#jcsqjzxgsPrint').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#detailDoc_finishRedress4').dialog('close');
			}
		}]
	});
	
}


</script>