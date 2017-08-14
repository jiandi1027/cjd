<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<%-- <input type="hidden" name="id" value="${moveIn.id}"/>
	<c:if test="${docPrint eq 1 }">
		<div style="text-align:center;margin-top:10px;margin-bottom:10px;padding: 0;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" onclick="CreatePrintPage();LODOP.PREVIEW();">打印当前页</a> 
		</div>
	</c:if> --%>
	<div id="securityPunishment_PrintMsg"></div>
	<div class="easyui-panel" id="zaglcfjysPrint" align="center" style="width:100%;border:0;">
		<div style="width:165mm;border:0;font-size: 19px;font-family: FangSong_GB2312;">
		<table width="100%" style="border-collapse:separate; border-spacing:30px;">
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员居住地变更证明（存根）</span></td>
			</tr>

				<tr height="60px">
					<td></td>
				</tr>
			
			
			<tr >
				<td >
				&nbsp;&nbsp;&nbsp;&nbsp;社区矫正人员${moveIn.name}按照《社区矫正实施办法》第十四条、《广西壮族自治区社区矫正实施细则（试行）》第五十八、五十
				九条规定，同意你由现居住地${moveIn.oldPlace}变更到新居住地${moveIn.newPlace}，并于<fmt:formatDate value="${moveIn.moveTime}" pattern="yyyy年MM月dd日" />前必须到${moveIn.groupId}司法
				 局报到，依法接受社区矫正
				</td>
				
			</tr>
	
			<tr>
				<td align="right">
				<label>司法局（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr >
				<td align="right">
				
					<label>年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</label>
					
				</td>
			</tr>
			
			<tr>
				<td align="center"><label>--------------------（骑缝章）--------------------</label></td>
			</tr>
				<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员居住地变更证明</span></td>
			</tr>
	
						<tr height="60px">
					<td></td>
				</tr>
			
			
			
			<tr >
				<td >
				&nbsp;&nbsp;&nbsp;&nbsp;社区矫正人员${moveIn.name}按照《社区矫正实施办法》第十四条、《广西壮族自治区社区矫正实施细则（试行）》第五十八、五十
				九条规定，同意你由现居住地${moveIn.oldPlace}变更到新居住地${moveIn.newPlace}，并于<fmt:formatDate value="${moveIn.moveTime}" pattern="yyyy年MM月dd日" />前必须到${moveIn.groupId}司法
				 局报到，依法接受社区矫正
				</td>
				
			</tr>
	
			<tr>
				<td align="right">
				<label>司法局（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr >
				<td align="right">
				
					<label>年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</label>
					
				</td>
			</tr>
			<tr>
				<td align="center" style="display: none;">
					<input type="hidden" id="decideType" name="decideType" value="1">
					<a id="movePrintBGZM_btn" class="easyui-linkbutton">打印</a>
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

$('#movePrintBGZM_btn').click(function (){
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

$('#security1').click(function (){
	$('#securityPrint').dialog("close");
});
</script>
</body>
</html>