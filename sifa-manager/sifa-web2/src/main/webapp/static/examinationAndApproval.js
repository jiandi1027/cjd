function submitCommend(url,roleId){
	if(roleId!='3003'&& roleId!='2007'){
		 parent.$.modalDialog({
	         title : '表扬审核审批',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         maximizable:true,
	         resizable:true,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url,
	         buttons : [ {
	             text : '审批',
	             iconCls:'fi-clipboard-pencil icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#commendAuditForm');
	                 f.submit();
	             }
	             },{
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.handler.dialog('close');
					}
	         }]
	     });
	}else{
		 parent.$.modalDialog({
	         title : '表扬审核审批',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         maximizable:true,
	         resizable:true,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url,
	         buttons : [ {
	             text : '上报',
	             iconCls:'fi-clipboard-pencil icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#commendAuditForm');
	                 f.submit();
	             }
	         },{
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.handler.dialog('close');
					}
	         }]
	     });
	}
	
	}
//警告
function submitWarning(url,auditType){
	
	var buttonName='审批';
	if(auditType=='usertask2'||auditType=='usertask1'){
		buttonName='上报'
	}
	if(auditType=='usertask6'){
		 parent.$.modalDialog({
	         title : '文书打印',
	         iconCls:'fi-print icon-blue',
	         maximizable:true,
	         resizable:true,
	         width : 500,
		     height :300,
	         href : '${ctx}/rewardspunishment/warning/warningFinishPrint?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
		            text : "告知",
		            iconCls:'fi-results-demographics icon-blue',
		            handler : function() {
		            	if($('#isPrintJYS').html()=='' || $('#isPrintSHB').html()==''){
		            		$.messager.alert({
	        					title : '提示信息!',
	        					msg : '请打印后再告知!'
	        				});	
		            		return false;
		            	}
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	var f = parent.$.modalDialog.handler.find('#warning_inform_btn');
		                f.click();
		                }
		            },{
		                text : '关闭',
		                iconCls:'fi-x icon-blue',
		                handler : function() {
		               	 parent.$.modalDialog.handler.dialog('close');
		                } 
		            }]
	     });	
	}else{
		
		 parent.$.modalDialog({
	         title : '警告审核审批',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         maximizable:true,
	         resizable:true,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/warning/warningAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
	             text : buttonName,
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
	                 f.submit();
	             }
	         },{
                 id : 'listWorkerPrint1',
                 text : '关闭',
                 iconCls:'fi-x icon-blue',
                 handler : function() {
                     parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                     parent.$.modalDialog.handler.dialog('close');
                 }
         
         }]
	     });
	}
	
}
//减刑
function submitReducePenalty(url,auditType){
	var text = '审核';
	if(auditType=='usertask1'||auditType=='usertas2'){
		text='上报';
	}
	
	if(auditType=='usertask11'){
		
		parent.$.modalDialog({
	         title : '减刑审批',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         width : 500,
		     height :300,
	         resizable : true,
	         maximizable:true, 
	         href : '${ctx}/rewardspunishment/reducePenalty/reducePenaltyPrint?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
		            text : "告知",
		            iconCls:'fi-results-demographics icon-blue',
		            handler : function() {
		            	if($('#isPrintJYS').html()=='' || $('#isPrintSHB').html()==''){
		            		$.messager.alert({
	        					title : '提示信息!',
	        					msg : '请打印后再告知!'
	        				});	
		            		return false;
		            	}
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	var f = parent.$.modalDialog.handler.find('#reducePenalty_inform_btn');
		                f.click();
		                }
		            },{
		                text : '关闭',
		                iconCls:'fi-x icon-blue',
		                handler : function() {
		               	 parent.$.modalDialog.handler.dialog('close');
		                } 
		            }]
	     });
	}else{
		parent.$.modalDialog({
	         title : '减刑审批',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         resizable : true,
	         maximizable:true, 
	         href : '${ctx}/rewardspunishment/reducePenalty/commendAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
	             text : text,
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
	                 f.submit();
	             }
	         },{
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.openner_dataGrid = $('#t_list_content')
								.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.handler.dialog('close');
					}
	         }]
	     });
	}

}
//迁出
function submitOutOf(url) {
	parent.$.modalDialog({
		title : '迁出审核审批',
		iconCls : 'fi-clipboard-pencil icon-blue',
		width : sy.getBrowerWidth() * 0.8,
		height : sy.getBrowerHeight() * 0.9,
		 maximizable:true,
         resizable:true,
		href : url,
		buttons : [ {
			text : '上报',
			iconCls : 'icon-save',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = $('#t_list_outof')
						.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				var f = parent.$.modalDialog.handler
						.find('#askLeaveAuditForm');
				f.submit();
			}
		},{
				text : '关闭',
			iconCls : 'fi-x icon-blue',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = $('#t_list_outof')
						.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				parent.$.modalDialog.handler.dialog('close');
			}
     } ]
	});
}
//监管等级
function reportAuditGradeChange(url,auditType){
	
	if("firstReport"==auditType){
		$('#changeRecord').dialog({    
		    title: '上报',    
		    iconCls : 'fi-clipboard-pencil icon-blue',
		    width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
		    href: url,   
		    modal: true,
	        resizable : true,
		    buttons :[{
				text:'上报',
				iconCls:'fi-clipboard-pencil icon-blue',
				handler:function(){
					$('#returnId1').click();
				}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						$('#returnId').click();
		                 
					}
			}]
		}) 
	}else{
 	$('#changeRecord').dialog({    
	    title: '审核',    
	    iconCls : 'fi-clipboard-pencil icon-blue',
	    width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
	    href: url,   
	    modal: true,
        resizable : true,
	    buttons :[{
			text:'审核',
			iconCls:'fi-clipboard-pencil icon-blue',
			handler:function(){
				$('#levelId').click();
			}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#returnId').click();
	                 
				}
		}]
	}) 
	} 
	/*    
	 parent.$.modalDialog({
         title : '审批',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         href:'${ctx}/dailymgr/gradeChange/gradeChangeAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processInstanceId,
         buttons : [ {
             text : '上报',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#change_record_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#culpritInfo');
                 f.submit();
             }
         },{
 				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = $('#change_record_list_content')
							.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');

				}
		
		}]
	});  */
	$('#changeRecord').window('center');



}
//假释
function submitAuditParole(url,auditType){
	var text = '审批';
	var title='流程审批';
	var iconCls='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsReport'){
		text='上报';
		title='上报';
		iconCls='fi-arrow-up icon-blue';
	}if(auditType=='gs'){
		text='提交';
		title='公示';
		iconCls='fi-clipboard-pencil icon-blue';
	}
	if(auditType=='sgzryPrint'){
		parent.$.modalDialog({
	         title : '文书打印',
	         iconCls:'fi-clipboard-pencil icon-blue',
	         width : 500,
		     height :300,
	         resizable : true,
	         maximizable:true, 
	         href : url,
	         buttons : [ {
		            text : "告知",
		            iconCls:'fi-results-demographics icon-blue',
		            handler : function() {
		            	if($('#isPrintJYS').html()==''){
		            		$.messager.alert({
	        					title : '提示信息!',
	        					msg : '请打印后再告知!'
	        				});	
		            		return false;
		            	}
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	var f = parent.$.modalDialog.handler.find('#parole_inform_btn');
		                f.click();
		                }
		            },{
		                text : '关闭',
		                iconCls:'fi-x icon-blue',
		                handler : function() {
		               	 parent.$.modalDialog.handler.dialog('close');
		                } 
		            }]
	     });
	}else{
		parent.$.modalDialog({
	         title : title,
	         iconCls:iconCls,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-200,
	         resizable : true,
	         maximizable:true, 
	         href : url,
	         buttons : [ {
	             text : text,
	             iconCls:iconCls,
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#paroleAuditForm');
	                 f.submit();
	             }
	         },{
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.handler.dialog('close');
					}
	         }]
	     });
	}
	 /*parent.$.modalDialog({
         title : '假释审核',
         iconCls:'fi-clipboard-pencil icon-blue',
         resizable : true,
         maximizable:true,
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         href :url,
         buttons : [ {
             id:'audit',
        	 text : '审核',
             iconCls:'fi-clipboard-pencil icon-blue',
             handler : function() {
            
            	  parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#paroleAudit');
	                 f.click();
             }
         },  {
             id:"update",
        	 text : '修改',
             iconCls:'fi-print icon-blue',
             handler : function() {
            	  parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#paroleUpdate');
	                 f.click();
                 }
             },{
                 id:'public',
            	 text : '公示',
                 iconCls:'fi-print icon-blue',
                 handler : function() {
                	  parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
 	                 var f = parent.$.modalDialog.handler.find('#parolePublic');
 	                 f.click();
 	               
                     }
                 },{
                     id:'procuratorate1',
                	 text : '报检察院',
                     iconCls:'fi-print icon-blue',
                     handler : function() {
                    	 
                          parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();
                    	  var f = parent.$.modalDialog.handler.find('#procuratorial');
                    	  f.click();
                         }
                     },{
                	 id : 'listWorkerPrint1',
                	 text : '关闭',
                 	 iconCls:'fi-x icon-blue',
                 	 handler : function() {
                     parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                     parent.$.modalDialog.handler.dialog('close');
                 }
         
         } ]
     });
	 $('#update').hide();
	 $('#audit').hide();
	 $('#procuratorate1').hide();
	 $('#public').hide();
	 if(auditType == 'procuratorate'){
		 $('#procuratorate1').show();
	 } else if(auditType == 'publicity'){
		 $('#public').show();
	 }else if(auditType != 'procuratorate1' && auditType != 'publicity' ){
		 $('#audit').show();
	 }else if(auditType == 'sfsAccept'){
		 $('#update').show();
	 }*/
	 
}


