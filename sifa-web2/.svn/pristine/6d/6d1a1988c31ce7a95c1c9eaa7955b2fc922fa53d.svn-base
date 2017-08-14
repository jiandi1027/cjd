<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
     <div class="easyui-panel" title="基本情况" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%"class="grid">
                <tr>
                   	<th width="10%">司法所：</th><td width="12%">${culprit.groupName}</td>
                   	<th width="10%">人员编号：</th><td width="12%">${culprit.no }</td>
                   	<th width="10%">姓名：</th><td width="12%">${culprit.name }</td>
                	<th width="10%">曾用名：</th><td width="13%">${culprit.alias }</td>
                	<td width="10%" rowspan=4 align="center">
                	<img id="headimg" src="${filePath}/${image.path}/${image.name}" style="cursor:pointer;" height="200px" width="100%;">
                	</td>
                </tr>
                <tr>
                    <th>性别：</th><td>${fns:getSysDicValueByKey('common_table', 'sex', culprit.dicSexKey, '') }
                    </td><th>民族：</th>
                    <td>${fns:getSysDicValueByKey('common_table', 'nation',culprit.nation, '') }</td>
                    <th>出生日期：</th><td ><fmt:formatDate value="${culprit.birthday}" pattern="yyyy-MM-dd" /></td>
					<th>联系方式：</th><td >${culprit.contactPhone }</td>
                </tr>
                <tr>
                	<th>证件类型：</th><td>${fns:getSysDicValueByKey('SF_CULPRIT', 'dicZjlxKey',culprit.dicZjlxKey, '') }</td>
                	<th>证件号码：</th><td>${culprit.identification }</td>
                	<th>籍贯：</th><td>${culprit.origin }</td>
                    <th>户籍性质：</th><td>${fns:getSysDicValueByKey('common_table', 'hklx',culprit.dicHklxKey, '') }</td>
                </tr>
               	<tr>
               		<th>文化程度：</th><td>${fns:getSysDicValueByKey('common_table', 'whcd',culprit.dicWhcdKey, '') }</td>
                    <th>现在工作单位：</th><td><c:if test="${culprit.newJob ne null }">${culprit.newJob }</c:if></td>
                    <th>单位联系方式：</th><td>${culprit.jobPhone }</td>
                    <th>婚姻状况：</th><td>${fns:getSysDicValueByKey('common_table', 'hyzk',culprit.dicHyzkKey, '') }</td>
               	</tr>
               	<tr>
                    <th width="10%">户籍详细地址：</th>
                    <td colspan="8" align="left">
						${culprit.regResidence }
                    </td>
                </tr>
                <tr>
                    <th width="10%">居住地详细地址：</th>
                    <td colspan="8" align="left">
                    	${culprit.address }
                    </td>
                </tr>   
               	
            </table>
    </div>
     <div class="easyui-panel" title="罪犯押送情况" style="width:100%;padding:5px;margin:0 auto;">
	    	<table width="100%" class="grid">
	     		<tr>
	                <th width="10%">人员接收方式：</th>
	                <td width="89%"> ${fns:getSysDicValueByKey('culprit_judgment', 'dicReceiveTypeKey',culpritJudgment.dicReceiveTypeKey, '') } </td>
				</tr>
	     	</table>
     	<%-- <table class="easyui-datagrid" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritJudgment/list?culpritId='+'${culprit.id}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">执行押送民警姓名</th>
					<th data-options="field:'identification',width:250,align:'center'" editor="text">单位</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">职务</th>
					<th data-options="field:'escortDate',width:250,align:'center'" editor="text">押送时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table> --%>
	</div>
	 <%-- <div class="easyui-panel" title="同案犯信息" style="width:100%;padding:5px;">
	 <table class="easyui-datagrid" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/culpritinfo/culpritComplicity/list?culpritId='+'${culprit.id}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'name',width:'15%',align:'center'">姓名</th>
					<th data-options="field:'dicSexKey',width:'15%',align:'center',formatter:formatSex" editor="text">性别</th>
					<th data-options="field:'birthday',width:'15%',align:'center'" editor="text">出生年月</th>
					<th data-options="field:'crime',width:'15%',align:'center'" editor="text">罪名</th>
					<th data-options="field:'dicYpxfKey',width:'15%',align:'center',formatter:formatYpxf" editor="text">被判处刑罚</th>
					<th data-options="field:'prison',width:'23%',align:'center'" editor="text">所在监狱</th>
				</tr>
			</thead>
		</table>
	 </div> --%>
	 <div class="easyui-panel" title="其他情况相关" style="width:100%;padding:5px;margin:0 auto;">
	 	<table width="100%"class="grid">
	 		<tr>
	 			<th width="10%">是否完成报备：</th>
	 			<td width="23%">
	 			${fns:getSysDicValueByKey('sf_exit_entry_report','dicBbztKey',exitEntryReport.dicBbztKey,'') }
				</td>
				<th width="10%">报备时间：</th>
				<td width="23%">
					<fmt:formatDate value="${exitEntryReport.filingDate }" pattern="yyyy年MM月dd日" />
				</td>
				<th width="10%">未报备原因：</th>
				<td width="23%">
					 <c:if test="${exitEntryReport.filingDate ==null}">证件未收缴</c:if>
				</td>
	 		</tr>
	 		<c:set value="${fn:split(exitEntryReport.dicZjlxKey,',') }" var="ths"></c:set>
	 		<c:forEach items="${ths }" var="th" varStatus="status">
	 			<tr>
                  <th width="10%">证件类型：</th><td>${fns:getSysDicValueByKey('common_table','dicZjlxKey',th,'')}</td>
                  <th width="10%">证件号码：</th><td>${fn:split(exitEntryReport.cedentialsNumber, ',')[status.count-1]}</td>
              	  <th width="10%">收缴人及收缴时间：</th><td>${exitEntryReport.handlingPerson}<c:if test="${exitEntryReport.filingDate !=null}">，</c:if><fmt:formatDate value="${exitEntryReport.filingDate}" pattern="yyyy年MM月dd日" /></td>
              	</tr>
             </c:forEach>	
	 		<tr>
	 			<th>首次报到时间：</th>
	 			<td><fmt:formatDate value="${culprit.createdTime}"
									pattern="yyyy年MM月dd日" /></td>
				<th>报到情况：</th>
				<td>
					<c:if test="${culprit.dicReportInfoKey eq 1 }">
		 				<p>正常</p>
		 			</c:if>
		 			<c:if test="${culprit.dicReportInfoKey eq 2 }">
		 				<p>漏罪</p>
		 			</c:if>
	 			</td>
	 			<th>信息化管理：</th>
	 			<td>
		 			<c:if test="${culpritJudgment.dicIsInfManageKey ne 0 }">
		 				是
		 			</c:if>
		 			<c:if test="${culpritJudgment.dicIsInfManageKey eq 0 }">
		 				否
		 			</c:if>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>矫正小组：</th>
	 			<td>
	 				${monitorGroup}
	 			</td>
	 			<th>有无定位手机：</th>
	 			<td>
	 				<c:if test="${terminal.mobileNumber == null}">
		 				<p>无</p>
		 			</c:if>
		 			<c:if test="${terminal.mobileNumber !=null }">
		 				<p>有</p>
		 			</c:if>
	 			</td>
	 			<th>定位手机：</th>
	 			<td>${terminal.mobileNumber}</td>
	 		</tr>
	 		<tr>
	 			
	 			<th width="10%">监管等级：</th>
	 			<td width="23%">
		 			 ${fns:getSysDicValueByKey('sf_culprit', 'dic_gldxjb_key',culprit.dicMonitorGradeKey, '') } 
	 			</td>
	 			<th width="10%">监管人员：</th>
	 			<td colspan="3">
		 			${culpritSupervisor.accountName}${culpritSupervisor.assistantName}
	 			</td>
	 		</tr>
	 	</table>
	 </div>
<script type="text/javascript">
var zjlx='${culprit.dicZjlxKey}';
$(function(){
	//根据证件类型设置证件号码的值
	if(zjlx==86001){
		$('#identificationNum').val('${culprit.cedentialsNumber}');
	}else if(zjlx==86002){
		$('#identificationNum').val('${culprit.passportNum}');
	}else if(zjlx==86003){
		$('#identificationNum').val('${culprit.returnCardNum}');
	}else if(zjlx==86004){
		$('#identificationNum').val('${culprit.compatriotsCardNum}');
	}
	//返回监管人员姓名
	
});

function formatSex(value,row,index){
	if(value==10001){
		return '男';
	}else{
		return '女';
	}
}
function formatYpxf(value,row,index){
	if(value){
		return sy.getDicValue('culpritJudgment', 'dicYpxfKey',value, '') 
	}else{
		return value;
	}
}
</script>


