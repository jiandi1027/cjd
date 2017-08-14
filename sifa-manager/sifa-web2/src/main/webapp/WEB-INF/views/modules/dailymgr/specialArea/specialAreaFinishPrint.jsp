<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" style="height:400px" data-options="singleSelect:true,fit:true,collapsible:false,striped:true,fitColumns:true,rownumbers:true">
			<thead>
				<tr>
					<th data-options="field:'studyDate',width:'50%',align:'center'">文书名称</th>
				 	<th data-options="field:'_opt',width:'29%',align:'center'">操作</th>
				 	<th data-options="field:'_opt1',width:'21%',align:'center'">是否打印</th>  
				</tr>
			</thead>
			<tbody>   
		        <tr>   
		            <td>社区服刑人员进入特定区域（场所）审批表</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="specialArea_printshb('${specialArea.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="specialArea_isPrintSHB"><c:if test="${specialArea.isPrintSHB==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="specialArea_printshbDialog"></div>
	<div id="specialArea_informDialog"></div>
	<div style="text-align: center;display: none;">
	    <a id="specialArea_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印审核表
function specialArea_printshb(id) {
	 $('#specialArea_printshbDialog').dialog({ 
		 title: '打印《社区服刑人员进入特定区域（场所）审批表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/dailymgr/specialArea/printShenhe?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#specialAreaTablePrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#specialArea_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#specialArea_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/specialArea/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#specialArea_isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}



$('#specialArea_inform_btn').click(function (){
	$('#specialArea_informDialog').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/dailymgr/specialArea/inform?id=${specialArea.id}&taskId=${specialArea.taskId}&auditType=${specialArea.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#specialArea_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#specialArea_informDialog').dialog('close');
			}
		}]
	});
	$('#specialArea_informDialog').window('center');
});



</script>