//提请撤销缓刑流程审批
function submitRevokeProbation_of_needDeal(url,url1,auditType){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
	        title : '流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-350,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : url,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#revokeProbationAuditForm');
	                f.submit();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	                	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#revokeProbation_isPrintJYS').html()=='' || $('#revokeProbation_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#revokeProbation_inform_btn');
	                f.click();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}
}

//提请撤销假释
function submitRevokeParole_of_needDeal(url,url1,auditType){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
	        title :'流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-350,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : url,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#revokeParoleAuditForm');
	                f.submit();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	        }]		
	    });
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#revokeParole_isPrintJYS').html()=='' || $('#revokeParole_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#revokeParole_inform_btn');
	                f.click();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}
}

//提请撤销监外执行
function submitRevokeOutOfPrison_of_needDeal(url,url1,auditType){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
	        title :'流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-350,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : url,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#revokeOutOfPrisonAuditForm');
	                f.submit();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	        }]		
	    });
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#revokeOutOfPrison_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#revokeOutOfPrison_inform_btn');
	                f.click();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}

}

//延长监外执行
function submitOutOfPrison_of_needDeal(url,url1,auditType){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
		       title : '流程审批',
		       iconCls:'fi-clipboard-pencil icon-blue',
		       width : sy.getBrowerWidth()-300,
		       height : sy.getBrowerHeight()-150,
		       resizable:true,
		       maximizable:true,
		       href : url,
		       buttons : [ {
		           text : buttonName,
		           iconCls:'fi-clipboard-pencil icon-blue',
		           handler : function() {
		               parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               var f = parent.$.modalDialog.handler.find('#outOfPrisonAuditForm');
		               f.submit();
		           	}
		           },{
		               text : '关闭',
		               iconCls:'fi-x icon-blue',
		               handler : function() {
		              	 parent.$.modalDialog.handler.dialog('close');
		               } 
		       }]
		});
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#outOfPrison_isPrintJYS').html()=='' || $('#outOfPrison_isPrintSHB').html()=='' || $('#outOfPrison_isPrintYiXue').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#outOfPrison_inform_btn');
	                f.click();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}
}



