<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
    <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview_jbxx(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('jbxx_PrintMsg'));
    LODOP.PRINT_INIT("社区服刑人员基本信息表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,15,"80%","100%",$('#jbxxPrint').html());
    LODOP.ADD_PRINT_TEXT(1070, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
    LODOP.NewPage();
    LODOP.ADD_PRINT_HTM(30,15,"80%","100%",$('#twoPagePrintContent').html()); 
}
</script>	
		
<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div  style="text-align:center;margin-top:10px;display: none">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="jbxxBtn" onclick="preview_jbxx()">打印当前页</a> 
		</div>
		<div id="jbxx_PrintMsg"></div>
		<div id="jbxxPrint">
			<div  style="font-family:FangSong_GB2312;font-size:19px;
			margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;text-align: center;">
			<div style="font-family:SimSun;font-size:24px;text-align: center;width: 680px;">
				<b>社区服刑人员基本信息表</b>
			</div>
			<div style="margin-top:20px;text-align:left;float:left;font-size:16px;">
				单位：${culprit.groupName }
			</div>
			<div style="margin-top:20px;text-align:left;margin-left:50px;float:left;font-size:16px;">
				编号：${culprit.no }
			</div>
			<div style="margin-top:20px;text-align:right;float:right;font-size:16px;">
				填表日期：<fmt:formatDate value="${nowDate }" pattern="yyyy年MM月dd日" />
			</div>
			<table border=0 cellspacing=0 cellpadding=0 
				style="margin-top:2px;border:0;width: 680px;font-size:16px;border:1px solid;">
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;padding: 0;">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							姓&nbsp;名
							</span>
						</div>
						<div style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.name }
							</span>
						</div>
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								曾用名
							</span>
						</div>
						<div style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.alias }
							</span>
						</div>
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								身份证<br/>号&nbsp;码
							</span>
						</div>
						<div style="width:174px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.identification }
							</span>
						</div>
					</td>
					<td rowspan="4" style="border-bottom:1px solid;">
						<div style="border-right:0;border-bottom:0;display:table; float: left; text-align: center;line-height: 150%;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px;padding: 0;">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								性&nbsp;别
							</span>
						</div>
						<div  style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}
							</span>
						</div>
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								民&nbsp;族
							</span>
						</div>
						<div  style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}
							</span>
						</div>
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								出&nbsp;生<br/>年月日
							</span>
						</div>
						<div style="width:174px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							文化<br/>程度
							</span>
						</div>
						<div  style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}
							</span>
						</div>
						<div  style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								健康<br/>状况
							</span>
						</div>
						<div style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('common_table','dicHealthyStatusKey',culprit.dicHealthyStatusKey,'')}
							</span>
						</div>
						<div  style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								原政治<br/>面&nbsp;貌
							</span>
						</div>
						<div style="width:174px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
									${fns:getSysDicValueByKey('common_table','zzmm',culprit.dicYzzmmKey,'')}
							</span>
						</div>

					</td>
				</tr>
				<tr>
					<td style="border-bottom:0;border-right:0;width:550px">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							婚姻<br/>状况
							</span>
						</div>
						<div  style="width:80px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'')}
							</span>
						</div>
						<div  style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								联系<br/>电话
							</span>
						</div>
						<div style="width:326px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.contactPhone }
							</span>
						</div>
					</td>
				</tr>
				
				
				
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:151px;height:50px;display:table; float: left;border-right: 1px solid; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								居&nbsp;住&nbsp;地
							</span>
						</div>
						<div style="width:526px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.address }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:151px;height:50px;display:table; float: left; border-right: 1px solid;text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								户&nbsp;籍&nbsp;地
							</span>
						</div>
						<div  style="width:526px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.regResidence }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div  style="width:151px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								所在工作单位<br/>（学校）
							</span>
						</div>
						<div style="width:220px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.newJob }
							</span>
						</div>
						<div  style="width:100px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								单位（学校）<br/>联系电话
							</span>
						</div>
						<div style="width:204px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.jobPhone }
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div  style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								罪&nbsp;名
							</span>
						</div>
						<div style="width:150px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.culpritJudgment.crimeInfo}
							</span>
						</div>
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								刑&nbsp;种
							</span>
						</div>
						<div style="width:143px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}
							</span>
						</div>
						<div  style="width:100px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								原判<br/>刑期
							</span>
						</div>
						<div style="width:140px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.culpritJudgment.adjudgePeriod}
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								社区矫正决定机关
							</span>
						</div>
						<div  style="width:221px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							${culprit.culpritJudgment.adjudgeRedressOrg}
							</span>
						</div>
						<div  style="width:143px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								原羁押场所
							</span>
						</div>
						<div  style="width:240px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.culpritJudgment.detainPlace}
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div  style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								禁止令<br/>内容
							</span>
						</div>
						<div  style="width:221px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							${culprit.culpritJudgment.contentBan}
							</span>
						</div>
						<div  style="width:143px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								禁止期限<br/>起止日
							</span>
						</div>
						<div  style="width:240px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<fmt:formatDate value='${culprit.culpritJudgment.startBan}' pattern='yyyy年MM月dd日'/>至<fmt:formatDate value='${ culpritJudgment.endBan}' pattern='yyyy-MM-dd'/>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								矫正<br/>类别
							</span>
						</div>
						<div  style="width:150px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
							${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}
							</span>
						</div>
						<div style="width:70px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								矫正<br/>期限
							</span>
						</div>
						<div style="width:143px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.culpritJudgment.redressPeriod}月
							</span>
						</div>
						<div  style="width:100px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								起止日
							</span>
						</div>
						<div  style="width:140px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
									pattern="yyyy年MM月dd日" />至
									<fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
									pattern="yyyy年MM月dd日" />
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div  style="width:70px;height:75px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								法律文书收到时间及种类
							</span>
						</div>
						<div  style="width:221px;height:75px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<fmt:formatDate value="${culpritLaw.created}" pattern="yyyy年MM月dd日" />
								<br/>
								${fns:getSysDicValueByKey('sf_culpritLaw','dicWslxKey',culpritLaw.dicWslxKey,'')}
							</span>
						</div>
						<div style="width:143px;height:75px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								接收方式<br/>及<br/>报到时间
							</span>
						</div>
						<div  style="width:240px;height:75px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								${fns:getSysDicValueByKey('culprit_judgment','dicReceiveTypeKey',culprit.culpritJudgment.dicReceiveTypeKey,'')}<br/>
								<fmt:formatDate value="${culpritLaw.created}" pattern="yyyy年MM月dd日" />
								
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:70px;height:50px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								在规定时限内报到
							</span>
						</div>
						<div  style="width:150px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<c:if test="${culprit.createdTime <= culprit.culpritJudgment.limitDate}">是</c:if>
								<c:if test="${culprit.createdTime > culprit.culpritJudgment.limitDate}">否</c:if>
							</span>
						</div>
						<div style="width:70px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								超出规定时限报到
							</span>
						</div>
						<div  style="width:143px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<c:if test="${culprit.createdTime <= culprit.culpritJudgment.limitDate}">否</c:if>
								<c:if test="${culprit.createdTime > culprit.culpritJudgment.limitDate}">是</c:if>
							</span>
						</div>
						<div style="width:100px;height:50px;border-right:1px solid;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								未报到且下落不明
							</span>
						</div>
						<div  style="width:140px;height:50px;border-right:0;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								<c:if test="${culprit.createdTime == ''}">是</c:if>
								<c:if test="${culprit.createdTime != ''}">否</c:if>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;border-bottom:0;">
						<div style="width:70px;height:220px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								主要犯罪事实
							</span>
						</div>
						<div  style="width:602px;height:220px;display:table; float: left; text-align: center;line-height: 150%;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culprit.culpritJudgment.crimeFact}
							</span>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div id="twoPagePrintContent" >
		<div  style="font-family:FangSong_GB2312;font-size:19px;
			margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;text-align: center;margin-top:300px;">
			
			<table border=0 cellspacing=0 cellpadding=0 
				style="margin-top:2px;border:0;width: 680px;font-size:16px;border:1px solid;">
				<tr>
					<td colspan="2" style="border-right:0;border-bottom:0;">
						<div style="width:70px;height:250px;display:table; float: left; text-align: center;line-height: 150%;border-bottom:1px solid;border-right: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								既往违法犯罪记录
							</span>
						</div>
						<div  style="width:607px;height:250px;display:table; float: left; text-align: center;line-height: 150%;border-bottom:1px solid;font-size:16px;">
							<span style=" display:table-cell; vertical-align:middle;">
								${culpritLaw.oldAdministrationRecord}<br/>${culpritLaw.oldPenalRecord}
							</span>
						</div>
					</td>
				</tr>
				<tr >
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:70px;height:286px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								 个<br/>人<br/>简<br>历<br>
							</span>
						</div>
						<div style="width:150px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								起止时间
							</span>
						</div>
						<div style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								所在单位
							</span>
						</div>
						<div style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								职&nbsp;务
							</span>
						</div>
						<c:forEach items ="${culpritResumeList}" var = "culpritResume" >
							<div  style="width:150px;height:40px;display:table; float: left;font-size:10px; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									${culpritResume.startTime}至${culpritResume.endTime}
								</span>
							</div>
							<div  style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									${culpritResume.org}
								</span>
							</div>
							<div style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									 ${culpritResume.role}
								</span>
							</div>
						</c:forEach>
						<c:if test="${fn:length(culpritResumeList)<5}">
							<c:forEach begin="0" end="${5-fn:length(culpritResumeList)}" var="list">
								<div  style="width:150px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
								<div  style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
								<div  style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										 
									</span>
								</div>
							</c:forEach>
						</c:if>		
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;">
						<div style="width:70px;height:327px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								家庭成员及主要社会关系
							</span>
						</div>
						<div style="width:74px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								姓&nbsp;名
							</span>
						</div>
						<div  style="width:75px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								关&nbsp;系
							</span>
						</div>
						<div style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								工作单位或家庭住址
							</span>
						</div>
						<div  style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
							<span style="display:table-cell; vertical-align:middle;">
								联系电话
							</span>
						</div>
						<c:forEach items ="${culpritFamilyList}" var = "culpritFamily" >
							<div  style="width:74px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									${culpritFamily.name}
								</span>
							</div>
							<div  style="width:75px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									${fns:getSysDicValueByKey('sf_investigate_family','dic_relation_key',culpritFamily.dicRelationKey,'')}
								</span>
							</div>
							<div style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									<c:if test="${culpritFamily.org != ''}">
										${culpritFamily.org}
									</c:if>
									<c:if test="${culpritFamily.org == ''}">
										${culpritFamily.address}
									</c:if>
								</span>
							</div>
							<div  style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
								<span style="display:table-cell; vertical-align:middle;">
									${culpritFamily.phone}
								</span>
							</div>
						</c:forEach>
						<c:if test="${fn:length(culpritFamilyList)<7}">
							<c:forEach begin="0" end="${6-fn:length(culpritFamilyList)}" var="list">
								<div  style="width:74px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
								<div  style="width:75px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
								<div  style="width:330px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
								<div  style="width:125px;height:40px;display:table; float: left; text-align: center;line-height: 150%;border-bottom: 1px solid;">
									<span style="display:table-cell; vertical-align:middle;">
										
									</span>
								</div>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0;border-right:0;width:550px;">
						<div  style="width:70px;height:140px;display:table; float: left; text-align: center;line-height: 150%;border-right: 1px solid;">
							<span style=" display:table-cell; vertical-align:middle;">
								备注
							</span>
						</div>
						<div  style="width:602px;height:140px;display:table; float: left; text-align: center;line-height: 150%;">
							<span style=" display:table-cell; vertical-align:middle;">
								
							</span>
						</div>
					</td>
				</tr>
			</table>
			<div style="font-family:FangSong_GB2312;font-size:15px">注：此表一式三份，司法局、司法所各存档一份，抄送居住地公安（分）局一份。</div>
		</div>
		
		</div>	
	</div>
