<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<form>
	<div id="reducePenalty_PrintMsg"></div>
	<div class="easyui-panel" id="reducePenaltyPrintBook" align="center" style="width:100%;">
		<div style="width:165mm;border:0;font-size: 19px;font-family: FangSong_GB2312;">
		<table width="100%">
			<tr>
				<td width="100%" align="center"><span style="font-size: 24px;font-family: FZXiaoBiaoSong-B05S"><b>社区服刑人员减刑建议书</b></span></td>
			</tr>
			
			<tr height="20px">
				<td align="right">
				<label>(&nbsp;&nbsp;&nbsp;&nbsp;)字&nbsp;&nbsp;号</label>
				</td>
			</tr>
			<tr height="20px">
			</tr>
			<tr>
				<td>
				<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				社区矫正人员<u>${reducePenalty.culprit.name}</u>，<u>${fns:getSysDicValueByKey('common_table', 'sex', reducePenalty.culprit.dicSexKey, '') }</u>，
				<u><fmt:formatDate value="${reducePenalty.culprit.birthday}" pattern="yyyy年MM月dd日"/>出生</u>，<u>${fns:getSysDicValueByKey('common_table','nation',reducePenalty.culprit.nation,'')}</u>，
				居住地<u>${reducePenalty.culprit.address}</u>，户籍地<u>${reducePenalty.culprit.regResidence}</u>。
				因<u>${reducePenalty.culpritJudgment.crimeInfo}</u>经<u>${reducePenalty.culpritJudgment.adjudgeOrg}</u>于<u><fmt:formatDate value="${reducePenalty.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日"/></u>
				判处<u>${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', reducePenalty.culpritJudgment.dicYpxfKey, '') }</u>。
				<u><fmt:formatDate value="${reducePenalty.culpritJudgment.adjudgeRedressT}" pattern="yyyy年MM月dd日"/></u>
				经<c:if test="${reducePenalty.culpritJudgment.adjudgeRedressOrg eq null}"><u>${reducePenalty.culpritJudgment.adjudgeOrg}</u></c:if>
				<c:if test="${reducePenalty.culpritJudgment.adjudgeRedressOrg ne null}"><u>${reducePenalty.culpritJudgment.adjudgeRedressOrg}</u></c:if>
				（公安局、监狱管理局）裁定（决定、批准）<u>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',reducePenalty.culpritJudgment.dicPenalTypeKey,'')}</u>，在<u>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',reducePenalty.culpritJudgment.dicPenalTypeKey,'')}</u>期间，依法实行社区矫正。社区矫正期限自
				<u><fmt:formatDate value="${reducePenalty.culprit.redressStartDate}" pattern="yyyy年MM月dd日"/></u>
				起至<u><fmt:formatDate value="${reducePenalty.culprit.redressEndDate}" pattern="yyyy年MM月dd日"/></u>止。
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				该社区服刑人员在社区矫正期间，有如下表现：
				</div>
				</td>
			</tr>
			<tr height="250px;">
				<td>
				<div style="text-indent:28px;line-height:30px;">
				${reducePenalty.actions }
				</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<div style="margin-top:30px;text-indent:28px;line-height:30px;padding:0;margin: 0;">
						根据《中华人民共和国刑法》第七十八条、《中华人民共和国刑事诉讼法》第二百六十二条条、《社区矫正实施办法》第二十八条、《广西壮族自治区社区矫正实施细则（试行）》第一百零七条之规定，建议对社区服刑人员<u>${reducePenalty.culprit.name}</u>减去 <u>${reducePenalty.reduceTime}</u> 。
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="margin-top:30px;text-indent:28px;line-height:30px;padding:0;margin: 0;">
						此致
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="margin-top:30px;line-height:30px;padding:0;margin: 0;">
						<label>_________</label>中级人民法院
					</div>
				</td>
			</tr>
			<tr height="30px;">
			</tr>
			
			<tr style="margin-top:50px;">
				<td align="right">
				<label>（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr height="30px;"></tr>
			<tr>
				<td align="right">
				<label>_____</label>年<label>_____</label>月<label>_____</label>日
				</td>
			</tr>
			
			<tr height="70px;"></tr>
			<tr>
				<td>
				注：抄送<label>_________</label>人民检察院、<label>_________</label>公安（分）局，<label>_________</label>监狱。
				</td>
			</tr>
			
		</table>
    	</div>
    </div>
</form>
<div  style="display: none;">
		<input type="hidden" id="decideType" name="decideType" value="1">
		<a id="reducePenaltyPrintBtn" class="easyui-linkbutton">打印</a> 
</div>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$(function() {
	
});

$('#reducePenaltyPrintBtn').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('reducePenalty_PrintMsg'));
    //LODOP.PRINT_INIT("打印社区服刑人员减刑建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#reducePenaltyPrintBook').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>