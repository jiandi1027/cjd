<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" id="moveIn_finish_list_content" 
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
 					<td>社区服刑人员居住地变更审批表</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="moveIn_printjys('${moveIn.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrintJYS" id="moveIn_isPrintBGSP"><c:if test="${moveIn.isPrintBGSP==1 }">已打印</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>社区服刑人员居住地变更证明</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="moveIn_printshb('${moveIn.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="isPrintSHB" id="moveIn_isPrintBGZM"><c:if test="${moveIn.isPrintBGZM==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
			
		</table> 
	<div id="moveIn_printjysDialog"></div>
	<div id="moveIn_printshbDialog"></div>
	<div id="moveIn_informDialog"></div>
<script type="text/javascript">

///打印社区服刑人员居住地变更审批表
function moveIn_printjys(id) {
	 $('#moveIn_printjysDialog').dialog({ 
		 title: '打印《社区服刑人员居住地变更审批表》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height:700,    
		    href: '${ctx}/culprit/moveIn/print?type=1&id='+id,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#movePrintBGSPB_btn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#moveIn_printjysDialog').dialog('close');
				}
			}]  
		}); 
	 
	 $('#moveIn_printjysDialog').window('center');
	  $.ajax({
			type : 'post',
			url : '${ctx}/culprit/moveIn/updateFinshInfo?id='+id+'&isPrintBGSP=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#moveIn_isPrintBGSP').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}

///打印撤销缓刑建议书
function moveIn_printshb(id) {
	 $('#moveIn_printshbDialog').dialog({ 
		 title: '打印《社区服刑人员居住地变更证明》',
	        iconCls:'fi-print icon-blue',
		    width: 900,    
		    height: 700,    
		    href: '${ctx}/culprit/moveIn/print?type=2&id='+id, 
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#movePrintBGZM_btn').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#moveIn_printshbDialog').dialog('close');
				}
			}]
		}); 
	 $('#moveIn_printshbDialog').window('center');
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/culprit/moveIn/updateFinshInfo?id='+id+'&isPrintBGZM=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#moveIn_isPrintBGZM').html('已打印');
			},
			error : function(result) {
				
			}
		}); 
}

</script>

