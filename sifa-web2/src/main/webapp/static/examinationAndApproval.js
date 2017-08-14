//出入境报备
function submitExitEntryReport(url1,auditType){
	if(auditType=='xfgCheck' || auditType=='xjzPrint'){
		var buttonName='审批';
		if(auditType=='xjzPrint'){
			buttonName='结束流程';
		}
		parent.$.modalDialog({
	        title : '流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : url1,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#exitEntryReportAuditForm');
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
	}
}
//迁入管理
function submitMoveIn(url,url0,url1,url2,url3,auditType){
	if(auditType=='sfsAccept'){
		parent.$.modalDialog({
	        title : '迁入调查受理',
	        iconCls:'fi-play icon-blue',
	        width : sy.getBrowerWidth()-300,
		    height : 550,
	        maximizable:true,
	        resizable:true,
	        href : url0,
	        buttons : [ {
	            text : '提交',
	            iconCls:'fi-arrow-right icon-blue',
	            handler : function() {
	            	 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					$('#diaoChaBtn').click();
	            }
	        },{text : '退回',
		    	iconCls:'fi-arrow-left icon-blue',
				 handler : function() {
					parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
					$('#backMoveIn').dialog({
						buttons : [ {
				            text : '退回',
				            iconCls:'fi-arrow-left icon-blue',
				            handler : function() {
				            	 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								$('#diaoChaBackBtn').click();
				            }
				        },{text : '关闭',
				        	iconCls:'fi-x icon-blue',
				     		 handler : function() {
				     			$('#backMoveIn').dialog('close');
								parent.$.modalDialog.handler.dialog('close');
								
				     		 }
						}]
					})
					$('#backMoveIn').dialog('open');
				 }
			} ,{text : '关闭',
	        	iconCls:'fi-x icon-blue',
	    		 handler : function() {
					parent.$.modalDialog.handler.dialog('close');	
	    		 }
			}]
	       
	    });
	}else if(auditType=='jzkReport'){
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : url2,
	        buttons : [ {
	            text : "提交",
	            iconCls:'icon-save',
	            handler : function() {
	            	if($('#moveIn_isPrintBGSP').html()=='' || $('#moveIn_isPrintBGZM').html()==''){
	            		$.messager.alert({
	    					title : '提示信息!',
	    					msg : '请打印后再提交!'
	    				});	
	            		return false;
	            	}
	            	$.ajax({
	        			type : 'post',
	        		 	url :url3,
	        			cache : false,
	        			async : false, //同步请求
	        			dataType : 'json',
	        			success : function(result) {
	        				if(result.status==200){
	        					$.messager.show({
	        						title : '提示信息!',
	        						msg : '流程结束!'
	        					});
	        					$('#t_list_examinationAndApproval').datagrid('reload');
	        		             parent.$.modalDialog.handler.dialog('close');
	        				}	
	        			}
	        		})
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	            }]
	    });
	}else if(auditType=='jzkZp'){
		parent.$.modalDialog({
	        title : '迁入指派',
	        iconCls:'fi-arrow-right icon-blue',
	        width : sy.getBrowerWidth()-200,
		    height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#moveInAddInfo');
	                f.submit();
	            }
	        },{
	            text : '指派',
	            iconCls:'fi-arrow-right icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	            	 var f = parent.$.modalDialog.handler.find('#zhipanWithSaveBtn');
	            	f.click();
	            }
	        },{
	       	 	text : '关闭',
	           	iconCls:'fi-x icon-blue',
	         		 handler : function() {
	         			parent.$.modalDialog.openner_dataGrid = $('#moveInAddInfo').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.handler.dialog('close');
	         		
	         		 }
			}  ]
	    });
	}else{
		var buttonName='审批';
		var title='流程审批';
		var iconCls='fi-clipboard-pencil icon-blue';
		if(auditType=='sfsReport'){
			buttonName='上报';
			title='上报';
			iconCls='fi-arrow-up icon-blue';
		}
		 parent.$.modalDialog({
		        title : title,
		        iconCls:iconCls,
		        width : sy.getBrowerWidth()-200,
			    height : sy.getBrowerHeight()-150,
		        href : url1,
		        resizable : true,
		        maximizable:true, 
		        buttons : [ {
		            text : buttonName,
		            iconCls:iconCls,
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#moveInAuditInfo');
		                f.submit();
		            }
		        },{
		       	 	text : '关闭',
		           	iconCls:'fi-x icon-blue',
		         		 handler : function() {
							parent.$.modalDialog.handler.dialog('close');
		         		
		         		 }
				}  ]
		    });
	}
}
//请销假管理
function submitAskLeave(url,url1,url2,auditType){
	var width = sy.getBrowerWidth() - 150;
	if (width > 1300){
		width = 1200;
	} else if (width > 1000){
		width = 1000;
	}
	if (auditType == 'workerReport'){
		parent.$.modalDialog({
			title : '请假上报',
			iconCls : 'fi-arrow-up icon-blue',
			width : width,
			//height : sy.getBrowerHeight()-150,
			//width : 800,
			height : 420,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :[{
						text : '保存',
						iconCls : 'icon-save',
						handler : function(){
							parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							$('#askLeaveWorkerReportBtn1').click();
						}
					},
					{
						text : '上报',
						iconCls : 'fi-arrow-up icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							$('#askLeaveWorkerReportBtn2').click();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	} else{
		//工作人员打印
		if (auditType == 'workerPrint'){
			parent.$.modalDialog({
				title : '文书打印',
				iconCls : 'fi-print icon-blue',
				width : 500,
				height : 300,
				resizable : true,
				maximizable : true,
				href : url2,
				buttons :[{
					text : "提交",
					iconCls : 'fi-check icon-blue',
					handler : function(){

						//外出证明 
						if ($('#askLeave_isPrintWCZM').html() == '')
						{
							$.messager.alert(
							{
								title : '提示信息!',
								msg : '请打印后再提交!'
							});
							return false;
						}
						parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						
						var f = parent.$.modalDialog.handler.find('#askLeave_inform_btn');
						f.click();
					}
				},{
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function(){
						parent.$.modalDialog.handler.dialog('close');
					}
				}]
			});
		} else{
			parent.$.modalDialog({
				title : '请假审批',
				iconCls : 'fi-clipboard-pencil icon-blue',
				width : width,
				height : 600,
				resizable : true,
				maximizable : true,
				href : url1,
				buttons :[{
					text : '审批',
					iconCls : 'fi-clipboard-pencil icon-blue',
					handler : function(){
						parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
						f.submit();
					}
				},{
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function(){
						parent.$.modalDialog.handler.dialog('close');
					}
				} ]
			});
		}
	}
}
//刑满解矫
function submitFinishRedress(url,url1,url2,auditType){
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '期满解矫审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url2,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	id : 'qmjdb',
	            text : '打印社区服刑人员矫正期满鉴定表',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                var f = parent.$.modalDialog.handler.find('#qmjdb');
	                f.click();
	            }
	        }, {
	        	id : 'jcsqjzxgs',
	            text : '打印解除社区矫正宣告书',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                var f = parent.$.modalDialog.handler.find('#jcsqjzxgs');
	                f.click();
	            }
	        }, {
	        	id : 'jcjzzms',
	            text : '打印解除社区矫正证明书',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                var f = parent.$.modalDialog.handler.find('#jcjzzms');
	                f.click();
	            }
	        }, {
	        	id : 'jztzs',
	            text : '打印解除社区矫正通知书.',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                var f = parent.$.modalDialog.handler.find('#jztzs');
	                f.click();
	            }
	        }, {
	            text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	            	 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#finishRedressFormCheck');
	            	 f.submit();
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }
	         ]
	    });
	}else if(auditType=='workerReport'){
		parent.$.modalDialog({
	        title : '期满解矫审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#finishRedressForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#finishRedressForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }  ]
	    });
		
	}else{
		parent.$.modalDialog({
	        title : '期满解矫审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url1,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	            	 parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#finishRedressFormCheck');
	            	 f.submit();
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }
	         ]
	    });
	}
}
//特殊原因终止矫正
function submitRedressStop(url,url1,auditType){
	if (auditType == 'xgzryprint')
	{
		parent.$.modalDialog(
		{
			title : '文书打印',
			iconCls : 'fi-print icon-blue',
			width : 500,
			height : 300,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :[{
						text : "提交",
						iconCls : 'fi-check icon-blue',
						handler : function(){
							var printone=$('#redressStop_isPrintONE').html();
							var printtwo=$('#redressStop_isPrintTWO').html();
							
							//外出证明 
							if (printone == ''||printone == null||printone == 'defined'||printtwo == ''||printtwo == null||printtwo == 'defined'){
								$.messager.alert({
									title : '提示信息!',
									msg : '请打印后再提交!'
								});
								return false;
							}
							
							parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						}
					},{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function(){
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}else{
		parent.$.modalDialog({
			title : '特殊情况矫正终止审批',
			iconCls : 'fi-clipboard-pencil icon-blue',
			width : sy.getBrowerWidth() - 300,
			//width : 800,
			height : 500,
			resizable : true,
			maximizable : true,
			href : url1,
			buttons :
			[
					{
						text : '审批',
						iconCls : 'fi-clipboard-pencil icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval').datagrid(); //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#redressStopAuditBtn');
							f.click();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}
}
//特殊原因恢复矫正
function submitRedressResume(url,auditType){
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '特殊原因恢复矫正审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#redressResumeCheckForm');
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
	}else{
		parent.$.modalDialog({
	        title : '特殊原因恢复矫正审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#redressResumeCheckForm');
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
}
//漏罪
function submitOmittedCrime(url,auditType){
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '漏罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#omittedCrimeCheckForm');
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
	}else{
		parent.$.modalDialog({
	        title : '漏罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#omittedCrimeCheckForm');
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
}
//重新犯罪
function submitRecidivism(url,auditType){
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '重新犯罪流程处理',
	        iconCls:'fi-clipboard icon-blue',
	        width : 1000,
	        height : 650,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '结束流程',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
	                f.submit();
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }  ]
	    });
	}else{
		parent.$.modalDialog({
	        title : '重新犯罪流程处理',
	        iconCls:'fi-clipboard icon-blue',
	        width : 1000,
	        height : 650,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
	                f.submit();
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }  ]
	    });
	}
}
//涉嫌重新犯罪
function submitRecidivismPerhaps(url,auditType){
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '涉嫌重新犯罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismPerhapsCheckForm');
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
	}else{
	    parent.$.modalDialog({
	        title : '涉嫌重新犯罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismPerhapsCheckForm');
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
}
//死亡登记
function submitDeath(url,url1,auditType){
	var height = sy.getBrowerHeight() - 100;
	if (auditType == 'sfsSb')
	{
		height = height - 100;
	}

	if (auditType == 'xgzryprint')
	{
	
		parent.$.modalDialog(
		{
			title : '文书打印',
			iconCls : 'fi-print icon-blue',
			width : 500,
			height : 300,
			resizable : true,
			maximizable : true,
			href : url1,
			buttons :
			[
					{
						text : "提交",
						iconCls : 'fi-check icon-blue',
						handler : function()
						{
							
							
							var printOne=$('#death_isPrintONE').html() ;
							var printTwo=$('#death_isPrintTWO').html() ;
							
						
							//外出证明 
							if (printOne== ''||printOne == null||printOne == 'undefined'||printTwo== ''||printTwo == null||printTwo == 'undefined')
							{
								
								$.messager.alert(
								{
									title : '提示信息!',
									msg : '请打印后再提交!'
								});
								return false;
							}

							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好

							var f = parent.$.modalDialog.handler
									.find('#death_inform_btn');
							f.click(); 
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	} else
	{

		parent.$.modalDialog(
		{
			title : '死亡登记审批',
			iconCls : 'fi-clipboard-pencil icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : height,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :
			[
					{
						text : '提交',
						iconCls : 'fi-clipboard-pencil icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval').datagrid();
							var f1 = parent.$.modalDialog.handler
									.find('#deathAuditForm');
							f1.submit();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}
}

//提请治安管理处罚
function submitSecurityPunishment(url,url1,url2,auditType){
	if(auditType=="firstReport"){
		parent.$
		.modalDialog(
		{
			title : '提请治安管理处罚上报',
			iconCls : 'fi-arrow-up icon-blue',
			width : 800,
			height : 700,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :
			[
					{
						text : '上报',
						iconCls : 'fi-arrow-up icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval')
									.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#reportBtn1');
							f.click();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler
									.dialog('close');
						}
					} ]
		});
	}else if(auditType=="workerPrint"){
		parent.$
		.modalDialog(
		{
			title : '文书打印',
			iconCls : 'fi-print icon-blue',
			width : 500,
			height : 300,
			resizable : true,
			maximizable : true,
			href : url2,
			buttons :
			[
					{
						text : "告知",
						iconCls : 'fi-results-demographics icon-blue',
						handler : function()
						{

							//建议书 审批表

							if ($('#securityPunishment_isPrintJYS').html() == ''
									|| $('#securityPunishment_isPrintSHB')
											.html() == '')
							{
								$.messager.alert(
								{
									title : '提示信息!',
									msg : '请打印后再告知!'
								});
								return false;
							}
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval')
									.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#securityPunishment_inform_btn');
							f.click();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler
									.dialog('close');
						}
					} ]
		});
	}else{
		parent.$
		.modalDialog(
		{
			title : '提请治安管理处罚审批',
			iconCls : 'fi-clipboard-pencil icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : url1,
			buttons :
			[
					{
						text : '审核',
						iconCls : 'fi-clipboard-pencil icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_examinationAndApproval')
									.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#checkBtn1');
							f.click();
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler
									.dialog('close');
						}
					} ]
		});
	}
}
//待处理做不处理
function submitNoDeal(url){
	 parent.$.modalDialog({
	        title : '待处理不作处理审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#noDealForm');
	                f.submit();
	            }
	        },{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	           	 parent.$.modalDialog.handler.dialog('close');
	            }
	       }  ]
	    });
}
//口头警告
function submitVerbalWarning(url){
	 parent.$.modalDialog({
	        title : '口头警告审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : url,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#verbalWarningForm2');
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
//表扬
function submitCommend(url,auditType){
	if(auditType!="sfsReport"&&auditType!="jzkReport"){
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
function submitWarning(url,url1,auditType){
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
	         href : url1,
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
		            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
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
	         href : url,
	         buttons : [ {
	             text : buttonName,
	             iconCls:'icon-save',
	             handler : function() {
	            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
					var f = parent.$.modalDialog.handler.find('#askWarningAuditForm');
					f.submit();
	             }
	         },{
                 id : 'listWorkerPrint1',
                 text : '关闭',
                 iconCls:'fi-x icon-blue',
                 handler : function() {
					parent.$.modalDialog.handler.dialog('close');
                 }
         	}]
	     });
	}
	
}
//减刑
function submitReducePenalty(url,url1,auditType){
	var text = '审批';
	var title='流程审批';
	var iconCls='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsReport'){
		text='上报';
		title='上报';
		iconCls='fi-arrow-up icon-blue';
	}if(auditType=='gS'){
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
	         href : url1,
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
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
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
	                 var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
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
//迁出
function submitOutOf(url,url1,auditType) {
	var title ='审核';
	if(auditType=='usertask1'||auditType=='usertask2'){
		title ='上报';
	}
	if(auditType=='usertask5'){
		parent.$.modalDialog({
			title : '文书打印',
			iconCls : 'fi-print icon-blue',
			maximizable : true,
			resizable : true,
			width : 500,
			height : 300,
			href : url1,
			buttons : [ {
	            text : "结束流程",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#isPrint').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再结束!'
        				});	
	            		return false;
	            	}
	            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
	               	var f = parent.$.modalDialog.handler.find('#outof_inform_btn');
	                f.click();
		               
	            }
	         },{
                	text : '关闭',
                	iconCls:'fi-x icon-blue',
               		handler : function() {
               	 		parent.$.modalDialog.handler.dialog('close');
                	} 
			}]
		}) ;
	}
	else {
		parent.$.modalDialog({
			title : '迁出审核审批',
			iconCls : 'fi-clipboard-pencil icon-blue',
			width : sy.getBrowerWidth() * 0.8,
			height : sy.getBrowerHeight() * 0.9,
			maximizable:true,
	        resizable:true,
			href : url,
			buttons : [ {
				text : title,
				iconCls : 'fi-clipboard-pencil icon-blue',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval') .datagrid();
					var f = parent.$.modalDialog.handler.find('#outOfAuditForm');
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
				parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval')
						.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				var f = parent.$.modalDialog.handler
						.find('#askLeaveAuditForm');
				f.submit();
			}
		},{
				text : '关闭',
			iconCls : 'fi-x icon-blue',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval')
						.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				parent.$.modalDialog.handler.dialog('close');
			}
     } ]
	});*/
}
//监管等级
function reportAuditGradeChange(url,auditType){
	if("firstReport"==auditType){
		console.log(1);
		parent.$.modalDialog({    
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
					parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					$('#returnId1').click();
					parent.$.modalDialog.handler.dialog('close');
				}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						parent.$.modalDialog.handler.dialog('close');
					}
			}]
		});
	}else{
		console.log(2);
		parent.$.modalDialog({    
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
					parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
					$('#levelId').click();
					
				}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					parent.$.modalDialog.handler.dialog('close');
				}
			}]
		});
	} 
}
//假释
function submitAuditParole(url,url1,auditType){
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
	         href : url1,
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
	 
}


