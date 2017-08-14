<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>审前调查</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>

	 <div class="easyui-panel" id="p1" title="被调查对象基本信息" style="width:100%;padding:10px;">
     		<form id="myform" action="">
					<input type="hidden" id="id" name="id" value="${investigate.id}" />
					<input type="hidden" name="taskId" value="${investigate.taskId}"/>
					<input type="hidden" name="auditType" value="${investigate.auditType}"/>
     		</form>
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">姓名:</td>
                    <td>${investigate.name}</td>
                    <td width="15%">性别:</td>
                    <td>${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }</td>
                    <td width="15%">民族:</td>
                    <td>${investigate.nation }</td>
                </tr>
                <tr>
                    <td>曾用名:</td>
                    <td>${investigate.oldName }</td>
                    <td>别名:</td>
                    <td>${investigate.alias }</td>
                    <td>相关证件号:</td>
                    <td>${investigate.relevantNumber }</td>
                </tr>
                <tr>
                    <td>出生日期:</td>
                    <td><fmt:formatDate value="${investigate.bornDate}" pattern="yyyy-MM-dd" /></td>
                    <td>籍贯:</td>
                    <td>${investigate.origin }</td>
                    <td>家庭住址:</td>
                    <td>${investigate.address }</td>
                </tr>
                 <tr>
                    <td>联系方式:</td>
                    <td>${investigate.contactPhone }</td>
                    <td>案由:</td>
                    <td>${investigate.crimeReason }</td>
                    <td>经常居住地:</td>
                    <td>${investigate.habitualResidence }</td>
                </tr>
                 <tr>
                    <td>职业:</td>
                    <td>${investigate.job }</td>
                    <td>拟提请类型:</td>
                    <td>${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', investigate.entrustTypeId, '') }
					</td>
                    <td>户籍类型:</td>
                    <td>${fns:getSysDicValueByKey('common_table', 'hklx', investigate.dicResudenceKey, '') }
					</td>
                </tr>
                <tr>
                    <td>调查开始时间:</td>
                    <td><fmt:formatDate value="${investigate.begTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <td>调查结束时间:</td>
                    <td><fmt:formatDate value="${investigate.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
               
            </table>
           
    </div>
    
   
     <div class="easyui-panel" id="p2" title="家庭背景" style="width:100%;padding:10px;">
            <table width="100%" style="text-align: center;">
                <tr>
                	<td width="15%">家庭成员与调查对象相处情况:</td>
					<td colspan="5" width="85%">${investigate.familySituation}</td>
                </tr>
                <tr>
                    <td>家庭经济状况:</td>
					<td colspan="5">${investigate.economicStatus}</td>
                </tr>
                <tr>
                    <td>未成年对象的其他情况:</td>
					<td colspan="5">${investigate.minorOtherCases}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="个性特点" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">生理状况:</td>
					<td width="35%">${investigate.physiConditions}</td>
                    <td width="15%">心理特征:</td>
					<td width="35%">${investigate.psychFeature}</td>
                </tr>
                <tr>
                    <td>性格类型:</td>
					<td>${investigate.mettleType}</td>
                    <td>爱好特长:</td>
					<td>${investigate.hobbies}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="犯罪前表现" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">工作(学习)表现:</td>
					<td width="35%">${investigate.display}</td>
                    <td width="15%">业余生活:</td>
					<td width="35%">${investigate.amateurLife}</td>
                </tr>
                <tr>
                    <td>邻里关系:</td>
					<td>${investigate.neighborhoodRelations}</td>
                    <td>社会交往:</td>
					<td>${investigate.socialInteraction}</td>
                </tr>
                <tr>
                    <td>违纪违法情况:</td>
					<td>${investigate.badFact}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="悔罪表现" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">对犯罪行为的认识:</td>
					<td width="35%">${investigate.crimeAcquaint}</td>
                    <td width="15%">悔过态度:</td>
					<td width="35%">${investigate.repentantAttitude}</td>
                </tr>
                <tr>
                    <td>罚金刑履行情况及履行能力:</td>
					<td>${investigate.fineFulfillAbility}</td>
                    <td>附带民事赔偿履行情况及履行能力:</td>
					<td>${investigate.reparationFulfillAbility}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="社会反响" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">被害人或其亲属态度:</td>
					<td width="35%">${investigate.victimAttitude}</td>
                    <td width="15%">社会公众态度:</td>
					<td width="35%">${investigate.publicAttitude}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="质量评定" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">生理状况:</td>
					<td width="35%">${investigate.physiConditions}</td>
                    <td width="15%">心理特征:</td>
					<td width="35%">${investigate.psychFeature}</td>
                </tr>
                <tr>
                    <td>性格类型:</td>
					<td>${investigate.mettleType}</td>
                    <td>爱好特长:</td>
					<td>${investigate.hobbies}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="监管条件" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">家庭成员态度:</td>
					<td width="35%">${investigate.familyAttitude}</td>
                    <td width="15%">生活环境:</td>
					<td width="35%">${investigate.lifeEnvironment}</td>
                </tr>
                <tr>
                    <td>村（居、社区）基层组织意见:</td>
					<td colspan="3">${investigate.basicView}</td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="公安派出所意见" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                    <td width="15%">公安派出所意见:</td>
					<td>${investigate.policeView}</td>
                </tr>
            </table>
    </div>
    
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                   <td width="20%">操作人</td>
                   <td width="20%">操作时间</td>
                   <td width="20%">审批环节</td>
                   <td width="20%">意见</td>
                   <td width="20%">备注</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.dicDecideType == '1'?'符合监管条件，同意接收':'不符合监管条件，拒绝接收'}</td>
                   <td>${processDetail.opinion}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
    <div style="text-align: center;">
    <c:if test="${sysAccount.roleId == '2007' && investigate.auditType == 'workerPrint'}">
    <a href="#" class="easyui-linkbutton" onclick="doPrint()">打印</a>
    </c:if>
    <a href="#" class="easyui-linkbutton" onclick="doClose()">关闭</a>
    </diV>


<script type="text/javascript">
var type = 1;
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}


function doPrint(){
	console.log("测试打印,结束流程");
	
	$.ajax({
		type : 'post',
		url : '${ctx}/investigate/investigateAudit?type=' + type,
		data : $('#myform').serialize(),
		dataType : 'json',
		success : function(result) {
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});

			doClose();
		},
		error : function(result) {
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});
		}
	});
	
}

</script>
</body>
</html>
