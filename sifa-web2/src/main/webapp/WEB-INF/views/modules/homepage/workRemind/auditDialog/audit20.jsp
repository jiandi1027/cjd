<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<form id="auditWorkRemindForm20" action="" method="post">
		<input type="hidden" name="id" value="${workRemind.id}"/>
			<table width="100%" class="grid">
				<tr>
					<th  width="30%"><span class="c-red"></span>处理结果：</th>
						<td >
							<input name="dicWorkResult" id="dicWorkResult" required=true class="easyui-combobox" 
	                  	data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1730000',panelHeight:'auto',panelMaxHeight:200,editable:false"></input>
						</td> 
				</tr>
			</table>
		</form>
</div>
<div style="text-align: center;display: none;">
	    <a id="auditWorkRemindBtn" class="easyui-linkbutton" >提交</a>
</div>
<div id="dealAdd20"></div>
<script>
$('#auditWorkRemindBtn').click(function(){
	if($('#auditWorkRemindForm20').form('validate')){
		var dialogParent = $('#dealAdd20').parent();  
	    var dialogOwn = $('#dealAdd20').clone();  
	    dialogOwn.hide();
		if($('#dicWorkResult').combobox('getValue')=="1730001"){//待处理做不处理  
			$('#dealAdd20').dialog({
				title : '新增待处理不作处理',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/noDeal/add?culpritId=${workRemind.culpritId}',
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
		                $('#noDealForm').form('submit');
		               /*  $('#dealAdd20').dialog('close');
		                $('#auditWorkRemindForm20').form('submit'); */
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730002"){//口头警告 
			$('#dealAdd20').dialog({
				title : '新增口头警告',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/verbalWarning/add?culpritId=${workRemind.culpritId}',
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
		                $('#verbalWarningForm').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730003"){//警告 
			$('#dealAdd20').dialog({
				title : '新增警告',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/warning/add?culpritId=${workRemind.culpritId}',
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
		                $('#warningInfo').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730004"){//治安管理处罚 
			$('#dealAdd20').dialog({
				title : '新增提请治安管理处罚',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/securityPunishment/form?culpritId=${workRemind.culpritId}',
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
		                $('#securityPunishmentInfo').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730005"){//撤销缓刑
			$('#dealAdd20').dialog({
				title : '新增提请撤销缓刑',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeProbation/form?culpritId=${workRemind.culpritId}',
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
		                $('#probationInfo').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730006"){//撤销假释
			$('#dealAdd20').dialog({
				title : '新增提请撤销假释',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeParole/form?culpritId=${workRemind.culpritId}',
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
		                $('#praoleInfo').form('submit');
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1730007"){//撤销监外执行
			$('#dealAdd20').dialog({
				title : '新增提请暂予监外执行',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeOutOfPrison/form?culpritId=${workRemind.culpritId}',
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
							data: $.serializeObject($('#auditWorkRemindForm20')),
							dataType:'json',
							success:function(result){
								$('#dealAdd20').dialog('close');
								$('#audit20').dialog('close');
						   		$('#view_list_workRemind20').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd20').dialog('close');
		             }
		        }  ]
			})
		}
			
		
	}else{
		parent.$.messager.alert('提示信息', '请选择处理结果！');
	}

});

</script>