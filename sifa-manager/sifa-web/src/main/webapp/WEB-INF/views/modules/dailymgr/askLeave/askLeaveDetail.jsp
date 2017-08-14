<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
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
    
   
     <div class="easyui-panel" id="p2" title="请假信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td width="10%">申请日期</td>
							<td><fmt:formatDate value="${askLeave.doDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td width="10%">外出目的地</td>
							<td>${askLeave.place }</td>
							<td width="10%">经手人</td>
							<td>${askLeave.approvePerson }</td>
                </tr>
                <tr>
                    <td>请假开始时间</td>
							<td><fmt:formatDate value="${askLeave.beginDate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>请假截止时间</td>
							<td><fmt:formatDate value="${askLeave.endDate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>请假理由</td>
							<td>${askLeave.reason }</td>
                </tr>
                <tr>
                    <td>活动范围</td>
							<td colspan="5">${askLeave.activeArea }</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="被访问者基本信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                    <td width="10%">被访问者姓名</td>
							<td>${askLeave.askName }</td>
							<td width="10%">与矫正人关系</td>
							<td>${askLeave.relation }</td>
					<td width="10%">职业及工作单位</td>
							<td>${askLeave.job }</td>
                </tr>
                <tr>
                   <td>政治面貌</td>
							<td>${askLeave.dicPoliticStatusKey }</td>
				<td>家庭住址</td>
							<td colspan="3">${askLeave.askAddress }</td>
				
                </tr>
                
            </table>
    </div>
    
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                   <td>操作人</td>
                   <td>操作时间</td>
                   <td>审批环节</td>
                   <td>意见</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.dicDecideType }</td>
                 
                </tr>
                 </c:forEach>
                
            </table>
    </div>
    <a href="#" class="easyui-linkbutton" onclick="javascript:$('#p').panel('open')">关闭</a>
</body>
</html>