//进入特定区域管理
function submitSpecialArea_of_needDeal(url,url1,auditType){
	var buttonName='审批';
	var icon='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsPrint'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint'){
		parent.$.modalDialog({
		       title : '流程审批',
		       iconCls:icon,
		       width : sy.getBrowerWidth()-300,
		       height : sy.getBrowerHeight()-200,
		       resizable:true,
		       maximizable:true,
		       href : url,
		       buttons : [ {
		           text : buttonName,
		           iconCls:'fi-clipboard-pencil icon-blue',
		           handler : function() {
		               parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               var f = parent.$.modalDialog.handler.find('#specialAuditForm');
		               f.submit();
		           }
		       },{
		           text : '关闭',
		           iconCls:'fi-x icon-blue',
		           handler : function() {
		          	 parent.$.modalDialog.handler.dialog('close');
		           } 
		       }]
		});
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#specialArea_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#specialArea_inform_btn');
	                f.click();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}
}


//脱管管理
function submitDetached_of_needDeal(url,auditType){
	var buttonName='审批';
	if(auditType=='sfsPut'){
		buttonName='处理';
	}
	parent.$.modalDialog({
        title : '流程审批',
        iconCls:'fi-clipboard-pencil icon-blue',
        width : sy.getBrowerWidth()-300,
        height : sy.getBrowerHeight()-290,
        resizable:true,
        maximizable:true,
        href : url,
        buttons : [ {
            text : buttonName,
            iconCls:'fi-clipboard-pencil icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#detachedAuditForm');
                f.submit();
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        } ]
    });
}



