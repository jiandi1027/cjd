<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学习教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
<body>
 <form  action="${ctx}/dailymgr/study/save" method="post" id="culpritInfo">

     <div class="easyui-panel" title="学习教育" style="width:100%;padding:10px;">
            <table width="100%">

                <tr>
                    <td>学习内容:</td>
							<td>${study.studyContent}</td>
							<td>学习形式:</td>
							<td>${fns:getSysDicValueByKey('SF_STUDY','DIC_STUDY_TYPE_KEY',study.dicStudyTypeKey,'')}</td>
					<td>学习时间:</td>
							<td><fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                
                <tr>
                    <td>学习时长:</td>
							<td>${study.studyTime}</td>
							<td>考核人:</td>
							<td>${study.assessManager}</td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td colspan="5" align="left">${study.note}</td>
                </tr>
                <tr>
            </table>
            </div>
            <div class="easyui-panel" title="矫正人员表现" style="width:100%;padding:10px;">
            <table width="100%">
             	
                <tr>
                    <td>优秀:</td>
							<td><c:forEach items="${study.excellentList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <td>良好:</td>
							<td><c:forEach items="${study.goodList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <td>一般:</td>
							<td><c:forEach items="${study.commonlyList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
				<tr>
                    <td>差:</td>
							<td><c:forEach items="${study.differenceList}" var="culprit">
							${culprit.culpritName}&nbsp;
						</c:forEach></td>
				</tr>
                <tr>
                <td align="center" colspan="2">
                	<a id="btn2" class="easyui-linkbutton">关闭</a>
                </td>
                </tr>
            </table>
    </div>
    </form>
    <script>
    $('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
