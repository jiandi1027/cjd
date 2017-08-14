<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" id="revokeProbation_finish_list_content" 
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
 					<td>社区服刑人员减刑建议书</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeProbation_printjys('${reducePenalty.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="isPrintJYS"><c:if test="${reducePenalty.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		    </tbody>   
			
		</table> 
	<div id="reducePenaltyPrint"></div>
	<div id="reducePenaltyPrint2"></div>
	<div style="text-align: center;display: none;">
	    <a id="reducePenalty_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印治安管理处罚建议书
function revokeProbation_printjys(id) {
	var url = '${ctx}/rewardspunishment/reducePenalty/print?&type=1&id='+id;
	 $('#reducePenaltyPrint').dialog({ 
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
					$('#reducePenaltyPrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#reducePenaltyPrint').dialog('close');
				}
			}]  
		}); 
	 
	 $('#reducePenaltyPrint').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/reducePenalty/updateFinshInfo?id='+id+'&isPrintJYS=1',
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




$('#reducePenalty_inform_btn').click(function (){
	$('#reducePenaltyPrint2').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/reducePenalty/inform?id=${reducePenalty.id}&taskId=${reducePenalty.taskId}&auditType=${reducePenalty.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#reducePenalty_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#reducePenaltyPrint2').dialog('close');
			}
		}]
	});
	$('#reducePenaltyPrint2').window('center');
});



</script>

