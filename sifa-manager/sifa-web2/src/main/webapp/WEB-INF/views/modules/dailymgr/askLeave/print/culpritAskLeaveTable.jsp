<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$(function() {
	
});

$('#askLeavePrintBtn1').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('askLeaveTable_PrintMsg'));
    LODOP.PRINT_INIT("打印社区服刑人员请假外出审批表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#askLeaveTable').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
<form action="" method="post" id="">
	<input type="hidden" name="id" value="${askLeave.id}"/>
	<div style="text-align:center;margin-top:10px;display:none;'">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="askLeaveTableBtn" onclick="preview()">打印当前页</a> 
	</div>
	<div id="askLeaveTable_PrintMsg"></div>
	<div class="easyui-panel" id="askLeaveTablePrint" align="center" style="width:100%;border:0">
		<div style="width:165mm;border:0;font-size: 16px;font-family: FangSong_GB2312;">
			<div style="text-align: center;margin-bottom:40px;"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员请假外出审批表</span></div>
			<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
			
			<tr>
				<td align="right" width="100%">
				<span style="font-size: 21.3px;font-family: FZXiaoBiaoSong-B05S">20&nbsp;&nbsp;年&nbsp;&nbsp;号</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%">社区服刑人员${askLeave.culprit.name}：
				</td>
			</tr>
			
			<tr>
				<td width="100%">&nbsp;&nbsp;&nbsp;按照《社区矫正实施办法》第十三条、《广西壮族自治区社区矫正实施细则（试行）》第五十二条之规定，经${askLeave.sysGroup.name}审批，同意你请假${askLeave.leaveDays}天，外出到${askLeave.place}，时间从<fmt:formatDate value="${askLeave.beginDate}" pattern="yyyy年MM月dd日"/>起至<fmt:formatDate value="${askLeave.endDate}" pattern="yyyy年MM月dd日"/>止。外出期间必须遵纪守法，并按时返回销假（交回外出证明）。如有违反社区监督管理规定的行为，将受到相应的处罚。
				</td>
			</tr>
			
			<tr height="50px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span>&nbsp;&nbsp;&nbsp;社区服刑人员签名：</span><span style="float:right;margin-right: 50px;">司法所（公章）</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日</span>
				<span style="float:right;margin-right: 60px;">年&nbsp;&nbsp;月&nbsp;&nbsp;日</span>
				</td>
			</tr>
			
			<tr height="100px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td align="center" style="letter-spacing:0px;">----------------------------------骑缝章----------------------------------
				</td>
			</tr>
			
			<tr height="20px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td width="100%" align="center"><span style="font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员外出证明</span></td>
			</tr>
			
			<tr>
				<td align="right">
				<span style="font-size: 21.3px;font-family: FZXiaoBiaoSong-B05S">20&nbsp;&nbsp;年&nbsp;&nbsp;号</span>
				</td>
			</tr>
			
			<tr>
				<td width="100%">社区服刑人员${askLeave.culprit.name}：
				</td>
			</tr>
			
			<tr>
				<td width="100%">&nbsp;&nbsp;&nbsp;按照《社区矫正实施办法》第十三条、《广西壮族自治区社区矫正实施细则（试行）》第五十二条之规定，经${askLeave.sysGroup.name}审批，同意你请假${askLeave.leaveDays}天，外出到${askLeave.place}，时间从<fmt:formatDate value="${askLeave.beginDate}" pattern="yyyy年MM月dd日"/>起至<fmt:formatDate value="${askLeave.endDate}" pattern="yyyy年MM月dd日"/>止。外出期间必须遵纪守法，并按时返回销假（交回外出证明）。如有违反社区监督管理规定的行为，将受到相应的处罚。
				</td>
			</tr>
			
			<tr>
				<td width="100%">&nbsp;&nbsp;&nbsp;特此证明。
				</td>
			</tr>
			
			<tr height="50px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td align="right">司法所（公章）
				</td>
			</tr>
			
			<tr>
				<td align="right">年&nbsp;&nbsp;月&nbsp;&nbsp;日
				</td>
			</tr>
			
			<tr height="50px">
				<td width="100%">
				</td>
			</tr>
			
			<tr>
				<td width="100%">销假时间：&nbsp;&nbsp;年&nbsp;&nbsp;月&nbsp;&nbsp;日&nbsp;&nbsp;时
				</td>
			</tr>
			
			<tr>
				<td width="100%">社区服刑人员签名：
				</td>
			</tr>
		</table>
    	</div>
    </div>
</form>
