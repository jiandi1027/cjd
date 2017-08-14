<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<title>撤销假释审核</title>

</head>
<body>

<form id="revokeParoleAuditForm" name="revokeParoleAuditForm" action="${ctx}/jiangcheng/revokeParole/submitRevokeParoleAudit" method="post">
	<input type="hidden" name="taskId" value="${revokeParole.taskId}"/>
	<input type="hidden" name="id" id="revokeParoleId" value="${revokeParole.id}"/>
	<input type="hidden" name="auditType" value="${revokeParole.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
  		<TBODY>
   			<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;矫正对象基本信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
						<TR>
						<tr>
                  			<td>姓名:</td>
                  			<td colspan="5">${culprit.name }</td>
              			</tr>
		              	<tr>
		                  <td width="15%">性别:</td>
		                  <td>${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</td>
		                   <td width="15%">民族:</td>
		                  <td>${culprit.nation }</td>
		                   <td width="15%">身份证号:</td>
		                  <td>${culprit.identification }</td>
		              	</tr>
			            <tr>
			                  <td>曾用名:</td>
			                  <td>${culprit.alias }</td>
			                   <td>出生日期:</td>
			                  <td>${culprit.birthday }</td>
			                   <td>文化程度:</td>
			                  <td>${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}</td>
			            </tr> 
		                <tr>
		                  <td>婚姻状况:</td>
		                  <td>${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'') }</td>
		                   <td>职业:</td>
		                  <td>${culprit.job }</td>
		                   <td>原政治面貌:</td>
		                  <td>${fns:getSysDicValueByKey('common_table','zzmm',culprit.dicYzzmmKey,'') }</td>
		               </tr>
		               <tr>
		                  <td>籍贯:</td>
		                  <td>${culprit.origin }</td>
		                   <td>户籍所在地:</td>
		                  <td>${culprit.regResidenceStreet }</td>
		                   <td>现居住地:</td>
		                  <td>${culprit.addressDetail }</td>
		              </tr>
		              <%-- 
		               <tr>
		                  <td>原判罪名:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		                   <td>刑期:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		                   <td>附加刑:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		              </tr>
		               <tr>
		                  <td>刑期变动:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		                   <td>刑期开始时间:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		                   <td>刑期结束时间:</td>
		                  <td><input name="email" class="f1 easyui-textbox"></input></td>
		              </tr>
		              --%>
		              <tr>
		                  <td>刑法执行类别:</td>
		                  <td></td>
		                   <td>矫正开始时间:</td>
		                  <td><fmt:formatDate value="${culprit.redressStartDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                   <td>矫正结束时间:</td>
		                  <td><fmt:formatDate value="${culprit.redressEndDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
		              </tr>
				</TBODY>
				</TABLE>
			</TD>
		</TR>
   </TBODY>
</TABLE>
	
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;具体处理信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
						align=center>
						<TBODY>
							<tr>
								<td height=30 width="15%" align=left>违纪原因</td><td>${fns:getSysDicValueByKey('sf_revoke_probation','REASON_TYPE_ID',revokeParole.dicReasonTypeKey,'')}</td>
				            </tr>
				            <tr>
				                 <td height=30 width="15%" align=left>结案报告:</td><td>${revokeParole.endCasePathName }</td>
				            </tr>
				             <tr>
				                 <td height=30 width="15%" align=left>证据材料:</td><td>${revokeParole.notePathName }</td>
				             </tr>
				             <tr>
			                    <td height=30 width="15%" align=left>简要违纪情况：</td><td>${revokeParole.detailInfo }</td>
			                 </tr>
			                 <tr>
			                    <td height=30 width="15%" align=left>处理依据：</td><td>${revokeParole.fact }</td>
			                 </tr>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
