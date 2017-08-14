<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form id="revokeOutOfPrisonAuditForm" name="revokeOutOfPrisonAuditForm" action="${ctx}/rewardspunishment/revokeOutOfPrison/submitRevokeOutOfPrisonAudit" method="post">
	<input type="hidden" name="taskId" value="${revokeOutOfPrison.taskId}"/>
	<input type="hidden" name="id" id="revokeOutOfPrisonId" value="${revokeOutOfPrison.id}"/>
	<input type="hidden" name="auditType" value="${revokeOutOfPrison.auditType}"/>
	<c:choose>
 		<c:when test="${empty revokeOutOfPrison.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${revokeOutOfPrison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
	<div class="easyui-panel" title="具体信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr>
                    <th width="10%">违纪原因：</th><td>${fns:getSysDicValueByKey('revokeOutOfPrison','dicReasonTypeKey',revokeOutOfPrison.dicReasonTypeKey,'')}</td>
                </tr>
                 <tr>
                    <th>结案报告：</th>
                    <td>
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
                </tr>
                <tr>
                    <th>证据材料：</th>
                    <td>
						<c:forEach var="sysFile" items="${fileList2}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
                </tr>
                <tr>
                    <th width="10%">简要违纪情况：</th>
					<td>
						<textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${revokeOutOfPrison.detailInfo }</textarea>
					</td>
                </tr>  
                <tr>
                    <th width="10%">处理依据：</th>
               		<td >
						<textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${revokeOutOfPrison.fact }</textarea>
					</td>	
                </tr>
                <!-- <tr>
                    <th>短信发送至：</th>
					<td></td>
                </tr>   -->
            </table>
    </div>
<c:if test="${revokeOutOfPrison.auditType ne 'sfsReport' && revokeOutOfPrison.auditType ne 'jzkReport' 
	&& revokeOutOfPrison.auditType ne 'sfsCheck'}">
