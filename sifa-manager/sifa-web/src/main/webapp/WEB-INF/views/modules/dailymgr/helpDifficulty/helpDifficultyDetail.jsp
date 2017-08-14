<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
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
                    <td>${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'') }</td>
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
                    <td>${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'') } </td>
                </tr>
                
                 <tr>
                    <td>婚姻状况:</td>
                   
                    <td> ${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'') }</td>
                     <td>职业:</td>
                    <td>${culprit.job }</td>
                     <td>原政治面貌:</td>
                    <td>${culprit.dicYzzmmKey }</td>
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td>${culprit.origin }</td>
                     <td>户籍所在地:</td>
                    <td>${culprit.regResidenceStreet }</td>
                     <td>现居住地:</td>
                    <td>${culprit.addressDetail }</td>
                </tr>
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
    
   
     <div class="easyui-panel" id="p2" title="帮困解难信息" style="width:100%;padding:10px;">
            <table width="100%">
				<tr>
                   <td>姓名:</td>
					<td>${helpDifficulty.culpritName} </td>
                    <td>解决与否:</td>
					<td>${helpDifficulty.dicSolveStatusKey}</td>
					<td>解决方式:</td>
					<td>${helpDifficulty.dicSolveTypeKey}</td>
                </tr>
                <tr>
                     <td>解决时间</td>
					<td><fmt:formatDate value="${helpDifficulty.solveDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <td>帮困解难单位:</td>
					<td>${helpDifficulty.solveUnit}</td>
					<td>困难情况纪录:</td>
					<td>${helpDifficulty.description}</td>
                </tr>
                <tr>
                    <td>备注:</td>
					<td ><input class="easyui-textbox" data-options="multiline:true" value=${helpDifficulty.note} style="width:300px"></td>
                </tr>
            </table>
    </div>

</body>
</html>