</TABLE>
<c:if test="${revokeParole.auditType ne 'sfsReport' && revokeParole.auditType ne 'jzkReport' 
	&& revokeParole.auditType ne 'sfsCheck'}">
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;质量评定</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4 bgColor=#c4d8ed
						align=center>
						<TBODY>
							   <TR>	
									<TD height=30 width="15%" align=left >矫正科输入质量评分：${jzksr}</TD>
									<TD height=30 width="15%" align=left >矫正科执法质量评分：${jzkzf}</TD>
									<TD height=30 width="15%" align=left >法制科执法质量评分：${fzkzf}</TD>
								</TR>
								
				                 <TR>	
									<TD height=30 width="15%" align=left >矫正处输入质量评分：${jzcsr}</TD>
									<TD height=30 width="15%" align=left >矫正处执法质量评分：${jzczf}</TD>
									<TD height=30 width="15%" align=left >法制处执法质量评分：${fzczf}</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
 </TABLE>
</c:if>


<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;审批信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4 bgColor=#c4d8ed
						align=center>
						<TBODY>
							 <c:if test="${revokeParole.auditType ne 'sfsReport' && revokeParole.auditType ne 'jzkReport'
							  && revokeParole.auditType ne 'jzkPrint' && revokeParole.auditType ne 'sfsPrint'}">
							   <TR>	
									<TD height=30 width="15%" align=left >审核结果：</TD>
									<TD  width="35%">
										<input type="radio" name="decideType" checked="checked" value="1"/>同意
										<c:if test="${revokeParole.auditType eq 'sfgCheck' }"><input type="radio" name="decideType" value="0"/>不同意</c:if>
										<input type="radio" name="decideType" value="2" />退回
									</TD>
									<TD height=30 width="15%" align=left >审核意见</TD>
									<TD  width="35%">
										<textarea rows="3" cols="60" name="opinion" ></textarea>
									</TD>
								</TR>
								</c:if>
				                <c:if test="${revokeParole.auditType ne 'sfsReport' && revokeParole.auditType ne 'jzkReport' 
									&& revokeParole.auditType ne 'sfsCheck'
									&& revokeParole.auditType ne 'jzkPrint' && revokeParole.auditType ne 'sfsPrint'}">
			                 	<TR>	
									<TD height=30 align=left >编辑撤销假释建议书：</TD>
									<TD >
										<input type="button"  value="编辑" onclick="printRevokeParoleBook();"/>
									</TD>
									<c:if test="${revokeParole.auditType eq 'jzkCheck'||revokeParole.auditType eq 'sjzCheck'}">
									<TD height=30 align=left >是否推荐为典型案例：</TD>
									<TD  width="35%">
										<input type="radio" name="recommendStatus" value="1"/>是
										<input type="radio" name="recommendStatus" value="2" />否
									</TD>
									</c:if>
								</TR>	
								<c:if test="${revokeParole.auditType eq 'jzkCheck'}">		    
								<TR>	
									<TD height=30 align=left >输入质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#dd').window('open');"/>
									</TD>
									
									<TD height=30 align=left >输入质量评分：</TD>
									<TD width="35%">
										<input  class="easyui-validatebox" required=true
											 missingMessage="质量评分不能为空!"  readonly="readonly" id="handleQualityGoal" name="optScore" />
									</TD>
								</TR>
								<TR>	
									<TD height=30 align=left >执法质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#tt').window('open')" />
									</TD>
									<TD height=30 align=left >执法质量评分：</TD>
									<TD width="35%">
										<input class="easyui-validatebox" required=true
											 missingMessage="执法质量不能为空!" readonly="readonly" id="actionQualityGoal" name="zfScore" />
									</TD>
								</TR>	
								<TR>	
									<TD height=30 align=left >呈报单位类别：</TD>
									<TD >
										<select style="width:150px;" editable=false name="submittionOrgTypeId" required=true missingMessage="呈报不能为空!" value="${revokeParole.submittionOrgTypeId }"
															class="easyui-combobox">
																<option value="97001">基层人民法院</option>   
														    	<option value="97002">监狱管理局</option>   
														    	<option value="97003">中级人民法院</option>   
														   	 	<option value="97004">市级公安机关</option>   
												
										</select >
									</TD>
								</TR>
								<TR>	
									<TD height=30 align=left >呈报单位名称：</TD>
									<TD >
										<input type="text"  name="submittionOrg" />
									</TD>
								</TR>
								<TR>	
									<TD height=30 align=left >抄送单位名称：</TD>
									<TD >
										<input type="text"  name="copyOrg" />
									</TD>
								</TR>
								</c:if>
								<c:if test="${revokeParole.auditType eq 'fzkCheck'}">		    
								<TR>	
									<TD height=30 align=left >执法质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#tt').window('open')" />
									</TD>
									<TD height=30 align=left >执法质量评分：</TD>
									<TD width="35%">
										<input  class="easyui-validatebox" required=true
											 missingMessage="执法质量不能为空!" readonly="readonly" id="actionQualityGoalF" name="zfScore" />
									</TD>
								</TR>	
								</c:if>
								<c:if test="${revokeParole.auditType eq 'sjzCheck'}">		    
								<TR>	
									<TD height=30 align=left >输入质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#dd').window('open')"/>
									</TD>
									
									<TD height=30 align=left >输入质量评分：</TD>
									<TD width="35%">
										<input  class="easyui-validatebox" required=true
											 missingMessage="质量评分不能为空!"  readonly="readonly" id="cityHandleQualityGoal" name='optScore' />
									</TD>
								</TR>
								<TR>	
									<TD height=30 align=left >执法质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#tt').window('open')" />
									</TD>
									<TD height=30 align=left >执法质量评分：</TD>
									<TD width="35%">
										<input  class="easyui-validatebox" required=true
											 missingMessage="执法质量不能为空!" readonly="readonly" id="cityJactionQualityGoal" name="zfScore" />
									</TD>
								</TR>	
								<TR>	
									<TD height=30 align=left >呈报单位名称：</TD>
									<TD >
										<input type="text"  name="submittionOrg" />
									</TD>
								</TR>
								<TR>	
									<TD height=30 align=left >抄送单位名称：</TD>
									<TD >
										<input type="text"  name="copyOrg" />
									</TD>
								</TR>
								</c:if>
								<c:if test="${revokeParole.auditType eq 'sfzCheck'}">		    
								<TR>	
									<TD height=30 align=left >执法质量：</TD>
									<TD width="35%">
										<input type="button"  value="评定" onclick="$('#tt').window('open')" />
									</TD>
									<TD height=30 align=left >执法质量评分：</TD>
									<TD width="35%">
										<input  class="easyui-validatebox" required=true 
											 missingMessage="执法质量不能为空!" readonly="readonly" id="cityFactionQualityGoal" name="zfScore" />
									</TD>
								</TR>	
								</c:if>
							</c:if>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
 </TABLE>
 	 <c:if test="${revokeParole.auditType eq 'sfsReport'|| revokeParole.auditType eq 'jzkReport'
 	 			|| revokeParole.auditType eq 'sfsPrint' || revokeParole.auditType eq 'jzkPrint'}">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
 <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
  <TBODY>
  	<c:if test="${revokeParole.auditType ne 'sfsPrint'&& revokeParole.auditType ne 'jzkPrint'}">
 	<tr>
  		<td colspan=4 align=center class=category>
		<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">提交</a>
  		</td>
	</tr>
	</c:if>
	<c:if test="${revokeParole.auditType eq 'sfsPrint' || revokeParole.auditType eq 'jzkPrint'}">
 	<tr>
  		<td colspan=4 align=center class=category>
		<a id="submitbtn1"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">结束流程</a>
  		</td>
	</tr>
	</c:if> 
	</TBODY>
