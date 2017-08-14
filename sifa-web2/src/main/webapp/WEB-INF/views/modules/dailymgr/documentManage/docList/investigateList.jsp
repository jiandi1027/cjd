<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
    	  <table class="easyui-datagrid"   
			data-options="singleSelect:true,fit:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/investigate/list?relevantNumber=${culprit.identification}',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-chakan').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'groupName',width:'50%',align:'center',formatter:function(value,rowData,rowIndex){  
				    var time = Common.formatDate(rowData.begTime) + '至';
				    if(rowData.endTime != null)
				    {time = time + Common.formatDate(rowData.endTime);}
				    return time;
				}">调查时间</th>
			 	<th data-options="field:'_opt',width:'48%',align:'center',formatter:formatOper_investigate">操作</th>
				</tr>
			</thead>
		</table>
	<div id="detailDoc_investigate"></div>
<script >
function formatOper_investigate(val,row,index){
	return '<a href="javascript:void(0);" class="organization-easyui-chakan" onclick="viewDocDetail_investigate(\''+row.id+'\')"></a>';
}

function viewDocDetail_investigate(id){
	var dialogParent = $('#detailDoc_investigate').parent();  
    var dialogOwn = $('#detailDoc_investigate').clone();  
    dialogOwn.hide();  
	$('#detailDoc_investigate').dialog({
		onClose : function() {
			 dialogOwn.appendTo(dialogParent);  
            $(this).dialog("destroy").remove();
        },
		iconCls:'fi-zoom-in icon-blue',
		href:'${ctx}/investigate/print?type=1&id='+id,
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
				$('#investigatePrintBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#detailDoc_investigate').dialog('close');
			}
		}]
	});
	
}


</script>