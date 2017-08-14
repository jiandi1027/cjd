<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
    	  <table class="easyui-datagrid"  
			data-options="singleSelect:true,fit:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/sys/scheme/list?culpritId=${culprit.id}',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-chakan').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'schemeName',width:'60%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正方案名称</th>
					<th data-options="field:'created',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">创建时间</th>
					<th data-options="field:'action',width:'23%',align:'center'" formatter="formatterScheme">操作</th>
				</tr>
			</thead>
		</table>
	<div id="detailDoc_scheme"></div>
<script >
function formatterScheme(val,row,index){
	return '<a href="javascript:void(0);" class="organization-easyui-chakan" onclick="viewDocDetail_schem(\''+row.id+'\')"></a>';
}

function viewDocDetail_schem(id){
	var dialogParent = $('#detailDoc_scheme').parent();  
    var dialogOwn = $('#detailDoc_scheme').clone();  
    dialogOwn.hide();  
	$('#detailDoc_scheme').dialog({
		onClose : function() {
			 dialogOwn.appendTo(dialogParent);  
            $(this).dialog("destroy").remove();
        },
		iconCls:'fi-zoom-in icon-blue',
		href:'${ctx}/sys/scheme/printSchemePlan?id='+id,
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
				$('#schemePrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#detailDoc_scheme').dialog('close');
			}
		}]
	});
	
}


</script>