</TABLE>
</form>

<!-- <div id="dd" class="easyui-tabs" title="输入质量评定明细" style="width:500px;height:400px;background:#c4d8ed"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed: true" > -->
     <div id="dd" class="easyui-window" title="输入质量评定明细" style="width:500px;height:400px;background:#c4d8ed;"  data-options="closed: true">  
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang1" value="1"/><label for="zhiliang1">要求输入系统平台的内容,没有输入的,每处扣1分,共</label><input type="text" id="num0" value="1" style="width:20px;"/>处</p>  
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang2" value="1"/><label for="zhiliang2">要求扫描输入系统平台的材料缺页的,每缺1页扣1分,共</label><input type="text" id="num1"  value="1" style="width:20px;"/>处</p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang3" value="0.5"/><label for="zhiliang3">扫描输入系统平台的材料,不连续连贯的,扣0.5分</label><input type="hidden" id="num2"  value="1" style="width:20px;"/></p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang4" value="2"/><label for="zhiliang4">该扫描输入系统平台的材料未扫描输入的,每件扣2分,共</label><input type="text" id="num3"  value="1" style="width:20px;"/>处</p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang5" value="1"/><label for="zhiliang5">扫描输入系统平台的材料不符合系统要求格式的,扣1分,共</label><input type="text" id="num4"  value="1" style="width:20px;"/>处</p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang6" value="0.5"/><label for="zhiliang6">输入系统平台的文字、内容错误的,每处扣0.5分,共</label><input type="text" id="num5"  value="1" style="width:20px;"/>处</p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang7" value="0.5"/><label for="zhiliang7">输入系统平台的文字、内容与书面材料内容不相符的,每处扣0.5分,共</label><input type="text" id="num6"  value="1" style="width:20px;"/>处</p>
	        	<p><input type="checkbox" name="zhiliang" id="zhiliang8" value="1"/><label for="zhiliang8">发现其他输入问题的，根据实际情况扣分,共</label><input type="text" value="1" id="num7"  style="width:20px;"/>分</p>
	    		<div style="background:#c4d8ed">
	    			具体说明:<input  name="" class="f1 easyui-textbox" style="width:300px;height:60px;"/>
	    		</div>
			   <div align="center" padding="20px 30px 40px 50px">
			        <p colspan="4" > 
			        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkZhiLiang();">确定</a>
				  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#dd').window('close');">取消</a>
				  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				  </p>
			   </div>
		 </div>

