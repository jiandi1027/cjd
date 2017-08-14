<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

<form action="" method="post" id="">
	<input type="hidden" name="id" value="${investigate.id}" />

	<div style="text-align: center; margin-top: 10px; display: none;">
		<a id="investigatePrintBtn1111" href="#" class="easyui-linkbutton"
			data-options="iconCls:'fi-print icon-blue'">打印当前页</a>
	</div>
	<div id="investigate_PrintMsg"></div>


	<div id="dcpgyjsPrint"
		style="font-family: FangSong_GB2312; font-size: 19px; margin-top: 40px; width: 165mm; height: 200mm; border: 0; margin-right: auto; margin-left: auto;">
		<div style="font-size: 30px; margin-top: 20px; text-align: center; font-weight: bold;">
			调查评估意见书</div>

		<table width="100%" style="line-height: 150%; font-size: 20px;letter-spacing: 0px;">

			<tr>
				<td align="right" style="font-size: 18.7px; font-family: SimHei;">
					(&nbsp;)&nbsp;字&nbsp;&nbsp;号</td>
			</tr>
			<tr>
				<td width="100%" style="font-weight: bold;">${investigate.entrustUnit}:</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;受你单位委托，我局于 <c:choose>
						<c:when test="${investigate.begTime == null}">&nbsp;年&nbsp;月&nbsp;日</c:when>
						<c:otherwise>
							<u> <fmt:formatDate value="${investigate.begTime}"
									pattern="yyyy年MM月dd日" /></u>

						</c:otherwise>
					</c:choose>至<c:choose>
						<c:when test="${investigate.endTime == null}">
								&nbsp;年&nbsp;月&nbsp;日
							</c:when>
						<c:otherwise>
							<u> <fmt:formatDate value="${investigate.endTime}"
									pattern="yyyy年MM月dd日" /></u>
						</c:otherwise>
					</c:choose>对<u>${investigate.name}</u>进行了调查评估。有关情况如下:
				</td>
			</tr>
			<tr>
				<td align="center"><textarea id="situation" name="situation"
						multiline="true" class="easyui-validatebox"
						style="text-align: left; width: 620px; border: 0 none; resize: none; font-size: 21.3px; outline: none; font-family: FangSong_GB2312; overflow-y: hidden;"
						readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${investigate.situation}</textarea>
				</td>
			</tr>
			<tr>
				<td>综合以上情况，评估意见为：<u>${fns:getSysDicValueByKey('sf_investigate','dic_evalue_view_key',record.dicDecideType == 2 ? '82002':'82001','') }</u>
				</td>
			</tr>
			<tr height="50px;">
			</tr>
			<tr>
				<td align="right"><label>司法局（&nbsp;公章&nbsp;）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</td>
			</tr>

			<tr>
				<td align="right" style="margin-bottom: 30px;"><u>${isYear}</u>&nbsp;年&nbsp;<u>${isMonth}</u>&nbsp;月&nbsp;<u>${isDay}</u>&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>

			<tr style="display: none;">
				<td align="center"><a id="investigatePrintBtn1"
					class="easyui-linkbutton">打印调查评估意见书</a></td>
			</tr>

		</table>

	</div>
</form>
<script type="text/javascript">
	var LODOP; //声明为全局变量 
	$(function()
	{
		var textarea = document.getElementById("situation");
		textarea.style.height = textarea.scrollHeight + 'px';
	});

	$('#investigatePrintBtn1').click(function()
	{
		CreatePrintPage();
		LODOP.PREVIEW();
	});

	//创建打印页面
	function CreatePrintPage()
	{
		LODOP = getLodop(document.getElementById('LODOP_OB'), document
				.getElementById('LODOP_EM'), document
				.getElementById('investigate_PrintMsg'));
		LODOP.PRINT_INIT("打印调查评估意见书");
		//设置打印纸张大小，1代表纵向打印
		LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
		LODOP.ADD_PRINT_HTM(40, 60, "70%", "100%", $('#dcpgyjsPrint').html());
		//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
		//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
		//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
		//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
	}
</script>
</body>
</html>