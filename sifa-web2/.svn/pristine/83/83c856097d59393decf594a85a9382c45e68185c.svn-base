<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 

	<form id="commendAuditForm" name="commendAuditForm" action="${ctx}/rewardspunishment/commend/submitCommendAudit" method="post">
		<input type="hidden" name="taskId" value="${commend.taskId}" /> <input
			type="hidden" name="id" value="${commend.id}" /> <input
			type="hidden" name="auditType" value="${commend.auditType}" />

  	<c:choose>
 		<c:when test="${empty commend.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${commend.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    

<div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">处理时间：</th>
					<td width="23%"><fmt:formatDate value="${commend.doDate}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">申请人：</th>
					<td width="23%"> ${commend.sponsor}</td>
								
					<th width="10%">表扬原因：</th>
					<td width="23%">${commend.reason}</td>
				<tr>
					<th>其他缘故：</th>
					<td>${commend.note}</td>
					 <th>考核开始时间：</th>
					<td><fmt:formatDate value="${commend.beginDate}"
									pattern="yyyy-MM-dd" />
					</td>
					 <th>考核结束时间：</th>
					<td><fmt:formatDate value="${commend.endDate}"
									pattern="yyyy-MM-dd" />
					</td>		
				</tr>
				<tr>
					<th>具体事实：</th>
					<td colspan="5">${commend.fact} </td>
				
				</tr>
			<tr>
						<th>上传附件：</th>
					<td style="border-right-style:none" colspan="5">
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
			</tr>
			</table>
    </div>
    