<div id="tt" class="easyui-window" title="执法质量评定明细" style="width:800px;height:600px;background:#c4d8ed"   
        data-options="closed: true" >
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang9"/><label for="zhiliang9">调查人员少于2人的,扣2分,共</label><input type="text" id="zhifa0" value="1" style="width:20px;"/>处</p>  
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang10"/><label for="zhiliang10">书面证据复印件,没有加盖提供单位公章的,或者没有提供人签名并捺指印的,扣3分,共</label><input type="text" id="zhifa1"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang11"/><label for="zhiliang11">询问笔录未注明询问开始和结束时间的,扣0.5分,共</label><input type="hidden" id="zhifa2"  value="1" style="width:20px;"/></p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang12"/><label for="zhiliang12">询问笔录未注明谈话地点、谈话人、记录人的,扣0.5分,共</label><input type="text" id="zhifa3"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang13"/><label for="zhiliang13">询问笔录中,被询问人姓名处未按指印的,扣0.5分,共</label><input type="text" id="zhifa4"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang14"/><label for="zhiliang14">询问笔录不按一"问"一"答" 形式进行,或者使用其他符号表示的,扣0.5分,共</label><input type="text" id="zhifa5"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang15"/><label for="zhiliang15">询问笔录涂改处,没有被询问人捺指印确认的,每处扣1分,共</label><input type="text" id="zhifa6"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang16"/><label for="zhiliang16">询问未成年人时,未在询问笔录中注明其父母或其他监护人的,扣2分,共</label><input type="text" value="1" id="zhifa7"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang17"/><label for="zhiliang17">询问笔录中,未反映出询问人身份、询问目的,以及未告之被询问人法律责任的,扣0.5分,共</label><input type="text" value="1" id="zhifa8"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="5" id="zhiliang18"/><label for="zhiliang18">询问笔录末尾部分,未由被询问人签署"以上笔录我已看过,和我说的一样"或"以上笔录已读给我听过,和我说的一样"字样的,扣5分,共</label><input type="text" value="1" id="zhifa9"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="5" id="zhiliang19"/><label for="zhiliang19">询问笔录末尾部分,未由被询问人签字的,扣5分,共</label><input type="text" value="1" id="zhifa10"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang20"/><label for="zhiliang20">未捺指印的,扣3分,共</label><input type="text" value="1" id="zhifa11"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang21"/><label for="zhiliang21">未注明日期的,扣1分,共</label><input type="text" value="1" id="zhifa12"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang22"/><label for="zhiliang22">询问笔录制作完成后,未由被询问人在笔录除最后一页之外的每一页右下脚签名、捺指印,扣3分,共</label><input type="text" value="1" id="zhifa13"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang23"/><label for="zhiliang23">询问笔录制作完成后,未签名,或者未捺指印的,每发现一起扣0.5分,共</label><input type="text" value="1" id="zhifa14"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang24"/><label for="zhiliang24">询问笔录制作完成后,未由被调查人在笔录右边侧骑缝处捺指印的,扣3分,共</label><input type="text" value="1" id="zhifa15"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang25"/><label for="zhiliang25">询问笔录制作完成后,只捺1个指印的,扣1分,共</label><input type="text" value="1" id="zhifa16"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang26"/><label for="zhiliang26">询问笔录制作完成后,指印未覆盖到笔录的每一页的,扣1分,共</label><input type="text" value="1" id="zhifa17"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang27"/><label for="zhiliang27">询问笔录制作完成后,在左侧按指印的,扣0.5分,共</label><input type="text" value="1" id="zhifa18"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang28"/><label for="zhiliang28">询问笔录末尾部分,询问人、记录人没有手写签名的,扣1分,共</label><input type="text" value="1" id="zhifa19"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang29"/><label for="zhiliang29">对笔录中出现的矛盾关键点,未详细核实的,扣2分,共</label><input type="text" value="1" id="zhifa20"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang30"/><label for="zhiliang30">应该调查的人员没有调查的,每发现一起扣1分,共</label><input type="text" value="1" id="zhifa21"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang31"/><label for="zhiliang31">被调查人反映的情况相互矛盾没有发现的扣0.5分,共</label><input type="text" value="1" id="zhifa22"  style="width:20px;"/>处</p> 
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang32"/><label for="zhiliang32">将相互矛盾的材料没有经过合理分析判断直接作为定案证据的每发现一起扣1分,共</label><input type="text" value="1" id="zhifa23"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang33"/><label for="zhiliang33">证据收集不充分或者证据之间不能相互印证的,证据不能形成有效证据链的,发现一处扣1分,共</label><input type="text" value="1" id="zhifa24"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang34"/><label for="zhiliang34">违法行为发生的时间、地点、事实后果、情节记载不清或者前后不一的,每发现一处扣1分,共</label><input type="text" value="1" id="zhifa25"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang35"/><label for="zhiliang35">记载内容不全的,每缺一项扣1分,共</label><input type="text" value="1" id="zhifa26"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang36"/><label for="zhiliang36">调查中反映的同一当事人,前后姓名不一的,扣1分,共</label><input type="text" value="1" id="zhifa27"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang37"/><label for="zhiliang37">对被处罚的社区矫正人员的身份证明应当提取而未提取的,扣1分,共</label><input type="text" value="1" id="zhifa28"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang38"/><label for="zhiliang38">询问笔录等证据材料被询问人拒绝签字（盖章）确认而调查人员未注明情况的,发现一处扣0.5分,共</label><input type="text" value="1" id="zhifa29"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang39"/><label for="zhiliang39">辨认时,被辨认的人数少于七人,或者辨认的照片少于十人的照片的,扣3分,共</label><input type="text" value="1" id="zhifa30"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang40"/><label for="zhiliang40">减刑（假释）案件,未进行公示的,扣3分,共</label><input type="text" value="1" id="zhifa31"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang41"/><label for="zhiliang41">减刑（假释）案件,未报检察院出具监督意见的,扣3分,共</label><input type="text" value="1" id="zhifa32"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang42"/><label for="zhiliang42">警告案件,未责令社区矫正人员具结悔过的,扣1分,共</label><input type="text" value="1" id="zhifa33"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang43"/><label for="zhiliang43">主要证据不足,不能证明社区矫正人员有违法事实的,扣10分,共</label><input type="text" value="1" id="zhifa34"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang44"/><label for="zhiliang44">主要证据错误,导致社区矫正人员身份或者事实认定错误的,扣10分,共</label><input type="text" value="1" id="zhifa35"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang45"/><label for="zhiliang45">不按法定程序收集证据或者伪造证据的,扣10分,共</label><input type="text" value="1" id="zhifa36"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang46"/><label for="zhiliang46">对违法行为的事实认定错误或者主要事实不清的,扣10分,共</label><input type="text" value="1" id="zhifa37"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang47"/><label for="zhiliang47">其他根据情况扣分,扣</label><input type="text" value="1" id="zhifa38"  style="width:20px;"/>分</p>
    <div style="background:#c4d8ed">
    	具体说明:<input  name="" class="f1 easyui-textbox" style="width:600px;height:60px;"/>
    </div>
    <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkZhiFa();">确定</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#dd').window('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    </div>
