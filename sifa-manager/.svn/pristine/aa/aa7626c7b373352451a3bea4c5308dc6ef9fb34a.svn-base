<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" 
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
		            <td>提请撤销暂予监外执行审核表</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeOutOfPrison_printshb('${revokeOutOfPrison.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="revokeOutOfPrison_isPrintSHB"><c:if test="${revokeOutOfPrison.isPrintSHB==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="revokeOutOfPrison_printshbDialog"></div>
	<div id="revokeOutOfPrison_informDialog"></div>
	<div style="text-align: center;display: none;">
	    <a id="revokeOutOfPrison_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印撤销缓刑建议书
function revokeOutOfPrison_printshb(id) {
	 $('#revokeOutOfPrison_printshbDialog').dialog({ 
		 title: '打印《提请撤销暂予监外执行审核表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/rewardspunishment/revokeOutOfPrison/printShenhe?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeOutOfPrisonTable').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeOutOfPrison_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#revokeOutOfPrison_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/revokeOutOfPrison/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#revokeOutOfPrison_isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}


$('#revokeOutOfPrison_inform_btn').click(function (){
	$('#revokeOutOfPrison_informDialog').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/revokeOutOfPrison/inform?id=${revokeOutOfPrison.id}&taskId=${revokeOutOfPrison.taskId}&auditType=${revokeOutOfPrison.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#revokeOutOfPrison_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#revokeOutOfPrison_informDialog').dialog('close');
			}
		}]
	});
	$('#revokeOutOfPrison_informDialog').window('center');
});



</script>

