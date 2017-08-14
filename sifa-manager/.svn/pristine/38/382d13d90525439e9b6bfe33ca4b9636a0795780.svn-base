<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/culprit/moveIn/submitMoveInAudit" method="post" id="moveInAuditInfo">
  <input type="hidden" name="id" value="${moveIn.id }" />
	<input type="hidden" name="taskId" value="${moveIn.taskId }" />
	<input type="hidden" name="auditType" value="${moveIn.auditType}" />
	<input type="hidden" name="processInstanceId" value="${moveIn.processInstanceId }" />
	<c:if test="${account.roleId eq 3003 }">
		<input type="hidden" name="decideType" value="1" />
	</c:if>
	<div id="securityPrint"></div>
	 <div class="easyui-panel" title="基本信息" style="width:100%;padding:5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">矫正对象：</th>
					<td width="23%" style="border-right-style:none">${moveIn.name }</td>
					<td width="10%" style="border-style:none"></td>
					<td width="23%" style="border-style:none"></td>
					<td width="10%" style="border-style:none"></td>
					<td style="border-style:none"></td>
				</tr>
				<tr>
					<th width="10%">身份证号：</th>
					<td width="23%">${moveIn.cedentialsNumber }
						</td>
					<th width="10%">性别：</th>
					<td width="23%" >${fns:getSysDicValueByKey('common_table','sex',moveIn.dicSexKey ,'')} </td>
					<th width="10%">民族：</th>
					<td >${fns:getSysDicValueByKey('common_table','nation',moveIn.nation ,'')}</td>
				</tr>
				<tr>
					<th>曾用名：</th>
					<td>${moveIn.alias }</td>
					<th>出生日期：</th>
					<td><fmt:formatDate value="${moveIn.bornDate}" pattern="yyyy-MM-dd" /></td>
					<th>文化程度：</th>
					<td>${fns:getSysDicValueByKey('common_table','whcd',moveIn.dicWhcdKey ,'')}
                  	</td>
				</tr>
				<tr>
					<th>婚姻状况：</th>
					<td>${fns:getSysDicValueByKey('common_table','hyzk',moveIn.dicHyzkKey ,'')}
                  </td>
					<th>职业：</th>
					<td>${moveIn.job }</td>
					<th>原政治面貌：</th> 
					<td> ${fns:getSysDicValueByKey('common_table','zzmm',moveIn.oldPoliticStatusId  ,'')}
                  	</td>
				</tr>
				<tr>
					<th>籍贯：</th>
					<td>${moveIn.origin }</td>
					<th>户籍所在地：</th>
					<td>${moveIn.regResidence } 
						</td>
					<th>联系方式：</th>
					<td>${moveIn.contactPhone }</td>
				</tr>
				<tr>
					<th>原判罪名：</th>
					<td>${moveIn.crimeInfo }
						</td>
					<th>刑期：</th>
					<td>${moveIn.adjudgePeriod}</td>
					<th>刑期执行类别：</th>
					<td> ${fns:getSysDicValueByKey('common_table','entrust_type_id',moveIn.dicPenalTypeKey ,'')}
                  	</td>
				</tr>
				<tr>
					<th>刑期变动：</th>
					<td>${moveIn.adjudgeChange }</td>
					<th>刑期开始日期：</th>
					<td><fmt:formatDate value="${moveIn.adjudgeStartTime}" pattern="yyyy-MM-dd" />
					</td>
					<th>刑期结束日期：</th>
					<td><fmt:formatDate value="${moveIn.adjudgeEndTime}" pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<th>矫正期限：</th>
					<td> ${moveIn.redressPeriod }
									
					<th>矫正开始日期：</th>
					<td><fmt:formatDate value="${moveIn.redressStartDate}"
									pattern="yyyy-MM-dd" />
					</td>
					<th>矫正结束日期：</th>
					<td><fmt:formatDate value="${moveIn.redressEndDate}"
									pattern="yyyy-MM-dd" />
					</td>
				</tr>
			</table>
		</div>
	 <div class="easyui-panel" title="迁入相关信息" style="width:100%;padding:5px;margin:0 auto;">
	 	<table width="100%" class="grid" >
			<tr>
				<th width="10%">申请时间：</th>
				<td width="23%"><fmt:formatDate value="${moveIn.moveTime}"
									pattern="yyyy-MM-dd" />
				 </td>
				<th width="10%">原司法所：</th><td width="23%">${moveIn.oldGroup }</td>
				<th width="10%">拟迁往司法所：</th><td>${moveIn.groupName }</td>
			</tr>
			<tr>
				<th>现居住地：</th>
				<td colspan="5">${moveIn.oldPlace }</td>
			</tr>
			<tr>
				<th>拟居住地：</th>
				<td colspan="5">${moveIn.newPlace }</td>
			</tr>
			<tr>
				<th>居住地变更原因：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.reason }</textarea></td>
			</tr>
			<tr>
				<th>司法所意见：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.opinion }</textarea></td>
			</tr>
			<tr>
				<th>备注：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.note }</textarea></td>
			</tr>
			<tr>
				<th>已上传附件：</th>
				<td style="border-right-style: none" colspan="5">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn"
									onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<th>调查相关材料：</th>
				<td style="border-right-style: none" colspan="5">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList1}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn"
									onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	 </div>
	 <c:if test="${moveIn.auditType eq 'sfsReport'}">
	 <div class="easyui-panel" title="调查相关材料上传" style="width:100%;padding:5px;margin:0 auto;">
	 	<table width="100%" class="grid" >
			<tr>
				<th width="10%">调查相关材料：</th>
				<td>
				<div id="dcloader"></div>
				 </td>
			</tr>
		</table>
	 </div>
	 </c:if>
	 <c:if test="${moveIn.auditType eq 'sfsCheck' || moveIn.auditType eq 'jzkCheck' || moveIn.auditType eq 'xfgCheck'}">
	 <div class="easyui-panel" title="审批信息" style="width:100%;padding:5px;">
	            <table width="100%" class="grid">
	            	<TR>	
						<Th width="10%" >审核结果：</Th>
						<td width="23%">
							<input type="radio" name="decideType" checked="checked" value="1"/>同意&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="decideType" value="2" />退回&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
							<input type="radio" name="decideType" value="0" />不同意&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						</td>
						<Th  width="10%" >审核意见：</Th>
						<TD width="23%" style="border-right:0;">
							<textarea style="width:160%;height:60px;" name="opinion" ></textarea>
						</TD>
						<Td style="border:0;" width="10%"></Td><TD style="border:0;"></TD>
					</TR>
				<c:if test="${moveIn.auditType eq 'jzkCheck'}">
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzksr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(1);">评定</a>
					</TD>
					
					<Th width="10%">输入质量评分：</Th>
					<TD colspan="3">
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
				</TR>
				
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(2)">评定</a>
					</TD>
					<Th width="10%">执法质量评分：</Th>
					<TD colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
					</c:if>
	            </table>
	   </div>
	   
	   </c:if>
    </form>
    <div id="moveInScoreForm"></div>
<script type="text/javascript">
$(function(){
	$("#dcloader").powerWebUpload({ auto: true,fileNumLimit:20,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	$('#moveInAuditInfo').form({
		url:'${ctx}/culprit/moveIn/submitMoveInAudit',
		onSubmit:function(){
			 progressLoad();
			 var isValid = $(this).form('validate');
            if (!isValid) {
                progressClose();
            }
            return isValid;
		},
		success:function(data){
			progressClose();
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                 parent.$.modalDialog.handler.dialog('close');
				
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
		}
	});	
	
})


//评分
function rewardspunishment(type){
		var url = '${ctx}/sys/mxCheck/assess?infoType='+ type +'&processInstanceId=${moveIn.processInstanceId}&tablename=moveInScoreForm';
		var title = "评定明细";
		
		if (type == 1 || type == 4) {
			title = "输入质量" + title;
		}
		if (type == 2 || type == 3 || type == 5 || type == 6) {
			title = "执法质量" + title;
		}
		
		$('#moveInScoreForm').dialog({    
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
		$('#moveInScoreForm').window('center');
	}
 

</script>