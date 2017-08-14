<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
 <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(installMsgId){
	 CreatePrintPage(installMsgId);
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(installMsgId){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),installMsgId);
    LODOP.PRINT_INIT("打印《报到情况通知单》");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,70,"70%","100%",document.getElementById('BDTZDPrint').innerHTML);
/*     LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
    //LODOP.PREVIEW();
    LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
}

  </script>
	<div style="margin: 0 auto;padding: 0;font-family:FangSong_GB2312;">
		<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printTZDbtn" onclick="preview(BDTZD_PrintMsg)">打印当前页</a> 
		</div>
		<div id="BDTZD_PrintMsg"></div>
		<div class="easyui-panel" id="BDTZDPrint" style="width:100%;border:0" align="center">
		<div style="width:100%;font-size: 16px;font-family: FangSong_GB2312;border:0">
		
		<div style="text-align: center;margin-bottom:40px;width:1000px;"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员报到情况通知单 </span></div>
		<div style="text-align: left;">单位：${sysAccount.groupName}</div>
		<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:1000px;">
			<tr>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">姓&nbsp;名</td>
				<td style="width:7%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">性&nbsp;别</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">罪&nbsp;名</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">社区矫正<br/>决定机关</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">裁判时间</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">裁判书号</td>
				<td style="width:10%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">矫正类别</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">规定报<br/>到时限</td>
				<td style="width:8%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">报到时间</td>
				<td style="width:5%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">已在规定时限报到</td>
				<td style="width:5%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">超出规定时限报到</td>
				<td style="width:5%;height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">未报到并下落不明</td>
			</tr>
			<tr>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.name}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.crimeInfo}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culprit.culpritJudgment.adjudgeRedressOrg}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">
					<c:if test="${culprit.culpritJudgment.adjudgeRedressT !=null}"><fmt:formatDate value="${culprit.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日" /></c:if>
					<c:if test="${culprit.culpritJudgment.adjudgeDate !=null}"><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" /></c:if>
					<c:if test="${culprit.culpritJudgment.adjudgeDate !=null && culprit.culpritJudgment.adjudgeRedressT !=null}"><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" /></c:if>
					</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${culpritLaw.indictmentNum}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;">${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"><fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" /></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			<c:forEach begin="1" end="5">
			<tr>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
				<td style="height:70px;text-align: center;border-right: 1px solid;border-bottom: 1px solid;"></td>
			</tr>
			</c:forEach>
		</table>
		<div style="margin-top:20px;">
			送<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>人民法院一份，
			抄报<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>人民检察院、
			<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>公安（分）局、
			<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>监狱（看守所）。
          </div>
          <input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:1000px;" readonly="readonly"/>
        <div style="margin-top:20px;">                                                                                                  
		注：一式五份，存档一份，报送法院一份、抄报检察院、公安（分）局、监狱（看守所）各一份。 </div>
    	</div>
    </div>
</div>