<c:if test="${commend.auditType ne 'sfsReport' && commend.auditType ne 'jzkReport' 
	&& commend.auditType ne 'sfsCheck'}">
 <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td>${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(3)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
</c:if> 

<c:if test="${commend.auditType ne 'sfsReport' && commend.auditType ne 'jzkReport'}">
			<div class="easyui-panel"  title="审批信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">审核结果：</th>
					<td >
						<input type="radio" name="decideType" value="1" checked="checked" />同意		
					 	<input type="radio" name="decideType" value="2" />退回
					</td>
				</tr>
				<tr>
					<th>审核意见：</th>
					<TD><textArea class="f1 easyui-validatebox" style="width: 80%; height: 80px;"
							data-options="multiline:true" name="opinion" id="opinion" style="width: 280px; height: 100px"
							onkeydown='textarealength(this,300)'
							onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
						class="textarea-length c-red">0</em>个字。</TD>
				</tr>
				</table>
				<table width="100%" class="grid">
				<c:if test="${commend.auditType eq 'jzkCheck'}">
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzksr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(1);">评定</a>
					</TD>
					
					<Th width="10%" >输入质量评分：</Th>
					<TD width="23%">
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
					
					<Th width="10%" rowspan="2">是否推荐为典型案例：</Th>
					<TD rowspan="2" width="24%">
						<input type="radio" name="recommendStatus" value="1"/>是
						<input type="radio" name="recommendStatus" value="2" checked="checked"/>否
					</TD>
				</TR>
				
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(2)">评定</a>
					</TD>
					<Th width="10%">执法质量评分：</Th>
					<TD width="23%">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
						    
				</c:if>
				<c:if test="${commend.auditType eq 'fzkCheck'}">		    
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="fzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(3);">评定</a>
					</TD>
					<Th width="10%" >执法质量评分：</Th>
					<TD colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				</c:if>
			</table>
			</div>
		</c:if>
		<%-- <c:if test="${commend.auditType ne 'sfsReport'}">
			<input type="hidden" name="decideType" value="1" /><div style="display:none;">同意</div> 
		</c:if> --%>

	</form>
	<div id="commendPunishmentForm"></div>
	<script type="text/javascript">
	var result='';
	 $(function() {
		 var results =$('input[name="decideType"]');
		 for(var i=0;i<results.length;i++){
			 results[i].onclick=function(){
				 result=$('input[name="decideType"]:checked').val();
				 if(result=='2' || result=='3'){//退回
					 $('#optScoreLabel').html('');
					 $('#zfScoreLabel').html('');
					 $('#optScore').val('');
					 $('#zfScore').val('');
					 $('#jzksr').linkbutton({disabled:true});
					 $('#jzkzf').linkbutton({disabled:true});
					 $('#fzkzf').linkbutton({disabled:true}); 
				 }else{
					 $('#jzksr').linkbutton({disabled:false});
					 $('#jzkzf').linkbutton({disabled:false});
					 $('#fzkzf').linkbutton({disabled:false});
				 }
			 }
		 }
		 
		$('#commendAuditForm').form({
			url:'${ctx}/rewardspunishment/commend/submitCommendAudit',
			onSubmit:function(){
				 progressLoad();
				 var adtypemsg = '';
				 if(result!="2" && result!="3"){
					 if(adtype == 'jzkCheck'){
							if ($('#optScore').val() == '') {
								adtypemsg = "请对输入质量进行评分!";
							}
							else if ($('#zfScore').val() == '') {
								adtypemsg = "请对执法质量进行评分!";
							}
						}
						if(adtype == 'fzkCheck'){
							if ($('#zfScore').val() == '') {
								adtypemsg = "请对执法质量进行评分!";
							}
						}
						
						if (adtypemsg.length > 0) {
							progressClose();
							$.messager.show({
								title : '提示信息!',
								msg : adtypemsg
							});
							return false;
						}
					 
				 }
	            return true;
			},
			success:function(data){
				progressClose();
				data = JSON.parse(data);
				if(data.status==200){
					$.messager.show({
						title:'提示信息!' ,
						msg:data.msg
					});
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	                 parent.$.modalDialog.handler.dialog('close');
	                 $('#commendPunishmentForm').dialog('destroy');
				}else{
					 parent.$.messager.alert('错误', result.msg, 'error');
				}
				
			}
		});	
	})	
	
//打分
	 function rewardspunishment(type){
 		var url = '${ctx}/sys/mxCheck/assess?infoType='+ type +'&processInstanceId=${commend.processInstanceId}&tablename=commendPunishmentForm';
 		var title = "评定明细";
 		
 		if (type == 1 ) {
 			title = "输入质量" + title;
 		}
 		if (type == 2  || type == 3 ) {
 			title = "执法质量" + title;
 		}
 		
 		$('#commendPunishmentForm').dialog({    
 		    title: title,    
 		    width: 600,
 		    height: 520,
 		    href: url,    
 		    modal: true,
 		    resizable:true,
 		    maximizable:true,
 		    iconCls:'fi-clipboard-pencil icon-blue',
 		    buttons :[{
 				text:'确定',
 				iconCls:'fi-check icon-blue',
 				handler:function(){
 					$('#assessBtn1').click();
 				}
 			}, {
 				text:'关闭',
 				iconCls:'fi-x icon-blue',
 				handler:function(){
 					$('#assessBtn2').click();
 				}
 			}]
 		});
 		$('#commendPunishmentForm').window('center');
 	}
 	//评分详细
 	function mxcheckdetail(infotype){
 		console.log('${commend.processInstanceId}');
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${commend.processInstanceId}';
	$('#commendPunishmentForm').dialog({    
	    title: '评分详细',    
	    width: 800,
	    height: 650,
	    href: url,    
	    modal: true,
	    resizable:true,
	    maximizable:true,
	    iconCls:'fi-checkbox icon-blue',
	    buttons :[{
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#commendPunishmentForm').dialog('close');
			}
		}]
	});
	$('#commendPunishmentForm').window('center');
}
 	//
	     $(function() {
	        	$('#commendAuditForm').form({
	        		url:'${ctx}/rewardspunishment/commend/submitCommendAudit',
	        		onSubmit:function(){
	        			 progressLoad();
	        			 var isValid = $(this).form('validate');
	                     if (!isValid) {
	                         progressClose();
	                     }
	                     return isValid;
	        		},
	        		success:function(data){
	        			data = JSON.parse(data);
	        			progressClose();
	        			if(data.status==200){
	        				$.messager.show({
	        					title:'提示信息!' ,
	        					msg:data.msg
	        				});
	        				
	        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	                         parent.$.modalDialog.handler.dialog('close');
	    					
	        			}else{
	        				 parent.$.messager.alert('错误', data.msg, 'error');
	        			}
	        			
	        		}
	        	});
	        });
	
	</script>
