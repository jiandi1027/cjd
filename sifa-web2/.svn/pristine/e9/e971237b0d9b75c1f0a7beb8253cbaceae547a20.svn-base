<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

	<div style="display:none;">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printRevokeParoleTable" onclick="preview_qmjjTable()">打印当前页</a>  
	</div>
	<div id="qmjdb_PrintMsg"></div>
	<div  id="qmjdbPrintPage">
			<div  style="font-family:FangSong_GB2312;font-size:19px;
			margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;text-align: center;">
			<div style="font-family:SimSun;font-size:24px;margin: 0 auto;width: 680px;">
				<b>社区服刑人员矫正期满鉴定表</b>
			</div>
			<table cellspacing=0 cellpadding=0 
				style="margin-top:30px;width: 680px;font-size:16px;border:0px solid;">
				<tr>
						<td style="border-bottom:0;border-right:0;width:550px;padding: 0;">
							<div style="width:200px;height:50px;display:table; float: left; text-align: center;line-height: 150%;
									border-right: 0px solid;border-bottom: 0px solid;">
								<span style=" display:table-cell; vertical-align:middle;">
									<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/> 司法所
								</span>
							</div>
							<div style="width:183px;height:50px;padding: 0;
							display:table; float: right; text-align: center;line-height: 150%;">
								<span style=" display:table-cell; vertical-align:middle;">
								时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
								</span>
							</div>
						</td>
					</tr>
				<tr>
						<td style="border-bottom:0;border-right:0;width:550px;padding: 0;">
							<div style="width:90px;height:50px;display:table; float: left; text-align: center;line-height: 150%;
									border-right: 0px solid;border-bottom: 0px solid;">
								<span style=" display:table-cell; vertical-align:middle;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
								</span>
							</div>
						</td>
					</tr>
			</table>
			<table cellspacing=0 cellpadding=0 
				style="margin-top:30px;width: 680px;font-size:16px;border:1px solid;text-align:center;" >
								<tr>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;height:50px;text-align:center;">
									姓&nbsp;名
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
									${culprit.name}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									性别
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
									${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									出生<br/>年&nbsp;月
							</td>
						<td style="border-bottom:1px solid;border-right:0;width:180px;padding: 0;" colspan="2">
									<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />
							</td>
					</tr>
							<tr>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;height:50px;">
									居住地
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:200px;padding: 0;" colspan="2">
									${culprit.address}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									户籍地
							</td>
						<td style="border-bottom:1px solid;border-right:0;width:180px;padding: 0;" colspan="3">
									${culprit.regResidence }
							</td>
					</tr>
								<tr>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;height:50px;text-align:center;">
									罪&nbsp;名
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
									${culprit.crimeInfo}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									刑期
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
								${culprit.culpritJudgment.adjudgePeriod}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									管理类别
							</td>
						<td style="border-bottom:1px solid;border-right:0;width:180px;padding: 0;" colspan="2">
									${fns:getSysDicValueByKey('sf_culprit','dic_gldxjb_key',culprit.dicMonitorGradeKey,'')}
							</td>
					</tr>
							<tr>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;height:50px;text-align:center;">
									禁止令内容
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
									${culprit.culpritJudgment.contentBan }
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									禁止期限
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
								${culprit.culpritJudgment.timeBan}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									起止日
							</td>
						<td style="border-bottom:1px solid;border-right:0;width:180px;padding: 0;" colspan="2">
									<fmt:formatDate value="${culprit.culpritJudgment.startBan }"
											pattern="yyyy年MM月dd日" />
									<br />
									至
									<fmt:formatDate value="${culprit.culpritJudgment.endBan }"
											pattern="yyyy年MM月dd日" />
							</td>
					</tr>
							<tr>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;height:50px;text-align:center;">
									矫正类别
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
									${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									矫正期限
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:110px;padding: 0;">
								${culprit.culpritJudgment.redressPeriod}
							</td>
						<td style="border-bottom:1px solid;border-right:1px solid;width:90px;padding: 0;">
									起止日
							</td>
						<td style="border-bottom:1px solid;border-right:0;width:180px;padding: 0;" colspan="2">
									<fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
										pattern="yyyy年MM月dd日" />
									<br />
									至
									<fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
										pattern="yyyy年MM月dd日" />
							</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid;width:90px;height:250px;padding: 0;border-right:1px solid;">
									司法所鉴定意见及安置帮教建议
						</td>
						<td style="border-bottom:1px solid;width:580px;padding: 0;" colspan="6">
								<span style="display: block;height: 280px;"><br></span>
								<span style="padding-left: 60%;">司法所(公章)</span><br>
								<span style="display: block;height: 10px;"><br></span>
								<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
								<span style="display: block;height: 10px;"><br></span>
						</td>
					</tr>
					<tr>
						<td style="width:90px;height:50px;padding: 0;border-right:1px solid;">
									备注
						</td>
						<td style="width:580px;padding: 0;text-align:left;" colspan="6">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${finishRedress.remark }
						</td>
					</tr>
					<tr style="display:none;" >
				<td align="center">
					<a id="qmjdbPrint" class="easyui-linkbutton" >打印社区服刑人员矫正期满鉴定表</a>
				</td>
			</tr>
			</table>
			<p class="textp"
				style="width:632px;font-size:14px;line-Height:150%;margin-top:0px;letter-spacing:1px;">
				注：此表随建议书等一并报送人民法院（公安机关、监狱管理机关）。
			</p>
		</div>
	</div>
<script type="text/javascript">
var LODOP; //声明为全局变量 

$('#qmjdbPrint').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('qmjdb_PrintMsg'));
	LODOP.PRINT_INIT("打印社区服刑人员矫正期满鉴定表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#qmjdbPrintPage').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>