</div>   


<script type="text/javascript">
//质量评分
function checkZhiLiang(){
	var obj=document.getElementsByName('zhiliang');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#num'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#handleQualityGoal").val())!="undefined"){
		 $("#handleQualityGoal").val(sum);
	 }else if(typeof($("#cityHandleQualityGoal").val())!="undefined"){
		 $("#cityHandleQualityGoal").val(sum);
	 }
	 $('#dd').window('close');
}

//执法评分
function checkZhiFa(){
	var obj=document.getElementsByName('zhifa');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#zhifa'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#actionQualityGoal").val())!="undefined"){
		 $("#actionQualityGoal").val(sum);
	 }else if(typeof($("#actionQualityGoalF").val())!="undefined"){
		 $("#actionQualityGoalF").val(sum);
	 }else if(typeof($("#cityJactionQualityGoal").val())!="undefined"){
		 $("#cityJactionQualityGoal").val(sum);
	 }else{
		 $("#cityFactionQualityGoal").val(sum);
	 }; 
	 $('#tt').window('close');
}

//编辑撤销缓刑建议表
function printRevokeParoleBook(){
	 var id=$("#revokeParoleId").val();
	 var url = '${ctx}/jiangcheng/revokeParole/preSubmit?id=' + id;
	 open_layer('撤销缓刑建议书',url);
}


