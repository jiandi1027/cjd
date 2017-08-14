<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<style type="text/css">
			
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
				height: 200mm;
				border: 0;
				margin-right: auto; 
				margin-left: auto;
			}
			
			.bold{
			text-align:center;
			}
</style>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('sqjzxgs_PrintMsg'));
    LODOP.PRINT_INIT("打印撤销缓刑建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(50,60,"70%","100%",document.getElementById('sqjzxgsPrint').innerHTML);
/*     LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
 */
}

</script>
<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
	<div id="idControls" style="text-align:center;margin-top:10px;display:none;">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="sqjzxgs_PrintBtn" onclick="preview()">打印当前页</a> 
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#schemeDialog').dialog('close');">关闭</a> -->
	</div>
	<div id="sqjzxgs_PrintMsg"></div>
	<div id="sqjzxgsPrint">
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:24px;margin-top:50px;text-align: center;font-weight:bold;">
				社区服刑人员入矫宣告书
			</div>
			<div style="margin-top:40px;text-align:left;line-height:40px;">
			社区矫正人员<u>${culprit.name}</u>:
			</div>
			<div style="text-indent:28px;letter-spacing:3px;line-height:40px;margin:0;">
			你因<u>${culprit.culpritJudgment.crimeInfo}</u>罪经<u>${culprit.culpritJudgment.adjudgeOrg}</u>于
			<u><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" /></u>; 
			判处<u>${culprit.culpritJudgment.adjudgePeriod}（同时宣告禁止${culprit.culpritJudgment.timeBan}）</u>。
			<u><fmt:formatDate value="${culprit.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日"/></u>
			经<u>${culprit.culpritJudgment.adjudgeRedressOrg}</u>人民法院（监狱管理局、公安局）裁定假释（决定、批准暂予监外执行）。在管制（缓刑、假释、暂予监外执行）期间，依法实行社区矫正。
			社区矫正期限自<u><fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}" pattern="yyyy年MM月dd日" /></u>起至<u><fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}" pattern="yyyy年MM月dd日" /></u>止。
			现就对你依法实施社区矫正的有关事项宣告如下：
			</div>
			<div  style="text-indent:28px;line-height:40px;margin:0;">
			一、遵纪守法，按规定向司法所报告有关情况，遵守外出审批、居住地变更审批、会客等有关规定（遵守人民法院宣告的禁止令），服从监管；按规定参加司法所组织的教育学习和社区服务。
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			二、如违反社区矫正监督管理规定，将视情节给予警告、治安管理处罚、撤销缓刑、撤销假释、收监执行。
			</div>
			<div  style="margin:0;text-indent:28px;line-height:40px;">
			三、人身安全、合法财产和辩护、申诉、控告、检举以及其他未被依法剥夺或限制的权利不受侵犯。
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			四、司法所为你确立了社区矫正小组，小组成员由<u>${monitorGroup}</u>组成，协助对你进行监督、教育、帮助，你必须积极配合。
			</div>
			<div  style="margin:0;text-indent:28px;line-height:40px;">
			特此宣告。
			</div>
			<div style="text-align:right;line-height:40px;margin-right:40px;margin-bottom:40px;">
			(司法所公章)
			</div>
			<div style="text-align:right;line-height:40px;margin-right:40px;margin-bottom:40px;">
			<fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" />
			</div>
			<div  style="margin-top:30px;text-align:right;line-height:40px;margin-right:40px;">
				社区服刑人员（签名捺手印）：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日
			</div>
		</div>
	</div>	
</div>

	