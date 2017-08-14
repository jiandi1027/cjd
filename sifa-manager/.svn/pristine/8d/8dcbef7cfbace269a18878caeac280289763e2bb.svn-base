<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
		<div style="text-align:center;margin-top:10px;margin-bottom:10px;padding: 0;display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="bdtzBtn" onclick="CreatePrintPage();LODOP.PREVIEW();">打印当前页</a> 
		</div>
	<div id="bdtz_PrintMsg"></div>
	<div class="easyui-panel" id="bdtzPrint" align="center" style="width:100%;border:0;">
		<div style="width:165mm;border:0;font-size: 16px;font-family: FangSong_GB2312;">
		<table width="100%" style="border-collapse:collapse;border:0;text-align: left;width:670px;">
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员社区矫正报到通知（存根）</span></td>
			</tr>
			<tr style="display:block;margin-top:10px;">
				<td>${culprit.groupName} ：</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员：${culprit.name }，
				身份证：${culprit.identification }，
				  性别：${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，
				<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />出生，
				 ${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}，
				  户籍地（居住地）：${culprit.regResidence }，因犯${culprit.culpritJudgment.crimeInfo }罪 经
				${culprit.culpritJudgment.adjudgeOrg }人民法院于
				 <fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" />
				 以${culprit.culpritJudgment.adjudgeId }（判决书字号）刑事判决书判处 ${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}。
				 刑期自<fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}"
									pattern="yyyy年MM月dd日" />
				起至<fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}"
									pattern="yyyy年MM月dd日" />止。
				根据法院执行通知书（公安机关、监狱暂予监外执行决定书）${culpritLaw.executeNotificationNum}号，依照最高人民法院、最高人民检察院、公安部、司法部《社区矫正实施办法》和《广西壮族自治区社区矫正实施细则（试行）》的规定，
				社区服刑人员 ${culprit.name }于<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" />前到你所依法接受社区矫正，现将该服刑人员社区矫正法律文书副本移交你所。
				</td>
				
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;特此通知<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;附：1. 移交法律文书副本：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（1）起诉书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（2）判决书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（3）公安机关、监狱暂予监外执行决定书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（4）结案登记表。<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;2. 相关材料：<br/>
				</td>
			</tr>
			<tr height="50px;">
			</tr>
			<tr  height="40px;">
				<td align="right">
				司法局&nbsp;&nbsp;&nbsp;&nbsp;
				</td>

			</tr>
			<tr>
				<td align="right"><fmt:formatDate value="${nowDate }" pattern="yyyy年MM月dd日" /></td>
			</tr>
			<tr>
				<td align="center">--------------------------------（骑缝章）--------------------------------</td>
			</tr>
			<tr height="20px;">
			</tr>
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员社区矫正报到通知</span></td>
			</tr>
			<tr style="display:block;margin-top:10px;">
				<td>${culprit.groupName} ：</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员：${culprit.name }，
				身份证：${culprit.identification }，
				  性别：${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，
				<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />出生，
				 ${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}，
				  户籍地（居住地）：${culprit.regResidence }，因犯${culprit.culpritJudgment.crimeInfo }罪 经
				${culprit.culpritJudgment.adjudgeOrg }人民法院于
				 <fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" />
				 以${culprit.culpritJudgment.adjudgeId }（判决书字号）刑事判决书判处 ${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}。
				 刑期自<fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}"
									pattern="yyyy年MM月dd日" />
				起至<fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}"
									pattern="yyyy年MM月dd日" />止。
				根据法院执行通知书（公安机关、监狱暂予监外执行决定书）${culpritLaw.executeNotificationNum}号，依照最高人民法院、最高人民检察院、公安部、司法部《社区矫正实施办法》和《广西壮族自治区社区矫正实施细则（试行）》的规定，
				社区服刑人员 ${culprit.name }于<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" />前到你所依法接受社区矫正，现将该服刑人员社区矫正法律文书副本移交你所。
				</td>
				
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;特此通知<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;附：1. 移交法律文书副本：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（1）起诉书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（2）判决书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（3）公安机关、监狱暂予监外执行决定书；<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;（4）结案登记表。<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;2. 相关材料：<br/>
				</td>
			</tr>
			<tr height="50px;">
			</tr>
			<tr>
				<td align="right">
				司法局&nbsp;&nbsp;&nbsp;&nbsp;
				</td>

			</tr>
			<tr>
				<td align="right"><fmt:formatDate value="${nowDate }" pattern="yyyy年MM月dd日" /></td>
			</tr>
			
			<tr>
				<td align="center" style="display: none;">
					<input type="hidden" id="decideType" name="decideType" value="1">
				
					<a id="securityPunishmentPrintBtn1" class="easyui-linkbutton">打印</a>
					<a id="securityPunishmentPrintBtn3" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
    
    	</div>
    </div>
    
</form>
<script type="text/javascript">
var LODOP; //声明为全局变量 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('bdtz_PrintMsg'));
    LODOP.PRINT_INIT("打印治安管理处罚建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,50,"70%","100%",$('#bdtzPrint').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
</body>
</html>