function open_layer(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

//js方法：序列化表单 			
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ','+this['value'];
		} else {
			obj[this['name']] =this['value'];
		}
	});
	return obj;
}

//提交
function doAudit(){
	 if($("#revokeParoleAuditForm").form('validate')){
		 $.ajax({
			type: 'post' ,
			url: $("#revokeParoleAuditForm").attr("action"),
			cache:false ,
			data:$('#revokeParoleAuditForm').serialize() ,
			dataType:'json',
			success:function(data){
				$.messager.show({
  					title:'提示信息!',
  					msg:data.msg
  				});
  				parent.location.reload();
      			var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} ,
			error:function(result){
				$.messager.show({
  					title:'提示信息!',
  					msg:data.msg
  				});
			}
		});
		}else{
			 $.messager.show({
				title:'提示信息!' ,
				msg:'验证失败！请检查数据是否已填写完整!'
			}); 
	}  
}

/* $(function() {
	$('#revokeParoleAuditForm').form({
		url:'${ctx}/jiangcheng/revokeParole/submitrevokeParoleAudit',
		onSubmit:function(){
			if($(this).form('validate')){
				return true;
			}else{
				$.messager.show({
					title:'提示信息!' ,
					msg:'输入质量评分或执法质量评分不能为空！'
				});
				return false;
			}
		},
		success:function(data){
			console.log(data);
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:'流程处理成功！'
				});
				parent.location.reload();
    			var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			}else{
				$.messager.show({
					title:'提示信息!' ,
					msg:'流程处理失败！'
				});
			}		
		}
	}); 
}) */



</script>
</body>
</html>