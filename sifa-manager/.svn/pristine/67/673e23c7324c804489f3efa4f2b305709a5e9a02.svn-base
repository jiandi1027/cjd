<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" id="parole_finish_list_content" 
			style="height:400px" data-options="singleSelect:true,fit:true,collapsible:false,striped:true,fitColumns:true,rownumbers:true">
			<thead>
				<tr>
					<th data-options="field:'studyDate',width:'50%',align:'center'">文书名称</th>
				 	<th data-options="field:'_opt',width:'29%',align:'center'">操作</th>
				 	<th data-options="field:'_opt1',width:'21%',align:'center'">是否打印</th>  
				</tr>
			</thead>
			<tbody>   
		        <tr>  
 					<td>社区服刑人员假释建议书</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="parole_printjys('${parole.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="isPrintJYS"><c:if test="${parole.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		    </tbody>   
			
		</table> 
	<div id="parolePrint"></div>
	<div id="parolePrint2"></div>
	<div style="text-align: center;display: none;">
	    <a id="parole_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印治安管理处罚建议书
function parole_printjys(id) {
	var url = '${ctx}/rewardspunishment/parole/print?&type=1&id='+id;
	 $('#parolePrint').dialog({ 
		 title: '打印治安管理处罚建议书',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height:800,    
		    href: url,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#parolePrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#parolePrint').dialog('close');
				}
			}]  
		}); 
	 
	 $('#parolePrint').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/parole/updateFinshInfo?id='+id+'&isPrintJYS=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#isPrintJYS').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}




$('#parole_inform_btn').click(function (){
	$('#parolePrint2').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/parole/inform?id=${parole.id}&taskId=${parole.taskId}&auditType=${parole.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#parole_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#parolePrint2').dialog('close');
			}
		}]
	});
	$('#parolePrint2').window('center');
});



</script>

