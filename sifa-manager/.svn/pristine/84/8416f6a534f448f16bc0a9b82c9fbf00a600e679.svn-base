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
 					<td>撤销缓刑建议书</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeProbation_printjys('${revokeProbation.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="revokeProbation_isPrintJYS"><c:if test="${revokeProbation.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>撤销缓刑审批表</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeProbation_printshb('${revokeProbation.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="revokeProbation_isPrintSHB"><c:if test="${revokeProbation.isPrintSHB==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="revokeProbation_printjysDialog"></div>
	<div id="revokeProbation_printshbDialog"></div>
	<div id="revokeProbation_informDialog"></div>
	<div style="text-align: center;display: none;">
	    <a id="revokeProbation_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印撤销缓刑建议书
function revokeProbation_printjys(id) {
	 $('#revokeProbation_printjysDialog').dialog({ 
		 title: '打印《撤销缓刑建议书》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height:800,    
		    href: '${ctx}/rewardspunishment/revokeProbation/printJianYi?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeProbationBook').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeProbation_printjysDialog').dialog('close');
				}
			}]  
		}); 
	 
	 $('#revokeProbation_printjysDialog').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/revokeProbation/updateFinshInfo?id='+id+'&isPrintJYS=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#revokeProbation_isPrintJYS').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}

///打印撤销缓刑建议书
function revokeProbation_printshb(id) {
	 $('#revokeProbation_printshbDialog').dialog({ 
		 title: '打印《撤销缓刑审批表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/rewardspunishment/revokeProbation/printShenghe?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeProbationTable').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeProbation_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#revokeProbation_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/revokeProbation/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#revokeProbation_isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}


$('#revokeProbation_inform_btn').click(function (){
	$('#revokeProbation_informDialog').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/revokeProbation/inform?id=${revokeProbation.id}&taskId=${revokeProbation.taskId}&auditType=${revokeProbation.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#revokeProbation_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#revokeProbation_informDialog').dialog('close');
			}
		}]
	});
	$('#revokeProbation_informDialog').window('center');
});



</script>

