<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>撤销缓刑管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;text-align:center;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	 <div class="easyui-panel" id="p1" title="矫正对象基本信息" style="width:100%;padding:10px;">
            <table width="100%">
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
               
            </table>
    </div>
    
   
     <div class="easyui-panel" id="p2" title="申请相关信息" style="width:100%;padding:10px;">
            <table width="100%">
            	
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
					<td>申请原因：</td>
					<td colspan="7">${specialArea.reason }</td>
                </tr>
                <tr>
					<td>备注：</td>
					<td colspan="7">${specialArea.note }</td>
                </tr>
            </table>
    </div>
     <%-- <div class="easyui-panel" id="p2" title="质量评定" style="width:100%;padding:10px;">
            <table width="100%">
                <TBODY>				 
				   <TR>	
						<TD>矫正科输入质量评分：${revokeProbation.handleQualityGoal }</TD>
						<TD>矫正科执法质量评分：${revokeProbation.actionQualityGoal }</TD>
						<TD>法制科执法质量评分：${revokeProbation.actionQualityGoalF }</TD>
					</TR>
					
	                 <TR>	
						<TD >矫正处输入质量评分：${revokeProbation.cityHandleQualityGoal }</TD>
						<TD >矫正处执法质量评分：${revokeProbation.cityJactionQualityGoal }</TD>
						<TD>法制处执法质量评分：${revokeProbation.cityFactionQualityGoal }</TD>
					</TR>
				</TBODY>
            </table>
    </div> --%>
    
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                   <td width="15%">操作人</td>
                   <td width="15%">操作时间</td>
                   <td width="15%">审批环节</td>
                   <td width="20%">审批意见</td>
                   <td width="15%">审批结果</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.opinion }</td>
                   <td>${processDetail.dicDecideType }</td>
                 
                </tr>
                 </c:forEach>
            </table>
    </div>
    <div align="center">
  		<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="preSubmit('+${specialArea.id}+');">打印《社区矫正人员进入特定区域（场所）审批表 》</a>
  		&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    <a href="#" class="easyui-linkbutton" onclick="javascript:parent.location.reload();">返回</a>
    </div>
    
<script type="text/javascript">


//打印《社区矫正人员进入特定区域（场所）审批表 》
function preSubmit(id){
	var url = '${ctx}/dailymgr/specialArea/printShenhe?id=' + id;
	open_layer('打印《社区矫正人员进入特定区域（场所）审批表 》',url);
}

function open_layer(title,url){
	
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
</script>
</body>
</html>