//提请撤销缓刑
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



//调查评估调查
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
	

	if(auditType=='workerPrint')
	{
		parent.$.modalDialog(
				{
					title : '文书打印',
					iconCls : 'fi-print icon-blue',
					width : 500,
					height : 300,
					resizable : true,
					maximizable : true,
					href : ctx+'/investigate/workerPrint?id=' + id
							+ '&taskId=' + taskId + '&auditType=' + auditType
							+ '&processInstanceId=' + processId,
					buttons :
					[
							{
								text : "提交",
								iconCls : 'fi-check icon-blue',
								handler : function()
								{
									
									var printYJS=$('#investigate_isPrintYJS').html() ;
									var printDCB=$('#investigate_isPrintDCB').html() ;
									var printSPB=$('#investigate_isPrintSPB').html() ;
								
									if (printYJS== ''||printYJS == null||printYJS == 'undefined'||printDCB== ''||printDCB == null||printDCB == 'undefined'||printSPB== ''||printSPB == null||printSPB == 'undefined')
									{
									
										$.messager.alert(
										{
											title : '提示信息!',
											msg : '请打印后再提交!'
										});
										return false;
									}

									parent.$.modalDialog.openner_dataGrid = $(
											'#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好

									var f = parent.$.modalDialog.handler
											.find('#investigate_inform_btn');
									f.click();  
								}
							},
							{
								text : '关闭',
								iconCls : 'fi-x icon-blue',
								handler : function()
								{
									parent.$.modalDialog.handler.dialog('close');
								}
							} ]
				});
		
		
		
	}
	else if (auditType == 'jzkAssign') {
		parent.$.modalDialog({
	        title : '调查评估调查指派',
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
	        title : '调查评估调查受理',
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
		        title : '调查评估调查内容',
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
		        title : '调查评估调查上报',
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
	        title : '调查评估调查解锁',
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
	        title : '调查评估调查上报',
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




