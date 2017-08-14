<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<form id="auditWorkRemindForm2_5" action="" method="post">
		<input type="hidden" name="id" value="${workRemind.id}"/>
			<table width="100%" class="grid">
				<tr>
					<th  width="30%"><span class="c-red"></span>处理结果：</th>
						<td >
							<input name="dicWorkResult" id="dicWorkResult" required=true class="easyui-combobox" 
	                  	data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1600000',panelHeight:'auto',panelMaxHeight:200,editable:false"></input>
						</td> 
				</tr>
			</table>
		</form>
</div>
<div style="text-align: center;display: none;">
	    <a id="auditWorkRemindBtn" class="easyui-linkbutton" >提交</a>
</div>
<div id="dealAdd2-5"></div>
<script>
$('#auditWorkRemindBtn').click(function(){
	if($('#auditWorkRemindForm2_5').form('validate')){
		var dialogParent = $('#dealAdd2-5').parent();  
	    var dialogOwn = $('#dealAdd2-5').clone();  
	    dialogOwn.hide();
		if($('#dicWorkResult').combobox('getValue')=="1600002"){//待处理做不处理  
			$('#dealAdd2-5').dialog({
				title : '新增待处理不作处理',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/noDeal/add?culpritId=${workRemind.recordId}',
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
		               /*  $('#dealAdd2-5').dialog('close');
		                $('#auditWorkRemindForm2_5').form('submit'); */
		                $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600008"){//口头警告 
			$('#dealAdd2-5').dialog({
				title : '新增口头警告',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/verbalWarning/add?culpritId=${workRemind.recordId}',
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600003"){//警告 
			$('#dealAdd2-5').dialog({
				title : '新增警告',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/warning/add?culpritId=${workRemind.recordId}',
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600004"){//治安管理处罚 
			$('#dealAdd2-5').dialog({
				title : '新增提请治安管理处罚',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/rewardspunishment/securityPunishment/form?culpritId=${workRemind.recordId}',
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600005"){//撤销缓刑
			$('#dealAdd2-5').dialog({
				title : '新增提请撤销缓刑',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeProbation/form?culpritId=${workRemind.recordId}',
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600006"){//撤销假释
			$('#dealAdd2-5').dialog({
				title : '新增提请撤销假释',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/rewardspunishment/revokeParole/form?culpritId=${workRemind.recordId}',
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600007"){//撤销监外执行
			$('#dealAdd2-5').dialog({
				title : '新增提请暂予监外执行',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-300,
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
							data: $.serializeObject($('#auditWorkRemindForm2_5')),
							dataType:'json',
							success:function(result){
								$('#dealAdd2-5').dialog('close');
								$('#audit1_6').dialog('close');
						   		$('#view_list_workRemind1_6').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}else if($('#dicWorkResult').combobox('getValue')=="1600001"){//办理入矫
			$('#dealAdd2-5').dialog({
				title : '办理入矫',
		        iconCls:'fi-book icon-blue',
		        width : sy.getBrowerWidth()-700,
		        height : 400,
		        href : '${ctx}/culpritinfo/culprit/deal?id=${workRemind.recordId}',
		        resizable : true,
		        maximizable:true,
		        onClose : function() {
					 dialogOwn.appendTo(dialogParent);  
		            $(this).dialog("destroy").remove();
		        },
		        buttons : [ {
		            text : '完成入矫',
		            iconCls:'icon-save',
		            handler : function() {
		            	for(var i=1;i<10;i++){
	                		var finish=$('#finshInfo'+i).html();
	                		if(finish==''){
	                			$.messager.alert({
	            					title : '提示信息!',
	            					msg : '请确认首次报到各事项是否完成!'
	            				});	
	                			return false;
	                		}
	                	}
	                	               	
	                	$.messager.confirm('提示信息', '确认完成入矫?', function(r) {
	        				if (r) {
	        					$.ajax({
	                    			type : 'post',
	                    			url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id=${workRemind.recordId}&finshInfo=1',
	                    			cache : false,
	                    			async : false, //同步请求
	                    			dataType : 'json',
	                    			success : function(result) {
	                    				if(result.status==200){
	                    				$.messager.show({
	                    					title : '提示信息!',
	                    					msg : '完成入矫!'
	                    				});	
	                    				}
	                    			}
	                    		});
	                        	
	        					 $.ajax({
	     							type: 'post' ,
	     							url: '${ctx}/homepage/workRemind/update',
	     							cache:false ,
	     							data: $.serializeObject($('#auditWorkRemindForm2_5')),
	     							dataType:'json',
	     							success:function(result){
	     								$('#dealAdd2-5').dialog('close');
	     								$('#audit1_6').dialog('close');
	     						   		$('#view_list_workRemind1_6').datagrid('reload');
	     							} 
	     						});
	        					
	        				} else {
	        					return;
	        				}
	        			});  
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd2-5').dialog('close');
		             }
		        }  ]
			})
		}
			
		
	}else{
		parent.$.messager.alert('提示信息', '请选择处理结果！');
	}

});

</script>