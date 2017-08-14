<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 打印的内容 -->
<div id="swdebPrintPage">
	<style>
.biaoti {
	font-size: 30px;
	font-weight: bold;
	font-family: '黑体';
	text-align: center;
}
</style>

	<!-- 打印界面 -->
	<div id="redressStop_PrintMsgtwo"></div>
	<!-- 打印按钮 -->
	<a href="#" style="display: none;" class="easyui-linkbutton"
		data-options="iconCls:'fi-print icon-blue'" id="redressStopPrintBtn1"></a>

	<div style="height: 65px"></div>

	<div class="biaoti">社区矫正人员脱逃、下落不明及死亡情况登记表</div>
	<div style=" margin: 20px 40px 20px 40px">
		<table width="100%"
			style=" margin: 0 auto;width: 670px; border-collapse: collapse; border-spacing: 0;border-bottom:2px solid;border-left: 2px solid;border-right: 2px solid; border-top: 2px solid; text-align: center;">
			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">姓名</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="11" width="11%">&nbsp;${culprit.name}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="8" width="8%">曾用名</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="12" width="12%">&nbsp;${culprit.alias}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="8" width="8%">性别</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="12" width="12%">&nbsp;${fns:getSysDicValueByKey('common_table', 'sex', culprit.dicSexKey, '') }</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="10" width="10%">身份<br>证号
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="30" width="30%">&nbsp;${culprit.identification}</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">民族</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="11" width="11%">&nbsp;${culprit.nation}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="8" width="8%">出生<br>日期
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="16" width="16%">&nbsp;<fmt:formatDate value="${culprit.birthday}"
								pattern="yyyy年MM月dd日" /></td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="8" width="10%">文化<br>程度
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="12" width="10%">&nbsp;${fns:getSysDicValueByKey('common_table', 'whcd', culprit.dicWhcdKey, '') }</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="8" width="10%">婚姻<br>状况
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="28" width="10%">&nbsp;${fns:getSysDicValueByKey('common_table', 'hyzk', culprit.dicHyzkKey, '') }</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">职业</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="19" width="19%">&nbsp;${culprit.job}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="16" width="16%">原政治<br>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;貌
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="56" width="56%">&nbsp;${culprit.dicXzzmmKey}</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">籍贯</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="11" width="11%">&nbsp;${culprit.origin}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="16" width="16%">户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍<br>所在地
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="64" width="64%">&nbsp;${culprit.regResidence}</td>
			</tr>
			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">现居<br>住地
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="91" width="91%">&nbsp;${culprit.address}</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="9" width="9%" height:70px>原判<br>罪名
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="14" width="14%">&nbsp;${culprit.crimeInfo}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="15" width="15%">刑期</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="15" width="15%">&nbsp;${culpritJudgment.adjudgePeriod}</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="15" width="15%">刑期起止<br>时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间
				</td>
				<td
					style="border-right: 1px solid; border-bottom: 1px solid; height: 35px"
					colspan="32" width="32%">&nbsp;自&nbsp;<fmt:formatDate
								value="${culpritJudgment.adjudgeStartTime }" pattern="yyyy年MM月dd日" />&nbsp;起</td>
			</tr>
			<tr>
				<td
					style="border-right: 1px solid; border-bottom: 1px solid; height: 35px"
					colspan="32" width="32%">&nbsp;至&nbsp;<fmt:formatDate
								value="${culpritJudgment.adjudgeEndTime }" pattern="yyyy年MM月dd日" />&nbsp;止</td>
			</tr>

			<tr style="height: 50px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">附加刑</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="14" width="14%">&nbsp;${culpritJudgment.accessoryPunishment }</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="15" width="15%">刑期变动</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="62" width="62%">&nbsp;${culpritJudgment.adjudgeChange }</td>
			</tr>
			
			<tr >
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2" colspan="9" width="9%">社区矫正<br>期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限
				</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;height:35px"
					colspan="44" width="44%">&nbsp;自&nbsp;<fmt:formatDate
								value="${culpritJudgment.redressStartDate }" pattern="yyyy年MM月dd日" />&nbsp;起</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2"colspan="15" width="15%">刑法执行<br>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td>
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					rowspan="2"colspan="32" width="32%">&nbsp;${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', culprit.dicPenalTypeKey, '') }</td>
			</tr>
			
			<tr style="height:35px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="44" width="44%">&nbsp;至&nbsp;<fmt:formatDate
								value="${culpritJudgment.redressEndDate }" pattern="yyyy年MM月dd日" />&nbsp;止</td>
			</tr>
			
			<tr style="height: 80px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">脱逃或下<br>落不明或<br>死亡时间</td>
				
				<td style="text-align:left;border-right: 1px solid; border-bottom: 1px solid;"
					colspan="91" width="91%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
								value="${redressStop.jjrq}" pattern="yyyy年MM月dd日" /></td>
			</tr>
			<tr style="height: 150px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">脱逃或下<br>落不明或<br>死亡原因</td>
				
				<td style="text-align:left;border-right: 1px solid; border-bottom: 1px solid;"
					colspan="91" width="91%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${redressStop.jjsm}</td>
			</tr>
			
			
			<tr style="height: 150px">
				<td style="border-right: 1px solid; border-bottom: 1px solid;"
					colspan="9" width="9%">采取何种<br>措施及处<br>理结果
				</td>
				<td style="text-align:left;border-right: 1px solid; border-bottom: 1px solid;"
					colspan="91" width="91%">
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${redressStop.measure}
					</div>
					<div style=" height:47px"></div>
					<div style="padding-left: 55%;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;(签名、盖章)</div>
					
					</td>

			</tr>
			
		</table>

	</div>


</div>




















<script type="text/javascript">
	var LODOP; //声明为全局变量 
	$(function()
	{
		$('#redressStopPrintBtn1').click(function()
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
				.getElementById('redressStop_PrintMsgtwo'));

		//设置打印纸张大小，1代表纵向打印
		LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
		LODOP.ADD_PRINT_HTM(0, 0, 0, "100%", $('#swdebPrintPage').html());

		//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
		//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
		//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
		//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
		LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	}
</script>