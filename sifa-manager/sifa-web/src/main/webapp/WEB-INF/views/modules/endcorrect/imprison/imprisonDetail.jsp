<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>收监执行详细</title>
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
                    <td>姓名</td>
                    <td colspan="5">${culprit.name }</td>
                </tr>
                <tr>
                    <td width="10%">性别</td>
                    <td>${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'') }</td>
                     <td width="10%">民族</td>
                    <td>${culprit.nation }</td>
                     <td width="10%">身份证号</td>
                    <td>${culprit.identification }</td>
                </tr>
                <tr>
                    <td>曾用名</td>
                    <td>${culprit.alias }</td>
                     <td>出生日期</td>
                    <td>${culprit.birthday }</td>
                     <td>文化程度</td>
                    <td>${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'') }</td>
                </tr>
                
                 <tr>
                    <td>婚姻状况</td>
                    <td>  
                    	${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'') }
                     
                  </td>
                     <td>职业</td>
                    <td>${culprit.job }</td>
                     <td>原政治面貌</td>
                    <td>${fns:getSysDicValueByKey('common_table','zzmm',culprit.dicYzzmmKey,'') }
                    </td>
                </tr>
                 <tr>
                    <td>籍贯</td>
                    <td>${culprit.origin }</td>
                     <td>户籍所在地</td>
                    <td>${culprit.regResidenceStreet }</td>
                     <td>现居住地</td>
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
                    <td>刑法执行类别</td>
                    <td></td>
                     <td>矫正开始时间</td>
                    <td><fmt:formatDate value="${culprit.redressStartDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                     <td>矫正结束时间</td>
                    <td><fmt:formatDate value="${culprit.redressEndDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
               
            </table>
           
    </div>
    
   
     <div class="easyui-panel" id="p2" title="收监执行相关信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td width="10%">收监类型</td>
                   <td width="10%">${fns:getSysDicValueByKey('comme_table','DIC_IMPRISON_TYPE_KEY',imprison.dicImprisonTypeKey,'') }</td>
					<td width="10%">裁定机关名称</td>
					<td width="10%">${imprison.judgeOrg }</td>
					<td width="10%">裁定结果</td>
					<td width="10%">${fns:getSysDicValueByKey('SF_IMPRISON','DIC_JUDGE_RESULT_KEY',imprison.dicJudgeResultKey,'') }</td>
                </tr>
                <tr>
                    <td>裁定时间</td>
					<td><fmt:formatDate value="${imprison.judgeTime }"
							pattern="yyyy-MM-dd" /></td>
					<td>收监时间</td>
					<td><fmt:formatDate value="${imprison.imprisonDate }"
									pattern="yyyy-MM-dd" /></td>
					<td>通报时间</td>
					<td><fmt:formatDate value="${imprison.reportDate }"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td>收监结果</td>
					<td>${fns:getSysDicValueByKey('SF_IMPRISON','IMPRISON_DEAL_RESULT',imprison.imprisonDealResult,'') }</td>
					<td>关押监狱</td>
					<td>${imprison.prisonName }</td>
					<td>通报公安机关</td>
					<td>${imprison.organizationName }</td>
                </tr>
                <tr>
                    <td>通报人</td>
					<td>${imprison.reportPersonName }</td>
					<td>不予收监理由</td>
					<td colspan="3">${imprison.opposeReason }</td>
					
                </tr>
                <tr>
                    <td>裁定材料</td>
					<td colspan="2">${imprison.judgePathName }</td>
					<td>驳回（拒收）材料</td>
					<td colspan="2">${imprison.endCasePathName }</td>
					
                </tr>
            </table>
    </div>
     
    
     <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                   <td width="15%">操作人</td>
                   <td width="15%">操作时间</td>
                   <td width="15%">审批环节</td>
                   <td width="10%">输入评分</td>
                   <td width="10%">执法评分</td>
                   <td width="20%">审批意见</td>
                   <td width="15%">审批结果</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.optScore }</td>
                   <td>${processDetail.zfScore }</td>
                   <td>${processDetail.opinion }</td>
                   <td>${processDetail.dicDecideType }</td>
                 
                </tr>
                 </c:forEach>
            </table>
    </div>
    <div align="center">
		<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="preJianYi('+${imprison.id}+');">打印《提请收监执行建议书》</a>
		&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
  		<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="preSubmit('+${imprison.id}+');">打印《提请收监执行审核表》</a>
  		&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    	<a href="#" class="easyui-linkbutton" onclick="javascript:parent.location.reload();">返回</a>
    </div>
<script type="text/javascript">
//打印《撤销缓刑建议书》
function preJianYi(id){
	var url = '${ctx}/endcorrect/imprison/printJianyi?id=' + id;//detail标记为详细页面，建议书不能修改
	open_layer('打印《提请收监执行建议书》',url);
}

//打印《撤销缓刑审批表》
function preSubmit(id){
	var url = '${ctx}/endcorrect/imprison/printShenhe?id=' + id;
	open_layer('打印《提请收监执行审核表》',url);
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
