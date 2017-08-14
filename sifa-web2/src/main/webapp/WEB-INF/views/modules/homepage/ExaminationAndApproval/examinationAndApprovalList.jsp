<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/extJs.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/examinationAndApproval.js" charset="utf-8"></script>
<script type="text/javascript">
	var personId = "${account.personId}";
	$(function() {
		$('#searchbtn').click(
				function() {
					$('#t_list_examinationAndApproval').datagrid('load',
							$.serializeObject($('#searchForm')));
				});

		function cleanSearch() {
			$('#t_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		}
	});
	function viewProcess(url) {
		parent.$.modalDialog({
			title : '流程信息',
			iconCls : 'fi-shuffle  icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			maximizable:true,
	         resizable:true,
			href : url
		});
	}


	//详细
	function dealDetail(recordId,type){	
		var title=sy.getDicValue('common_table','processType',type,'')+'详情';
		var href='';
		var buttons='';
		if(type=="95001"){//调查评估调查
			href='${ctx}/investigate/detail?id='+recordId;
		}else if(type=="95002"){//警告
			href='${ctx}/rewardspunishment/warning/detail?id='+recordId;
		}else if(type=="95003"){//口头警告
			href='${ctx}/rewardspunishment/verbalWarning/get?id='+recordId;
		}else if(type=="95004"){//提请治安管理处罚
			href='${ctx}/rewardspunishment/securityPunishment/detail?id='+recordId;
		}else if(type=="95005"){//提请撤销缓刑详情
			href='${ctx}/rewardspunishment/revokeProbation/detail?id='+recordId;
		}else if(type=="95006"){//提请撤销假释详情
			href='${ctx}/rewardspunishment/revokeParole/detail?id='+recordId;
		}else if(type=="95007"){//提请撤销监外执行详情
			href='${ctx}/rewardspunishment/revokeOutOfPrison/detail?id='+recordId;
		}else if(type=="95008"){//减刑
			href='${ctx}/rewardspunishment/reducePenalty/detail?id='+recordId;
		}else if(type=="95009"){//表扬
			href='${ctx}/rewardspunishment/commend/detail?id='+recordId;
		}else if(type=="95010"){//假释
			href='${ctx}/rewardspunishment/parole/paroleDetail?id='+recordId;
		}else if(type=="95011"){//延长监外执行详情
			href='${ctx}/dailymgr/outOfPrison/detail?id='+recordId;
		}else if(type=="95012"){//请销假管理
			href='${ctx}/dailymgr/askLeave/detail?id='+recordId;
		}else if(type=="95013"){//进入特定区域详情
			href='${ctx}/dailymgr/specialArea/detail?id='+recordId;
		}else if(type=="95014"){//脱管管理详情
			href='${ctx}/endcorrect/detached/detail?id='+recordId;
		}else if(type=="95015"){//迁出
			href='${ctx}/endcorrect/outof/detail?id='+recordId;
		}else if(type=="95016"){//涉嫌重新犯罪
			href='${ctx}/endcorrect/recidivismPerhaps/get?id='+recordId;
		}else if(type=="95017"){//重新犯罪
			href='${ctx}/endcorrect/recidivism/get?id='+recordId;
		}else if(type=="95018"){//漏罪
			href='${ctx}/endcorrect/omittedCrime/get?id='+recordId;
		}else if(type=="95019"){//特殊原因恢复矫正
			href='${ctx}/endcorrect/redressResume/get?id='+recordId;
		}else if(type=="95020"){//期满解矫
			href='${ctx}/endcorrect/finishRedress/get?id='+recordId;
		}else if(type=="95021"){//待处理不作处理
			href='${ctx}/rewardspunishment/noDeal/get?id='+recordId;
		}else if(type=="95022"){//迁入管理
			href='${ctx}/culprit/moveIn/detail?id='+recordId;
		}else if(type=="95023"){//修改监管等级
			href='${ctx}/dailymgr/gradeChange/gradeChangeDetail?id='+recordId;
		}else if(type=="95024"){//特殊原因终止矫正
			href='${ctx}/endcorrect/redressStop/detail?id='+recordId;
		}else if(type=="95025"){//出入境报备
			href='${ctx}/inculprit/exitEntryReport/detail?id='+recordId;
		}else if(type=="95026"){//死亡登记
			href='${ctx}/endcorrect/death/detail?id='+recordId;
		}
	
		parent.$.modalDialog({
	    	title : title,
	        iconCls:'fi-info icon-blue',
	        width : sy.getBrowerWidth()-230,
	        height : sy.getBrowerHeight()-150,
	        maximizable:true,
	        resizable:true,
	        href : href,
	        buttons : [ {
	        	text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            //parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        }]
	    });
	}
	
	//流程审批
	function dealSubmitAudit(taskId,roleId,recordId,auditType,processId,type){
		
		if(type=="95001"){//调查评估调查
			submitInvestigate_of_needDeal('${ctx}',recordId,taskId,auditType,processId,personId);
		}else if(type=="95002"){//警告
			var url1='${ctx}/rewardspunishment/warning/warningFinishPrint?id=' + recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
			var url="${ctx}/rewardspunishment/warning/warningAudit?id=" + recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitWarning(url,url1,auditType);
		}else if(type=="95003"){//口头警告
			var url = '${ctx}/rewardspunishment/verbalWarning/forCheck?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitVerbalWarning(url);
		}else if(type=="95004"){//提请治安管理处罚
			//上报
			var url = '${ctx}/rewardspunishment/securityPunishment/securityPunishmentPush?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//审核
			var url1 = '${ctx}/rewardspunishment/securityPunishment/securityPunishmentReport?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//打印
			var url2 = '${ctx}/rewardspunishment/securityPunishment/workerPrint?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitSecurityPunishment(url,url1,url2,auditType);
		}else if(type=="95005"){//提请撤销缓刑处理
			var url="${ctx}/rewardspunishment/revokeProbation/revokeProbationAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1="${ctx}/rewardspunishment/revokeProbation/revokeProbationFinishPrint?id=" + recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRevokeProbation_of_needDeal(url,url1,auditType);
		}else if(type=="95006"){//提请撤销假释处理
			var url="${ctx}/rewardspunishment/revokeParole/revokeParoleAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1="${ctx}/rewardspunishment/revokeParole/revokeParoleFinishPrint?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRevokeParole_of_needDeal(url,url1,auditType);
		}else if(type=="95007"){//提请撤销监外执行处理
			var url="${ctx}/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1="${ctx}/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonFinishPrint?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRevokeOutOfPrison_of_needDeal(url,url1,auditType);
		}else if(type=="95008"){//减刑
				var url="${ctx}/rewardspunishment/reducePenalty/reducePenaltyAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
				var url1="${ctx}/rewardspunishment/reducePenalty/reducePenaltyPrint?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
				submitReducePenalty(url,url1,auditType);
		}else if(type=="95009"){//表扬
			var url='${ctx}/rewardspunishment/commend/commendAudit?id=' + recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
			submitCommend(url,auditType);
		}else if(type=="95010"){//假释
				var url = '${ctx}/rewardspunishment/parole/paroleAudit?id=' + recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
				var url1 = '${ctx}/rewardspunishment/parole/parolePrint?id=' + recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
				submitAuditParole(url,url1,auditType);
		}else if(type=="95011"){//延长监外执行
			var url="${ctx}/dailymgr/outOfPrison/outOfPrisonAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1="${ctx}/dailymgr/outOfPrison/outOfPrisonFinishPrint?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitOutOfPrison_of_needDeal(url,url1,auditType);
		}else if(type=="95012"){//请销假管理
			//上报
			url = '${ctx}/dailymgr/askLeave/askLeaveReport?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//审批
			url1 = '${ctx}/dailymgr/askLeave/askLeaveAudit?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//打印
			url2 = '${ctx}/dailymgr/askLeave/workerPrint?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitAskLeave(url,url1,url2,auditType);
		}else if(type=="95013"){//进入特定区域管理处理
			var url="${ctx}/dailymgr/specialArea/specialAreaAudit?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1="${ctx}/dailymgr/specialArea/specialAreaFinishPrint?id="+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitSpecialArea_of_needDeal(url,url1,auditType);
		}else if(type=="95014"){//脱管管理
			var url='${ctx}/endcorrect/detached/detachedAudit?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitDetached_of_needDeal(url,auditType);
		}else if(type=="95015"){//迁出管理
			var url = '${ctx}/endcorrect/outof/outOfAudit?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1 = '${ctx}/endcorrect/outof/outofFinishPrint?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitOutOf(url,url1,auditType);
		}else if(type=="95016"){//涉嫌重新犯罪
			var url = '${ctx}/endcorrect/recidivismPerhaps/forCheck?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRecidivismPerhaps(url,auditType);
		}else if(type=="95017"){//重新犯罪
			var url = '${ctx}/endcorrect/recidivism/check?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRecidivism(url,auditType);
		}else if(type=="95018"){//漏罪
			var url = '${ctx}/endcorrect/omittedCrime/check?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitOmittedCrime(url,auditType);
		}else if(type=="95019"){//特殊原因恢复矫正
			var url = '${ctx}/endcorrect/redressResume/forCheck?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitRedressResume(url,auditType);
		}else if(type=="95020"){//期满解矫
			//上报
			var url ='${ctx}/endcorrect/finishRedress/add?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//审核
			var url1 ='${ctx}/endcorrect/finishRedress/forCheck?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//打印
			var url2 = '${ctx}/endcorrect/finishRedress/forCheck?id='+recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitFinishRedress(url,url1,url2,auditType);
		}else if(type=="95021"){//待处理做不处理
			var url = '${ctx}/rewardspunishment/noDeal/check?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitNoDeal(url);
		}else if(type=="95022"){//迁入管理
			//指派
			var url = '${ctx}/culprit/moveIn/form?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//开始调查
			var url0 = '${ctx}/culprit/moveIn/diaoCha?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//上报和审核
			var url1 = '${ctx}/culprit/moveIn/moveInSubmitform?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//跳转打印
			var url2 = '${ctx}/culprit/moveIn/moveInFinishPrint?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			//打印
			var url3 = '${ctx}/culprit/moveIn/submitMoveInAudit?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitMoveIn(url,url0,url1,url2,url3,auditType);
		}else if(type=="95023"){ //修改监管等级
			var url = '${ctx}/dailymgr/gradeChange/gradeChangeAudit?id=' + recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId+'&exaAndApp=0';
			reportAuditGradeChange(url,auditType);
		}else if(type=="95024"){//特殊原因终止矫正
			var url = '${ctx}/endcorrect/redressStop/workerPrint?id='+ recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
			var url1 = '${ctx}/endcorrect/redressStop/redressStopAudit?id='+ recordId+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
			submitRedressStop(url,url1,auditType);
		}else if(type=="95025"){//出入境报备
			//审批和结束流程
			var url1 = '${ctx}/inculprit/exitEntryReport/auditForm?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitExitEntryReport(url1,auditType);
		}else if(type=="95026"){
			var url = '${ctx}/endcorrect/death/deathAudit?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			var url1 = '${ctx}/endcorrect/death/workerPrint?id='+ recordId+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
			submitDeath(url,url1,auditType);
		}
		
	}
	
	
	
	
	function stopProcess(taskId) {
		$.messager.confirm('提示', '流程终止后不可再进行操作?', function(b) {
			if (b) {
				$.ajax({
					type : 'get',
					url : "${ctx}/homepage/examinationAndApproval/stopProcess?taskId="
							+ taskId,
					cache : false,
					async : false, //同步请求
					dataType : 'json',
					success : function(result) {
						if(result.status==200){
		  					$.messager.show({
			  					title : '提示信息!',
			  					msg : '终止成功!'
			  				});
		  				}
		  				$('#t_list_examinationAndApproval').datagrid('reload',{});

					}
				});

			}
		});

	}

	
	function stopProcessOfInvestigate(id,taskId,auditType,processId){
		var url = '${ctx}/investigate/investigateStopProcess?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
		parent.$.modalDialog({
	        title : '调查评估终止',
	        iconCls:'fi-power icon-red',
	        width : 600,
	        height : 250,
	        resizable : true,
	        maximizable:true, 
	        href : url,
	        buttons : [ {
	        	id : 'listStop1',
	            text : '提交',
	            iconCls:'fi-check icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_examinationAndApproval').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	            	var f = parent.$.modalDialog.handler.find('#investigateStopBtn1');
	                f.click();
	            }
	        }, {
	        	id : 'listStop2',
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        } ]
	    });
	}

	//操作
	function formatOper(val,row,index){ 
		if(row.id=='' || row.id==null){
		 	var examAndAppListSize=row.examAndAppListSize;
			var workRemindListSize=row.workRemindListSize;
			$('#examAndAppOfIndex').text(examAndAppListSize);
			$('.panel-title').each(function(){
				if ($(this).text().indexOf('待办事项') > -1) {
					var amount3=(examAndAppListSize-0)+(workRemindListSize-0);
					$(this).text('待办事项('+amount3+')');
					return;
				}
			});
			return;
		 }
		
		var space = '&nbsp;';
		var operation='<a class="organization-easyui-linkbutton-edit" href="javascript:void(0);" onclick="dealDetail(\''+row.recordId+'\',\''+row.type+'\')">详情</a>';
		if(row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" onclick="dealSubmitAudit(\''+row.taskId+'\',\''+row.roleId+'\',\''+row.recordId+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\',\''+row.type+'\')">处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var processDetailUrl='';
			if(row.type=="95001"){//调查评估调查
				processDetailUrl="/investigate/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95002"){//警告
				processDetailUrl="/rewardspunishment/warning/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95003"){//口头警告
				processDetailUrl="/rewardspunishment/verbalWarning/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95004"){//提请治安管理处罚
				processDetailUrl="/rewardspunishment/securityPunishment/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95005"){//撤销缓刑查看流程图
				processDetailUrl="/rewardspunishment/revokeProbation/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95006"){//撤销假释查看流程图
				processDetailUrl="/rewardspunishment/revokeParole/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95007"){//撤销暂予监外执行查看流程图
				processDetailUrl="/rewardspunishment/revokeOutOfPrison/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95008"){//减刑
				processDetailUrl="/rewardspunishment/reducePenalty/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95009"){//表扬
				processDetailUrl="/rewardspunishment/commend/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95010"){//假释
				processDetailUrl="/rewardspunishment/parole/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95011"){//延长监外执行查看流程图
				processDetailUrl="/dailymgr/outOfPrison/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95012"){//请销假管理
				processDetailUrl="/dailymgr/askLeave/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95013"){//进入特定区域查看流程图
				processDetailUrl="/dailymgr/specialArea/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95014"){//脱管管理
				processDetailUrl="/endcorrect/detached/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95015"){//迁出管理
				processDetailUrl="/endcorrect/outof/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95016"){//涉嫌重新犯罪
				processDetailUrl="/endcorrect/recidivismPerhaps/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95017"){//重新犯罪
				processDetailUrl="/endcorrect/recidivism/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95018"){//漏罪
				processDetailUrl="/endcorrect/omittedCrime/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95019"){//特殊原因恢复矫正
				processDetailUrl="/endcorrect/redressResume/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95020"){//期满解矫
				processDetailUrl="/endcorrect/finishRedress/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95021"){//待处理作不处理
				processDetailUrl="/rewardspunishment/noDeal/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95022"){//迁入管理
				processDetailUrl="/culprit/moveIn/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95023"){//修改监管等级
				processDetailUrl="/dailymgr/gradeChange/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95024"){//特殊原因终止矫正
				processDetailUrl="/endcorrect/redressStop/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95025"){//出入境报备
				processDetailUrl="/inculprit/exitEntryReport/forProcessDetail?id="+row.recordId;
			}else if(row.type=="95026"){//死亡登记
				processDetailUrl="/endcorrect/death/forProcessDetail?id="+row.recordId;
			}
			
			if(row.isEnd==1){
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			if(row.isEnd==0){
				if (row.type == '95001') {//调查评估调查
					<shiro:hasPermission name="investigate/stop">
					if (row.auditType == 'sfsCheck') {
						operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" '
						+'onclick="stopProcessOfInvestigate(\''+row.id+'\',\''+row.taskId+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
					}
					else {
						operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" '
						+'onclick="stopProcess(\''+row.taskId+'\')"></a>';
					}
					</shiro:hasPermission>
				}
				else {
					operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
				}
			}
		}
		
	    return operation;
	} 
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="moveInSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:false">
        <div region="center" border="false">

           <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" style="width:100%;">
           
			<table>
				<tr>
					<td class="search-title">审批类型：</td>
					<td>
						 <input id="type" class="easyui-combobox" name="type" editable="false" data-options="valueField:'key',textField:'value',panelHeight:'auto',panelMaxHeight:'200px',
   							url:'${ctx}/sys/sysDic/getDicValueByParent?parentKey=95000&showAll=1&columnName=processType&tabName=common_table',panelHeight:'auto'" />
					</td>
				</tr>
				<tr>
					<td class="search-title">人员姓名：</td>
					<td>
						<input name="name" id="name" class="easyui-textbox" />
					</td>
				</tr>
				<tr>
					<td class="search-title">任务起始：</td>
					<td><input name="searchStartDate" id="searchStartDate" editable="false" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'})"/></td>
				</tr>
				<tr>
					<td class="search-title">任务截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" editable="false"  class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})"/></td>
				</tr>

			</table>
	</div>
	</div>
		<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
			<a href="#" id="searchGroupBtn" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_list_examinationAndApproval').datagrid('load' ,$.serializeObject($('#moveInSearchForm')));" >查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#type').combobox('reset');$('#moveInSearchForm').form('clear');">清空</a></div>
		</div>
	</div>
		
		</form>
	<div data-options="region:'center',border:true">
		<table class="easyui-datagrid" id="t_list_examinationAndApproval" title="待审批列表" 
			data-options="singleSelect:true,fit:true,fitColumns:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/homepage/examinationAndApproval/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
		 },rowStyler: function(index,row){if(row.id==null){ return 'display:none';  } }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'10%'">编号</th>
					<th data-options="field:'culpritName',width:'15%',align:'center'">人员姓名</th>
					<th data-options="field:'judicialOffices',width:'15%',align:'center'">申请司法所</th>
					<th data-options="field:'type',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){    
    	 				return sy.getDicValue('common_table','processType',rowData.type,''); }">审批类型</th>
					<th data-options="field:'taskDate',width:'15%',align:'center',sortable:true">任务产生时间</th>
					<th data-options="field:'activityName',width:'10%',align:'center'">审批状态</th>
					<!-- <th data-options="field:'correctDate',width:'15%',align:'center',sortable:true">矫正期满时间</th> -->
					<th data-options="field:'_opt',align:'center',width:'27%',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

