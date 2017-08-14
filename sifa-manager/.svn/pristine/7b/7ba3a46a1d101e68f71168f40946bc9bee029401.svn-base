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
 					<td>延长暂予监外执行建议书</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="outOfPrison_printjys('${outOfPrison.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="outOfPrison_isPrintJYS"><c:if test="${outOfPrison.isPrintJYS==1 }">已打印</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>延长暂予监外执行审核表</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="outOfPrison_printshb('${outOfPrison.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="outOfPrison_isPrintSHB"><c:if test="${outOfPrison.isPrintSHB==1 }">已打印</c:if></span></td>
		        </tr>
		        <tr>   
		            <td>社区矫正人员医学司法鉴定委托书</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="outOfPrison_printyixue('${outOfPrison.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintYiXue" id="outOfPrison_isPrintYiXue"><c:if test="${outOfPrison.isPrintYiXue==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="outOfPrison_printjysDialog"></div>
	<div id="outOfPrison_printshbDialog"></div>
	<div id="outOfPrison_printyixueDialog"></div>
	<div id="outOfPrison_informDialog"></div>
	<div style="text-align: center;display: none;">
	    <a id="outOfPrison_inform_btn" class="easyui-linkbutton" >告知</a>
    </div>
<script type="text/javascript">

///打印撤销缓刑建议书
function outOfPrison_printjys(id) {
	 $('#outOfPrison_printjysDialog').dialog({ 
		 title: '打印《延长暂予监外执行建议书》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height:800,    
		    href: '${ctx}/dailymgr/outOfPrison/printJianYi?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#outOfPrisonBookPrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#outOfPrison_printjysDialog').dialog('close');
				}
			}]  
		}); 
	 
	 $('#outOfPrison_printjysDialog').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/outOfPrison/updateFinshInfo?id='+id+'&isPrintJYS=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#outOfPrison_isPrintJYS').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}

///打印撤销缓刑建议书
function outOfPrison_printshb(id) {
	 $('#outOfPrison_printshbDialog').dialog({ 
		 title: '打印《延长暂予监外执行审核表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/dailymgr/outOfPrison/printShenhe?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#outOfPrisonTablePrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#outOfPrison_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#outOfPrison_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/outOfPrison/updateFinshInfo?id='+id+'&isPrintSHB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#outOfPrison_isPrintSHB').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}


///打印医学委托书
function outOfPrison_printyixue(id) {
	 $('#outOfPrison_printyixueDialog').dialog({ 
		 title: '打印《社区矫正人员医学司法鉴定委托书》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 800,    
		    href: '${ctx}/dailymgr/outOfPrison/printYiXue?id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#outOfPrisonYiXuePrintBtn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#outOfPrison_printyixueDialog').dialog('close');
				}
			}]
		}); 
	 $('#outOfPrison_printyixueDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/dailymgr/outOfPrison/updateFinshInfo?id='+id+'&isPrintYiXue=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#outOfPrison_isPrintYiXue').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}




$('#outOfPrison_inform_btn').click(function (){
	$('#outOfPrison_informDialog').dialog({
	    title: '告知',
        iconCls:'fi-results-demographics icon-blue',
	    width: 700,    
	    height:250,    
	    href: '${ctx}/dailymgr/outOfPrison/inform?id=${outOfPrison.id}&taskId=${outOfPrison.taskId}&auditType=${outOfPrison.auditType}',    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'提交',
            iconCls:'fi-check icon-blue',
			handler:function(){
				$('#outOfPrison_saveInform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#outOfPrison_informDialog').dialog('close');
			}
		}]
	});
	$('#outOfPrison_informDialog').window('center');
});



</script>

