<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
 <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 

	<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div style="display:none">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printRevokeProbationBook" onclick="preview()">打印当前页</a> 
			&nbsp;&nbsp;注：红色区域及下划线处可输入内容
		</div>
		<div id="revokeProbation_PrintMsg"></div>
	    <div id="revokeProbationPrint">
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:30px;margin-top:20px;text-align: center;font-weight: bold;">
				撤销缓刑建议书
			</div>
			<div><input type="text" style="display:none;" id="revokeProbationId1" value="${revokeProbation.id}" /></div>
			<div style="font-size:19px;margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</div>
			<div style="margin-top:3px;text-indent:28px;line-height:30px;padding:0;margin: 0;">
				社区矫正人员：<u>${culprit.name }</u>，<u>${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}</u>，
				<u><fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></u>出生，
				 居住地：<u>${culprit.address }</u>，
				户籍地：<u>${culprit.regResidence }</u>。
				 因<u>${culprit.culpritJudgment.crimeInfo }</u>经<u>${culprit.culpritJudgment.adjudgeOrg }</u>于<u><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate }" pattern="yyyy年MM月dd日" /> </u>
				以(${culprit.culpritJudgment.adjudgeId })&nbsp;&nbsp;&nbsp;&nbsp;字第&nbsp;&nbsp;&nbsp;&nbsp;号刑事判决书判处<u>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</u>
				，缓刑<u>${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}</u>,附加<u>${culprit.culpritJudgment.accessoryPunishment }</u>。
				在缓刑考验期间依法实行社区矫正，社区矫正期限自<u><fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
									pattern="yyyy年MM月dd日" /></u>
				起至
				<u><fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
									pattern="yyyy年MM月dd日"/></u>止。
			</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				该社区服刑人员有违反法律（行政法规、社区矫正监督管理规定、人民法院禁止令）的行为，具体事实如下：
			</div>
			<div style="margin-top:3px;line-height:30px;padding:0;margin: 0;" >
 				 <textarea   class="easyui-validatebox"  multiline="true" readonly="readonly"
				style="text-indent:28px;border:0 none;overflow:hidden;font-size:19px;text-align:left;width:620px;height:300px;font-family: FangSong_GB2312;">${revokeProbation.concreteFacts}</textarea> 
			</div>
			<div style="margin-top:3px;text-indent:28px;line-height:30px;padding:0;">
				根据《中华人民共和国刑法》第七十七条、《社区矫正实施办法》第二十五条、《广西壮族自治区社区矫正实施细则（试行）》第八十七条之规定，建议对社区矫正人员<u>${culprit.name}</u>撤销缓刑。
			</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">此致</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				<u>${revokeProbation.court}</u>中级人民法院
			</div>

			<div style="margin-top:50px;margin-bottom:30px;text-align:right;padding:0;">
				<u>${issueYear}</u>&nbsp;年&nbsp;<u>${issueMonth}</u>&nbsp;月&nbsp;<u>${issueDay}</u>&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="line-height:30px;padding:0;margin: 0;">
				抄送：<u>${revokeProbation.procuratorate}</u>人民检察院，<u>${revokeProbation.police}</u>公安（分）局。
			</div>
		</div>
		</div>
	</div>
<script type="text/javascript">
var LODOP; //声明为全局变量 
//打印当前页
 function preview(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('revokeProbation_PrintMsg'));
    LODOP.PRINT_INIT("打印撤销缓刑建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#revokeProbationPrint').html());
    /* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
}

  </script>
