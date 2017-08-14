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
 					<td>撤销假释建议书</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeParole_printjys('${revokeParole.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="revokeParole_isPrintJYS"><c:if test="${revokeParole.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>撤销假释审批表</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeParole_printshb('${revokeParole.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="revokeParole_isPrintSHB"><c:if test="${revokeParole.isPrintSHB==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="revokeParole_printjysDialog"></div>
	<div id="revokeParole_printshbDialog"></div>
	<div id="revokeParole_informDialog"></div>
	<div style="text-align: center;display: none;">
	    <a id="revokeParole_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印撤销缓刑建议书
function revokeParole_printjys(id) {
	 $('#revokeParole_printjysDialog').dialog({ 
		 title: '打印《撤销假释建议书》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height:800,    
		    href: '${ctx}/rewardspunishment/revokeParole/printJianYi?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeParoleBook').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeParole_printjysDialog').dialog('close');
				}
			}]  
		}); 
	 
	 $('#revokeParole_printjysDialog').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/revokeParole/updateFinshInfo?id='+id+'&isPrintJYS=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#revokeParole_isPrintJYS').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}

///打印撤销缓刑建议书
function revokeParole_printshb(id) {
	 $('#revokeParole_printshbDialog').dialog({ 
		 title: '打印《撤销假释审批表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/rewardspunishment/revokeParole/printShenhe?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeParoleTable').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeParole_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#revokeParole_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/revokeParole/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#revokeParole_isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}


$('#revokeParole_inform_btn').click(function (){
	$('#revokeParole_informDialog').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/revokeParole/inform?id=${revokeParole.id}&taskId=${revokeParole.taskId}&auditType=${revokeParole.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#revokeParole_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#revokeParole_informDialog').dialog('close');
			}
		}]
	});
	$('#revokeParole_informDialog').window('center');
});



</script>

