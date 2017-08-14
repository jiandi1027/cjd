 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview1(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('revokeProbation_PrintMsg1'));
    LODOP.PRINT_INIT("撤销缓刑审批表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#revokeProbationPrint3').html());
    /*LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
     LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
}
</script>
	<div>
		<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printRevokeProbationTable" onclick="preview1()">打印当前页</a>  
		</div>
		<div id="revokeProbation_PrintMsg1"></div>
			<div class="easyui-panel" id="revokeProbationPrint3" style="width:100%;border:0" align="center">
			<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;border:0">
			<div style="text-align: center;margin-bottom:40px;width:670px;">
				<span style="font-weight: bold;font-size: 24px;">撤销缓刑审批表</span>
			</div>
			<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
				<tr>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">姓&nbsp;&nbsp;名</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.name }</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">性&nbsp;&nbsp;别</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">出生年月</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"><fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></td>
				</tr>
				<tr>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">居住地</td>
					<td colspan="2" style="width:35%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.address }</td>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">户籍地</td>
					<td colspan="2"  style="width:35%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.regResidence }</td>
				</tr>
				<tr>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">罪名</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.crimeInfo }</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">原判罪行</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">附加刑</td>
					<td style="width:20%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.accessoryPunishment }</td>
				</tr>
				<tr>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">禁止令内容</td>
					<td colspan="2" style="width:30%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.contentBan }</td>
					<td style="width:15%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">禁止期限<br/>起止日</td>
					<td colspan="2"  style="width:30%;height:50px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					<fmt:formatDate value="${culprit.culpritJudgment.startBan }"
											pattern="yyyy年MM月dd日" />
									<br />
									至
									<fmt:formatDate value="${culprit.culpritJudgment.endBan }"
											pattern="yyyy年MM月dd日" /></td>
				</tr>
				<tr>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">矫正类别</td>
					<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</td>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">矫正期限</td>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.redressPeriod}</td>
					<td style="width:15%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">起止日</td>
					<td style="width:20%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
						<fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
										pattern="yyyy年MM月dd日" />
									<br />
									至
									<fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
										pattern="yyyy年MM月dd日" />
					</td>
				</tr>
				<tr>
					<td style="width:10%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">事实依据</td>
					<td colspan="5" style="width:90%;height:150px;border-right: 1px solid;border-bottom: 1px solid;text-align:left;text-indent: 2em;">${revokeProbation.detailInfo }</td>
				</tr>
				<tr>
					<td style="width:10%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">司法所意见</td>
					<td colspan="5" style="width:90%;height:150px;border-right: 1px solid;border-bottom: 1px solid;text-align:left;text-indent: 2em;">${sfsOption }</td>
				</tr>
				<tr>
					<td style="width:10%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">县级司法行政机关意见</td>
					<td colspan="5" style="width:90%;height:150px;border-right: 1px solid;border-bottom: 1px solid;text-align:left;text-indent: 2em;">${xfgOption }</td>
				</tr>
				<tr>
					<td style="width:10%;height:150px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">地级司法行政机关审核意见</td>
					<td colspan="5" style="width:90%;height:150px;;border-right: 1px solid;border-bottom: 1px solid;text-align:left;text-indent: 2em;">${sfgOption }</td>
				</tr>
				<tr>
					<td style="width:10%;height:80px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">备注</td>
					<td colspan="5" style="width:90%;height:80px;border-right: 1px solid;border-bottom: 1px solid;text-align:left;text-indent: 2em;">${revokeProbation.note }</td>
				</tr>
			</table>
		<div> 注：此表随建议书等一并报送人民法院（公安机关、监狱管理机关）。</div>
		</div>
    </div>
</div>
		