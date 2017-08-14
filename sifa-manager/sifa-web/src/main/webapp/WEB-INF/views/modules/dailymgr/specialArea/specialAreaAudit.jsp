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

</head>
<body>

<form id="specialAuditForm" name="specialAuditForm" action="${ctx}/dailymgr/specialArea/submitSpecialAreaAudit" method="post">
	<input type="hidden" name="taskId" value="${specialArea.taskId}"/>
	<input type="hidden" name="id" id="specialAreaId" value="${specialArea.id}"/>
	<input type="hidden" name="auditType" value="${specialArea.auditType}"/>
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
			                    <td width="15%">申请提交时间：</td>
			                    <td width="10%"><fmt:formatDate value="${specialArea.applyDate }"
												pattern="yyyy-MM-dd" /></td>
			                    <td width="15%">申请进入时间：</td>
			                    <td width="10%"><fmt:formatDate value="${specialArea.startDate }"
												pattern="yyyy-MM-dd" /></td>
			                     <td width="15%">申请离开时间：</td>
			                     <td width="10%"><fmt:formatDate value="${specialArea.endDate }"
												pattern="yyyy-MM-dd" /></td>
								<td width="15%">申请进入区域:</td>
			                     <td width="10%">${specialArea.area }</td>
			                </tr>
			                <tr>
								<td height=40>申请原因：</td>
								<td colspan="7">${specialArea.reason }</td>
			                </tr>
			                <tr>
								<td height=40>备注：</td>
								<td colspan="7">${specialArea.note }</td>
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
							<c:if test="${specialArea.auditType ne 'sfsPrint'}">
							   <TR>	
									<TD height=30 width="15%" align=left >审核结果111：</TD>
									<TD  width="35%">
										<input type="radio" name="decideType" checked="checked" value="1"/>同意
										<input type="radio" name="decideType" value="0"/>不同意
									</TD>
									<TD height=30 width="15%" align=left >审核意见</TD>
									<TD  width="35%">
										<textarea rows="3" cols="60" name="opinion" ></textarea>
									</TD>
								</TR>
							</c:if>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
 </TABLE>
 	 <c:if test="${specialArea.auditType eq 'sfsPrint'}">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
 <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
  <TBODY>
  	<c:if test="${specialArea.auditType ne 'sfsPrint'}">
 	<tr>
  		<td colspan=4 align=center class=category>
		<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">提交</a>
  		</td>
	</tr>
	</c:if>
	<c:if test="${specialArea.auditType eq 'sfsPrint'}">
 	<tr>
  		<td colspan=4 align=center class=category>
		<a id="submitbtn1"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">结束流程</a>
  		</td>
	</tr>
	</c:if> 
	</TBODY>
</TABLE>
</form>
 


<script type="text/javascript">

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
	 if($("#specialAuditForm").form('validate')){
		 $.ajax({
			type: 'post' ,
			url: $("#specialAuditForm").attr("action"),
			cache:false ,
			data:$('#specialAuditForm').serialize() ,
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
			error:function(data){
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

</script>
</body>
</html>