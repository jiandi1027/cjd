<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<input type="hidden" name="id" value="${securityPunishment.id}"/>

	<div id="securityPunishment_PrintMsg"></div>
	<div class="easyui-panel" id="zaglcfjysPrint" align="center" style="width:100%;border:0;">
		<div style="width:165mm;border:0;font-size: 19px;font-family: FangSong_GB2312;">
		<table width="100%" style="border-collapse:separate; border-spacing:30px;">
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">违反社区矫正规定警告决定书（存根）</span></td>
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
				&nbsp;&nbsp;&nbsp;&nbsp;社区矫正人员${securityPunishment.culprit.name}在社区矫正期间，有违反监督管理规定（人民法院禁止令）的行为如下：
					${securityPunishment.fact}.根据《社区矫正实施办法》第二十三条、《广西壮族自治区社区矫正实施细则（试行）》第八十五条之规定，决定给予警告处分一次。
					
				</td>
				
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员签名：${securityPunishment.culprit.name} &nbsp;&nbsp;&nbsp;（公章）司法局（公章）
				</td>
			</tr>
			<tr>
				<td >
				&nbsp;&nbsp;&nbsp;&nbsp;联系电话：${securityPunishment.culprit.name} 
				</td>

			</tr>
			
			<tr>
				<td align="right">----------------------------（骑缝章）--------------------------</td>
			</tr>
				<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">违反社区矫正规定警告决定书（存根）</span></td>
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
				&nbsp;&nbsp;&nbsp;&nbsp;社区矫正人员${securityPunishment.culprit.name}在社区矫正期间，有违反监督管理规定（人民法院禁止令）的行为如下：
					${securityPunishment.fact}.根据《社区矫正实施办法》第二十三条、《广西壮族自治区社区矫正实施细则（试行）》第八十五条之规定，决定给予警告处分一次。
				</td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员签名：${securityPunishment.culprit.name} &nbsp;&nbsp;&nbsp;（公章）司法局（公章）
				</td>
			</tr>

			<tr>
				<td align="right">
				<label>司法局（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>
			
			<tr>
				<td align="right" style="margin-bottom: 30px;">
				${issueYear}&nbsp;年&nbsp;${issueMonth}&nbsp;月&nbsp;${issueDay}&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		
			
			<tr>
				<td align="center" style="display: none;">
					<input type="hidden" id="decideType" name="decideType" value="1">
				
					<a id="warningPrintBtn1" class="easyui-linkbutton">打印</a>
					<a id="securityPunishmentPrintBtn3" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
    
    	</div>
    </div>
    
</form>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$(function() {
	/* var d = new Date();
	var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	
	$('#year').html(d.getFullYear());
	$('#month').html(d.getMonth()+1);
	$('#day').html(d.getDate()); */
});

$('#warningPrintBtn1').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('securityPunishment_PrintMsg'));
    LODOP.PRINT_INIT("打印治安管理处罚建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#zaglcfjysPrint').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

$('#securityPunishmentPrintBtn3').click(function (){
	$('#securityPunishmentPrint').dialog("close");
});
</script>
</body>
</html>