//审前调查
function submitInvestigate_of_needDeal(ctx,id,taskId,auditType,processId,personId){
	var investigatorId1 = '';
	var investigatorId2 = '';
	var applyUnLock = '';
	
	$.ajax({
		type : 'post',
		url : ctx+'/investigate/findInvestigate',
		data : {id:id},
		dataType : 'json',
		async : false,
		success : function(result) {
			var data = result.data;
			investigatorId1 = data.investigatorId1;
			investigatorId2 = data.investigatorId2;
			applyUnLock = data.applyUnLock;
		},
		error : function(result) {
			$.messager.show({
				title : '提示信息',
				msg : '操作失败，请联系管理员！'
			});
		}
	});
	
	
	if (auditType == 'jzkAssign') {
		parent.$.modalDialog({
	        title : '审前调查指派',
	        iconCls:'fi-arrow-right icon-blue',
	        width : 800,
	        height : 550,
	        href : ctx+"/investigate/assign?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        resizable : true,
	        maximizable:true, 
	        buttons : [  {
	        	id : 'saveOfAssign',
	            text : '保存',
	            iconCls:'fi-save icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#investigateAssign3');
	                f.click();
	            }
	        }, {
	            text : '指派',
	            iconCls:'fi-arrow-right icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#investigateAssign1');
	                f.click();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        } ]
	    });
		
	}
	else if (auditType == 'sfsCheck'){
		parent.$.modalDialog({
	        title : '审前调查受理',
	        iconCls:'fi-play icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : 500,
	        href : ctx+"/investigate/investigatePush?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        resizable : true,
	        maximizable:true, 
	        buttons : [{
	            text : '提交',
	            iconCls:'fi-arrow-up icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#investigatePush');
	                f.submit();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.handler.dialog('close');
	            }
			}]
		});
		
	}
	else if (auditType == 'workerReport'){
		if(investigatorId1 == personId || investigatorId2 == personId) {
			parent.$.modalDialog({
		        title : '审前调查内容',
		        iconCls:'fi-pencil icon-blue',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : ctx+"/investigate/investigateWorkerReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
		        resizable : true,
		        maximizable:true, 
		        buttons : [{
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#workerReportBtn1');
		                f.click();
		            }
		        }, {
		            text : '草拟评估意见上报',
		            iconCls:'fi-arrow-up icon-blue',
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#workerReportBtn2');
		                f.click();
		            }
		        }, {
		            text : '关闭',
		            iconCls:'fi-x icon-blue',
		            handler : function() {
		            	//$('#t_list_examinationAndApproval').datagrid().datagrid('reload');
		            	//parent.$.modalDialog.handler.dialog('close');
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		            	var f = parent.$.modalDialog.handler.find('#workerReportBtn3');
		                f.click();
		            }
		        }]
		    });
		}
		
	}
	else if (auditType == 'szCheck'){
		if(applyUnLock == '2'){
			progressLoad();
			$.ajax({
				type : 'post',
				url : ctx+'/investigate/investigateAudit?type=1&id=' + id + '&taskId=' + taskId + '&auditType=' + auditType,
				dataType : 'json',
				cache : false,
				async : false, //同步请求
				success : function(result) {
		        	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '解锁成功'
					});

					$('#t_list_examinationAndApproval').datagrid('reload');
					//2 清空idField   
					$('#t_list_examinationAndApproval').datagrid('uncheckAll');
				},
				error : function(result) {
		        	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '解锁失败'
					});
				}
			});
		}
		else if(applyUnLock == '1'){
			$.messager.show({
				title : "提示信息",
				msg : "已经申请上报解锁，请等待县局解锁处理"
			});
		}
		else {
			parent.$.modalDialog({
		        title : '审前调查上报',
		        iconCls:'fi-arrow-up icon-blue',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        resizable : true,
		        maximizable:true, 
		        href : ctx+"/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
		        buttons : [{
		            text : '审核',
		            iconCls:'fi-clipboard-pencil icon-blue',
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#reportBtn2');
		                f.click();
		            }
		        }, {
		            text : '退回',
		            iconCls:'fi-arrow-left icon-blue',
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#reportBtn3');
		                f.click();
		            }
		        }, {
		            text : '关闭',
		            iconCls:'fi-x icon-blue',
		            handler : function() {
		            	$('#t_list_examinationAndApproval').datagrid().datagrid('reload');
		            	parent.$.modalDialog.handler.dialog('close');
		            }
		        }]
		    });
		}
		
	}
	else if (auditType == 'reportUnlocked'){
		parent.$.modalDialog({
	        title : '审前调查解锁',
	        iconCls:'fi-unlock icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable : true,
	        maximizable:true, 
	        href : ctx+"/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [{
	            text : '上报解锁',
	            iconCls:'fi-unlock icon-green',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#reportBtn1');
	                f.click();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	//$('#t_list_examinationAndApproval').datagrid().datagrid('reload');
	            	//parent.$.modalDialog.handler.dialog('close');
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	            	var f = parent.$.modalDialog.handler.find('#reportBtn4');
	                f.click();
	            }
	        }]
	    });
		
	}
	else if (auditType == 'jzkCheck' || auditType == 'fzkCheck' || auditType == 'xfgCheck'){
		parent.$.modalDialog({
	        title : '审前调查上报',
	        iconCls:'fi-arrow-up icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable : true,
	        maximizable:true, 
	        href : ctx+"/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [{
	            text : '审核',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#reportBtn2');
	                f.click();
	            }
	        }, {
	            text : '退回',
	            iconCls:'fi-arrow-left icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#reportBtn3');
	                f.click();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	$('#t_list_examinationAndApproval').datagrid().datagrid('reload');
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        }]
	    });
		
	}
	else if (auditType == 'workerPrint'){
		$.messager.confirm('提示信息', '是否确定结束流程?', function(b) {
		      if (b){  
		    	  $.ajax({
		  			type : 'post',
		  			//url : ctx+"/investigate/stopProcess?id=" + id + "&taskId=" + taskId,
		  			url : ctx+'/investigate/investigateAudit?type=1&id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
							$('#t_list_examinationAndApproval').datagrid('reload');
							//2 清空idField   
							$('#t_list_examinationAndApproval').datagrid('uncheckAll');
		  				}else{
		  					$.messager.alert('提示信息',result.msg);
		  				}
		  			}
		  		});
		      }
		});
		
	}
	else {
	}
}




