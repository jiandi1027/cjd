<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<div id="swtzsPrintPage">
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.page-form {
	margin: 0 auto;
	padding: 47px;
	font-family: '仿宋_GB2312';
}

.page-form h1 {
	font-size: 12px;
	font-weight: normal;
	font-family: '宋体';
	text-align: center;
	padding: 15px 0;
}

.page-form ul, .page-form li {
	list-style: none;
}

.page-form li span {
	border-bottom: 1px solid #333;
}

.page-form em {
	font-style: normal;
}
.page-form ul {  line-height:23px;  } 
</style>
	<div id="death_PrintMsg"></div>
	<object id="LODOP_OB"
		classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
		<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>
	<div style="display: none;">
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'fi-print icon-blue'" id="deathPrintBtn1">打印当前页</a>
	</div>
	
	<div class="page-form">
		<div class="page-wrap">
			<table width="990px" border="0" cellspacing="0" cellpadding="0"
				style="border-collapse:separate;border-spacing:30px;border-collapse: collapse;">
				<tr>
					<td width="300px" style="border: 1px solid #000;" valign="top">
				
						<div
							style="padding: 0 10px; text-align: center; padding-bottom: 15px;">
							<br><b>社区服刑人员死亡通知书</b><br>（存根）<br><br>（&nbsp;） 字第&nbsp;&nbsp;&nbsp;&nbsp;号</div>
						<div style="padding: 0 10px 10px 10px;">
							<ul>
								<li>姓名<span>&nbsp;${culprit.name}&nbsp;</span>性别<span>&nbsp;${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}&nbsp;</span></li>
								<li>出生日期<span>&nbsp;<fmt:formatDate
											value="${culprit.birthday}" pattern="yyyy年MM月dd日" />&nbsp;
								</span></li>
								<li>身份证号码<span>${culprit.identification}</span></li>
								<li>居住地<span>&nbsp;${culprit.address}&nbsp;</span></li>
								<li>户籍地<span>&nbsp;${culprit.regResidence }&nbsp;</span></li>
								<li>罪名<span>&nbsp;${culprit.crimeInfo}&nbsp;</span></li>
								<li>原判刑罚<span>&nbsp;${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}&nbsp;</span></li>
								<li>原判刑期<span>&nbsp;${culprit.culpritJudgment.adjudgePeriod}&nbsp;</span></li>
								<li>矫正类别<span>&nbsp;${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}&nbsp;</span></li>
								<li>社区矫正期限<span><fmt:formatDate
											value="${culprit.redressStartDate}" pattern="yyyy" />年<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="M" />月<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="d" />日起<fmt:formatDate
											value="${culprit.redressEndDate}" pattern="yyyy" />年<fmt:formatDate
											value="${culprit.redressEndDate}" pattern="M" />月<fmt:formatDate
											value="${culprit.redressEndDate}" pattern="d" /></span>日止。
								</li>
								<li>执行机关 <span style="display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
								<li>死亡时间及原因<span>&nbsp;${shijian[0]}年${shijian[1]}月${shijian[2]}日,${death.deathReason}&nbsp;</span>
								</li>

								<li>发往机关<span style="display: inline-block; width: 130px;">&nbsp;</span>
								</li>
								<li>&nbsp;</li>
								
								<li>填发人<span style="display: inline-block;">&nbsp;${sysAccount.accountname}&nbsp;</span></li>
								<li>批准人<span style="display: inline-block; width: 50px;">&nbsp;</span></li>
								<li>&nbsp;</li>
								
								<li>填发日期<span>&nbsp;${nowtime[0]}&nbsp;</span>年<span>&nbsp;${nowtime[1]}&nbsp;</span>月<span>&nbsp;${nowtime[2]}&nbsp;</span>日</li>
							<li>&nbsp;</li>
								
							</ul>
						</div>
					</td>

					<td style="border: 1px solid #000;" valign="top" width="40px"></td>

					<td width="300px" style="border: 1px solid #000;" valign="top">
							<div
							style="padding: 0 10px; text-align: center; padding-bottom: 15px;">
							<br><b>社区服刑人员死亡通知书</b><br><br><br>（&nbsp;） 字第&nbsp;&nbsp;&nbsp;&nbsp;号</div>
						<div style="padding: 0 10px 10px 10px;">
							<ul>
								<li><span style="display: inline-block; width: 130px;">&nbsp;</span>:</li>
								<li>社区服刑人员<span>&nbsp;${culprit.name}&nbsp;</span>,<span>&nbsp;${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}&nbsp;</span></li>
								<li>身份证号码<span>${culprit.identification}</span></li>
								<li>居住地<span>&nbsp;${culprit.address}&nbsp;</span></li>
								<li>户籍地<span>&nbsp;${culprit.regResidence }&nbsp;</span></li>
								<li>因犯<span>&nbsp;${culprit.crimeInfo}&nbsp;</span>于<span>&nbsp;<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="yyyy" />年<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="M" />月<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="d" />日&nbsp;
								</span>被<span>&nbsp;${culpritJudgment.adjudgeOrg}&nbsp;</span> 人民法院判处<span>&nbsp;${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', culpritJudgment.dicYpxfKey, '') }&nbsp;</span>。依据（人民法院、公安局、监狱管理局）号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，被依法实行社区矫正。
									因<span>&nbsp;${death.deathReason}&nbsp;</span>于<span
									style="display: inline-block;">&nbsp;${shijian[0]}年${shijian[1]}月${shijian[2]}日&nbsp;</span>死亡。
								</li>
								<li>&nbsp;</li>
								
								<li>特此通知。</li>


								<li>&nbsp;</li>


								<li>&nbsp;</li>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(公章)</li>

								<li>&nbsp;</li>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>&nbsp;${nowtime[0]}&nbsp;</span>年<span>&nbsp;${nowtime[1]}&nbsp;</span>月<span>&nbsp;${nowtime[2]}&nbsp;</span>日</li></li>
							</ul>
						</div>
					</td>

					<td style="border: 1px solid #000;" valign="top" width="40px"></td>

					<td width="300px" style="border: 1px solid #000;" valign="top">
							<div
							style="padding: 0 10px; text-align: center; padding-bottom: 15px;">
							<br><b>社区服刑人员死亡通知书</b><br><br><br>（&nbsp;） 字第&nbsp;&nbsp;&nbsp;&nbsp;号</div>
						<div style="padding: 0 10px 10px 10px;">
							<ul >
								<li style="line-height:23px; " ><span style="display: inline-block; width: 130px;">&nbsp;</span>:</li>
								<li>社区服刑人员<span>&nbsp;${culprit.name}&nbsp;</span>,<span>&nbsp;${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}&nbsp;</span></li>
								<li>身份证号码<span>${culprit.identification}</span></li>
								<li>居住地<span>&nbsp;${culprit.address}&nbsp;</span></li>
								<li>户籍地<span>&nbsp;${culprit.regResidence }&nbsp;</span></li>
								<li>因犯<span>&nbsp;${culprit.crimeInfo}&nbsp;</span>于<span>&nbsp;<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="yyyy" />年<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="M" />月<fmt:formatDate
											value="${culprit.redressStartDate}" pattern="d" />日&nbsp;
								</span>被<span>&nbsp;${culpritJudgment.adjudgeOrg}&nbsp;</span> 人民法院判处<span>&nbsp;${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', culpritJudgment.dicYpxfKey, '') }&nbsp;</span>。依据（人民法院、公安局、监狱管理局）号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，被依法实行社区矫正。
									因<span>&nbsp;${death.deathReason}&nbsp;</span>于<span
									style="display: inline-block;">&nbsp;${shijian[0]}年${shijian[1]}月${shijian[2]}日&nbsp;</span>死亡。
								</li>
								<li>&nbsp;</li>
								
								<li>特此通知。</li>



								<li>&nbsp;</li>


								<li>&nbsp;</li>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(公章)</li>

								<li>&nbsp;</li>
								<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>&nbsp;${nowtime[0]}&nbsp;</span>年<span>&nbsp;${nowtime[1]}&nbsp;</span>月<span>&nbsp;${nowtime[2]}&nbsp;</span>日</li></li>
					</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	var LODOP; //声明为全局变量 
	$(function()
	{
		$('#deathPrintBtn1').click(function()
		{
			CreatePrintPage();
			LODOP.PREVIEW();
		});
	});
	//创建打印页面
	function CreatePrintPage()
	{
		LODOP = getLodop(document.getElementById('LODOP_OB'), document
				.getElementById('LODOP_EM'), document
				.getElementById('death_PrintMsg'));
		LODOP.PRINT_INIT("打印社服服刑人员死亡通知书");

		LODOP.SET_PRINT_STYLE("FontSize", 13);
		LODOP.SET_PRINT_STYLE("Angle", -90);
		LODOP.ADD_PRINT_TEXT(100, 380, 650, 120,
				"------------------------(2017)字第  号------------------------");
		LODOP.ADD_PRINT_TEXT(100, 722, 650, 120,
				"------------------------(2017)字第  号------------------------");

		//设置打印纸张大小，1代表纵向打印
		LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
		LODOP.ADD_PRINT_HTM(0,0, 0, "100%", $('#swtzsPrintPage').html());

		//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
		//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
		//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
		//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
		LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	}
</script>