<div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td>${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(3)">查看详细</a>
						</TD>
					</tr>
					
		                <TR>	
						<Th width="10%" >矫正处输入评分：</Th><td width="23%">${jzcsr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(4)">查看详细</a>
						</TD>
						<Th width="10%" >矫正处执法评分：</Th><td width="23%">${jzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(5)">查看详细</a>
						</TD>
						<Th width="10%" >法制处执法评分：</Th><td>${fzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(6)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
</c:if>
<c:if test="${revokeOutOfPrison.auditType ne 'sfsReport' && revokeOutOfPrison.auditType ne 'jzkReport'
							  && revokeOutOfPrison.auditType ne 'jzkPrint' && revokeOutOfPrison.auditType ne 'sfsPrint'}">
							  
<div class="easyui-panel" title="审批信息" style="width:99%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<TR>	
					<Th width="10%" >审核结果：</Th>
					<TD  width="23%">
						<input type="radio" name="decideType" checked="checked" value="1"/>同意
						<c:if test="${revokeOutOfPrison.auditType eq 'sfgCheck' }"><input type="radio" name="decideType" value="0"/>不同意</c:if>
						<input type="radio" name="decideType" value="2" />退回
					</TD>
					<Th  width="10%" >审核意见：</Th>
					<TD width="23%"  style="border-right:0;">
						<textarea style="width:160%;height:60px;" name="opinion" ></textarea>
					</TD>
					<Td style="border:0;" width="10%"></Td><TD style="border:0;"></TD>
				</TR>
				<c:if test="${revokeOutOfPrison.auditType eq 'jzkCheck'}">
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzksr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(1);">评定</a>
					</TD>
					
					<Th width="10%" >输入质量评分：</Th>
					<TD>
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
					
					<Th width="10%" rowspan="2">是否推荐为典型案例：</Th>
					<TD rowspan="2">
						<input type="radio" name="recommendStatus" value="1"/>是
						<input type="radio" name="recommendStatus" value="2" checked="checked"/>否
					</TD>
				</TR>
				
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton"  id="jzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(2);">评定</a>
					</TD>
					<Th width="10%">执法质量评分：</Th>
					<TD>
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				<TR>	
					<Th width="10%" >呈报单位类别：</Th>
					<TD width="23%">
						<select style="width:150px;" editable=false name="dicSubOrgTypeKey" required=true missingMessage="呈报不能为空!" value="${revokeOutOfPrison.dicSubOrgTypeKey }" panelHeight=100
											class="easyui-combobox">
												<option value="97001">基层人民法院</option>   
										    	<option value="97002">监狱管理局</option>   
										    	<option value="97003">中级人民法院</option>   
										   	 	<option value="97004">市级公安机关</option>   
								
						</select >
					</TD>
					<Th width="10%" >呈报单位名称：</Th>
					<TD width="23%">
						<input type="text"  name="submittionOrg" class="easyui-textbox"/>
					</TD>
					<Th width="10%" >抄送单位名称：</Th>
					<TD >
						<input type="text"  name="copyOrg" class="easyui-textbox"/>
					</TD>
				</TR>		    
				</c:if>
				<c:if test="${revokeOutOfPrison.auditType eq 'fzkCheck'}">		    
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton"  id="fakzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(3);">评定</a>
					</TD>
					<Th width="10%" >执法质量评分：</Th>
					<TD colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				</c:if>
				<c:if test="${revokeOutOfPrison.auditType eq 'sjzCheck'}">		    
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="sjzsr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(4);">评定</a>
					</TD>
					
					<Th width="10%" >输入质量评分：</Th>
					<TD width="23%">
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
					<Th width="10%" rowspan="2">是否推荐为典型案例：</Th>
					<TD rowspan="2">
						<input type="radio" name="recommendStatus" value="1"/>是
						<input type="radio" name="recommendStatus" value="2" checked="checked"/>否
					</TD>
				</TR>
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton"  id="sjzzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(5);">评定</a>
					</TD>
					<Th width="10%"  >执法质量评分：</Th>
					<TD width="23%">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				<TR>	
					<Th width="10%"  >呈报单位名称：</Th>
					<TD width="23%">
						<input type="text"  name="submittionOrg" class="easyui-textbox"/>
					</TD>	
					<Th width="10%"  >抄送单位名称：</Th>
					<TD >
						<input type="text"  name="copyOrg" class="easyui-textbox"/>
					</TD>
				</TR>
				</c:if>
				<c:if test="${revokeOutOfPrison.auditType eq 'sfzCheck'}">		    
				<TR>	
					<Th width="10%"  >执法质量：</Th>
					<TD width="35%">
						<a href="#" class="easyui-linkbutton"  id="sfzzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(6);">评定</a>
					</TD>
					<Th width="10%"  >执法质量评分：</Th>
					<TD colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				</c:if>
            </table>
    </div>							  							  
 </c:if>
 	 <c:if test="${revokeOutOfPrison.auditType eq 'sfsReport'|| revokeOutOfPrison.auditType eq 'jzkReport'
 	 			|| revokeOutOfPrison.auditType eq 'sfsPrint' || revokeOutOfPrison.auditType eq 'jzkPrint'}">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
</form>
<div id="revokeOutOfPrisonrewardspunishmentForm"></div>

<script type="text/javascript">
var adtype = '${revokeOutOfPrison.auditType}';
var result='';
 $(function() {
	//若审核结果是退回或者不同意，则不需要输入评分
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
				 $('#sjzsr').linkbutton({disabled:true});
				 $('#sjzzf').linkbutton({disabled:true});
				 $('#sfzzf').linkbutton({disabled:true});	 
			 }else{
				 $('#jzksr').linkbutton({disabled:false});
				 $('#jzkzf').linkbutton({disabled:false});
				 $('#fzkzf').linkbutton({disabled:false});
				 $('#sjzsr').linkbutton({disabled:false});
				 $('#sjzzf').linkbutton({disabled:false});
				 $('#sfzzf').linkbutton({disabled:false});	 
			 }
		 }
	 }
	 
	$('#revokeOutOfPrisonAuditForm').form({
		url:'${ctx}/rewardspunishment/revokeOutOfPrison/submitRevokeOutOfPrisonAudit',
		onSubmit:function(){
			 progressLoad();
			 var adtypemsg = '';
			 if(result!="2" && result!="3"){
				 if(adtype == 'jzkCheck' || adtype == 'sjzCheck'){
						if ($('#optScore').val() == '') {
							adtypemsg = "请对输入质量进行评分!";
						}
						else if ($('#zfScore').val() == '') {
							adtypemsg = "请对执法质量进行评分!";
						}
					}
					if(adtype == 'fzkCheck' || adtype == 'sfzCheck'){
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
                 $('#revokeOutOfPrisonrewardspunishmentForm').dialog('destroy');
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
		}
	});	
})


 
//评分
 function rewardspunishment(type){
 		var url = '${ctx}/sys/mxCheck/assess?infoType='+ type +'&processInstanceId=${revokeOutOfPrison.processInstanceId}&tablename=revokeOutOfPrisonrewardspunishmentForm';
 		var title = "评定明细";
 		
 		if (type == 1 || type == 4) {
 			title = "输入质量" + title;
 		}
 		if (type == 2 || type == 3 || type == 5 || type == 6) {
 			title = "执法质量" + title;
 		}
 		
 		$('#revokeOutOfPrisonrewardspunishmentForm').dialog({    
 		    title: title,    
 		    width: 600,
 		    height: 520,
 		    href: url,    
 		    modal: true,
 	        resizable : true,
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
 		$('#revokeOutOfPrisonrewardspunishmentForm').window('center');
 	}
 	
//打分明细
 function mxcheckdetail(infotype){
 	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${revokeOutOfPrison.processInstanceId}';
 	$('#revokeOutOfPrisonrewardspunishmentForm').dialog({    
 	    title: '评分详细',    
 	    width: 800,
 	    height: 650,
 	    href: url,    
 	    modal: true,
        resizable : true,
	    maximizable:true,
	    iconCls:'fi-checkbox icon-blue',
 	    buttons :[{
 			text:'关闭',
 			iconCls:'fi-x icon-blue',
 			handler:function(){
 				$('#revokeOutOfPrisonrewardspunishmentForm').dialog('close');
 			}
 		}]
 	});
 	$('#revokeOutOfPrisonrewardspunishmentForm').window('center');
 }
</script>