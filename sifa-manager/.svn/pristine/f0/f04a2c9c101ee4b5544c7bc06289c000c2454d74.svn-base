<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
	<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="outOfPrisonBookPrintBtn" onclick="preview_outOfPrison()">打印当前页</a> 
		</div>
		<div id="outOfPrison_PrintMsg"></div>
		<div id="outOfPrison_content">
			<div style="font-family:FangSong_GB2312;font-size:19px;
			margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div  style="font-size:30px;margin-top:20px;text-align: center;font-weight: bold;">
				延长暂予监外执行建议书
			</div>
			<div 
				style="font-size:19px;margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</div>
			<div style="margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员：<u>${culprit.name }</u>，<u>${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}</u>，
				<u><fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></u>出生， 居住地：<u>${culprit.address }</u>，户籍地：<u>${culprit.regResidence }</u>。
				 因<u>${culprit.culpritJudgment.crimeInfo }</u>经<u>${culprit.culpritJudgment.adjudgeOrg }</u>于<u><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate }" pattern="yyyy年MM月dd日" /> </u>
				以(${culprit.culpritJudgment.adjudgeId })&nbsp;&nbsp;&nbsp;&nbsp;字第&nbsp;&nbsp;&nbsp;&nbsp;号刑事判决书判处<u>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</u>，缓刑<u>${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}</u>,附加<u>${culprit.culpritJudgment.accessoryPunishment }</u>。
				在缓刑考验期间依法实行社区矫正，社区矫正期限自<u><fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}" pattern="yyyy年MM月dd日" /></u>
				起至<u><fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}" pattern="yyyy年MM月dd日"/></u>止。
				<u><fmt:formatDate value="${outOfPrison.startDate}" pattern="yyyy年MM月dd日" /></u>
				由广西省监狱管理局决定暂予监外执行。在暂予监外执行期间，依法实行社区矫正。暂予监外执行期限自 <u><fmt:formatDate value="${outOfPrison.startDate}" pattern="yyyy年MM月dd日" /></u>起至<u><fmt:formatDate value="${outOfPrison.endDate}" pattern="yyyy年MM月dd日" /></u>止。
				现暂予监外执行期满，经委托<u>${outOfPrison.hospital}</u>医院进行医学司法鉴定，鉴定结果如下：
			</div>
			<div style="margin-top:3px;line-height:30px;padding:0;margin: 0;" >
				 <textarea   class="easyui-validatebox"  multiline="true" readonly="readonly"
				style="text-indent:28px;border:0 none;overflow:hidden;font-size:19px;text-align:left;width:620px;height:300px;font-family: FangSong_GB2312;">${outOfPrison.identificationResults}</textarea> 
			</div>
			<div
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				 根据《罪犯保外就医疾病伤残范围》与广司〔2007〕216号《关于罪犯保外就医病残鉴定的适用意见》，建议延长社区矫正人员
				<u>${culprit.name}</u>暂予监外执行期限自<u><fmt:formatDate value="${outOfPrison.startDate}" pattern="yyyy年MM月dd日" /></u>起至<u><fmt:formatDate value="${outOfPrison.endDate}" pattern="yyyy年MM月dd日" /></u>止。 
			</div>
			<div 
				style="font-size:19px;margin-top:3px;text-indent:28px;line-height:30px;">
				此致
				<br />
				<u>${outOfPrison.court}</u>人民法院（公安局、监狱管理局）
			</div>
			
			<div style="margin-top:50px;margin-bottom:30px;text-align:right;padding:0;">
				<u>${issueYear}</u>&nbsp;年&nbsp;<u>${issueMonth}</u>&nbsp;月&nbsp;<u>${issueDay}</u>&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div 
				style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：<u>${outOfPrison.procuratorate}</u>人民检察院，<u>${outOfPrison.police}</u>公安（分）局。
			</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
var LODOP; //声明为全局变量 
//打印当前页
function preview_outOfPrison(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('outOfPrison_PrintMsg'));
LODOP.PRINT_INIT("打印撤销缓刑建议书");
//设置打印纸张大小，1代表纵向打印
LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
LODOP.ADD_PRINT_HTM(40,70,"70%","100%",$('#outOfPrison_content').html());
/* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
}

 </script>

