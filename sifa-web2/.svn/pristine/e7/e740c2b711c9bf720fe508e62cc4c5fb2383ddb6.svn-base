<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<form id="auditWorkRemindForm13" action="" method="post">
		<input type="hidden" name="id" value="${workRemind.id}"/>
			<table width="100%" class="grid">
				<tr>
					<th  width="30%"><span class="c-red"></span>处理结果：</th>
						<td >
							<input name="dicWorkResult" id="dicWorkResult13" required=true class="easyui-combobox" 
	                  	data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1720000',panelHeight:'auto',panelMaxHeight:200,editable:false"></input>
						</td>
				</tr>
			</table>
		</form>
</div>
<div style="text-align: center;display: none;">
	    <a id="auditWorkRemindBtn" class="easyui-linkbutton" >提交</a>
</div>
<div id="dealAdd13"></div>
<script>
$('#auditWorkRemindBtn').click(function(){
	if($('#auditWorkRemindForm13').form('validate')){
		var dialogParent = $('#dealAdd13').parent();  
	    var dialogOwn = $('#dealAdd13').clone();  
	    dialogOwn.hide();
		if($('#dicWorkResult13').combobox('getValue')=="1720001"){//延长监外执行
			$('#dealAdd13').dialog({
				title : '新增延长监外执行',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/dailymgr/outOfPrison/form?culpritId=${workRemind.recordId}',
		        resizable : true,
		        maximizable:true,
		        onClose : function() {
					 dialogOwn.appendTo(dialogParent);  
		            $(this).dialog("destroy").remove();
		        },
		        buttons : [ {
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		            	 $('#d_outOfPrisonInfo').form('submit');
	            		  $.ajax({
								type: 'post' ,
								url: '${ctx}/homepage/workRemind/update',
								cache:false ,
								data: $.serializeObject($('#auditWorkRemindForm13')),
								dataType:'json',
								success:function(result){
									$('#dealAdd13').dialog('close');
									$('#audit13').dialog('close');
							   		$('#view_list_workRemind13').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd13').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult13').combobox('getValue')=="1720002"){//提请撤销暂予监外执行
			$('#dealAdd13').dialog({
				title : '新增提请撤销暂予监外执行',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeOutOfPrison/form?culpritId=${workRemind.recordId}',
		        resizable : true,
		        maximizable:true,
		        onClose : function() {
					 dialogOwn.appendTo(dialogParent);  
		            $(this).dialog("destroy").remove();
		        },
		        buttons : [ {
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		                $('#outOfPrisonInfo').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm13')),
							dataType:'json',
							success:function(result){
								$('#dealAdd13').dialog('close');
								$('#audit13').dialog('close');
						   		$('#view_list_workRemind13').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd13').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult13').combobox('getValue')=="1720003"){//期满解矫 
			$('#dealAdd13').dialog({
				title : '新增期满解矫',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/endcorrect/finishRedress/add?culpritId=${workRemind.recordId}',
		        resizable : true,
		        maximizable:true,
		        onClose : function() {
					 dialogOwn.appendTo(dialogParent);  
		            $(this).dialog("destroy").remove();
		        },
		        buttons : [ {
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		                $('#finishRedressForm').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm13')),
							dataType:'json',
							success:function(result){
								$('#dealAdd13').dialog('close');
								$('#audit13').dialog('close');
						   		$('#view_list_workRemind13').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd13').dialog('close');
		             }
		        }  ]
			})
		}
		
	}else{
		parent.$.messager.alert('提示信息', '请选择处理结果！');
	}

});

</script>