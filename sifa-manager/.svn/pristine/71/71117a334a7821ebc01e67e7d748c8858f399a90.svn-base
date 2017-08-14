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
 					<td>社区服刑人员警告审批表</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeProbation_printjys('${warning.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="isPrintJYS"><c:if test="${warning.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>违反社区矫正规定警告决定书</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="revokeProbation_printshb('${warning.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="isPrintSHB"><c:if test="${warning.isPrintSHB==1 }">已打印</c:if></span></td> 
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="securityPunishmentPrint"></div>
	<div id="securityPunishmentPrint1"></div>
	<div id="securityPunishmentPrint2"></div>
	<div style="text-align: center;display: none;">
	    <a id="warning_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印治安管理处罚建议书
function revokeProbation_printjys(id) {
	var url = '${ctx}/rewardspunishment/warning/print?&type=1&id='+id;
	 $('#securityPunishmentPrint').dialog({ 
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
					$('#securityPunishmentPrintBtn2').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#securityPunishmentPrint').dialog('close');
				}
			}]  
		}); 
	 
	 $('#securityPunishmentPrint').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/warning/updateFinshInfo?id='+id+'&isPrintJYS=1',
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

///打印撤销缓刑审批表
function revokeProbation_printshb(id) {
	var url = '${ctx}/rewardspunishment/warning/print?&type=2&id='+id;
	 $('#securityPunishmentPrint1').dialog({ 
		 title: '打印《撤销缓刑审批表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: url,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#warningPrintBtn1').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#securityPunishmentPrint1').dialog('close');
				}
			}]
		}); 
	 $('#securityPunishmentPrint1').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/rewardspunishment/warning/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}


$('#warning_inform_btn').click(function (){
	$('#securityPunishmentPrint2').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/rewardspunishment/warning/inform?id=${warning.id}&taskId=${warning.taskId}&auditType=${warning.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#warning_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#securityPunishmentPrint2').dialog('close');
			}
		}]
	});
	$('#securityPunishmentPrint2').window('center');
});



</script>

