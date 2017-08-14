<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
var LODOP; //声明为全局变量 
//打印当前页
function preview_imprison(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('imPrison_PrintMsg'));
LODOP.PRINT_INIT("打印收监执行建议书 ");
//设置打印纸张大小，1代表纵向打印
LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
LODOP.ADD_PRINT_HTM(40,60,"80%","100%",$('#imPrison_content').html());
/* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
}
</script>
	<div>
		<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printImprisonBookBtn1" onclick="preview_imprison()">打印当前页</a> 
		</div>
		<div id="imPrison_PrintMsg"></div>
		<div id="imPrison_content">
			<div style="font-family:FangSong_GB2312;font-size:19px;
			margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div  style="font-size:30px;margin-top:20px;text-align: center;font-weight: bold;">
				收监执行建议书 
			</div>
			<div style="font-size:19px;margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</div>
			<div style="font-size:19px;margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员：${culprit.name }，${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}，<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />出生，
				 居住地：${culprit.address }，
				户籍地：${culprit.regResidence }。
				 因${culprit.culpritJudgment.crimeInfo }经
				${culprit.culpritJudgment.adjudgeOrg }于
				<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate }" pattern="yyyy年MM月dd日" /> 
				以(${culprit.culpritJudgment.adjudgeId })&nbsp;&nbsp;&nbsp;&nbsp;字第&nbsp;&nbsp;&nbsp;&nbsp;号
				刑事判决书判处${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}，
				附加${culprit.culpritJudgment.accessoryPunishment }，刑期自
				<fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}"
									pattern="yyyy年MM月dd日" />起至<fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}"
									pattern="yyyy年MM月dd日" />止。
			</div>
			<div style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				该社区矫正人员有违反法律（行政法规、社区矫正监督管理规定）的行为，具体事实如下：${imprison.concreteFacts}
			</div>
			
			<div style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				根据《中华人民共和国刑事诉讼法》第二百五十七条，《社区矫正实施办法》第二十六条、《广西壮族自治区社区矫正实施细则（试行）》第八十七条之规定，建议对社区矫正人员${culprit.name}收监执行刑罚。
			</div>
			<div style="font-size:19px;;margin-top:10px;text-indent:45px;line-height:30px;">
				此致
				<br />
				<input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:80px;" readonly="readonly"/>
			人民法院（公安（分）局、监狱管理局）
			</div>

			<div style="font-size:19px;margin-top:60px;text-align:right;margin-right:60px;">
				${issueYear}&nbsp;年&nbsp;${issueMonth}&nbsp;月&nbsp;${issueDay}
				日
			</div>
			<div style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：
				<input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:80px;" readonly="readonly"/>
			人民检察院，
				<input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:80px;" readonly="readonly"/>
			公安（分）局。
			</div>
		</div>
	</div>
	</div>
