<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

<form action="" method="post" id="">
	<input type="hidden" name="id" value="${investigate.id}"/>
	
	<div id="investigate_PrintMsg3"></div>
	<div class="easyui-panel" id="sqshdcspbPrint" style="width:100%;border:0;margin-top: 10px;" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;">
		
		<div style="text-align: center;"><span style="font-weight: bold;">审前社会调查审批表</span></div>
		
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		<table width="100%" style="width:670px;border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;">
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" rowspan="2" width="10%">调<br>查<br>人<br>员</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="29">${investigate.investigator1 }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="28">单位职务</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="23">${investigate.position1 }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" >姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="29" >${investigate.investigator2 }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="28" >单位职务</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="23">${investigate.position2 }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" rowspan="5" width="10%">调<br>查<br>对<br>象</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" width="10%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="12" width="12%">${investigate.name }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" width="10%">性别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="7" width="7%">${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="11" width="11%">民族</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="17" width="17%">${fns:getSysDicValueByKey('common_table', 'nation', investigate.nation, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10" width="10%">出生年月</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="13" width="13%"><fmt:formatDate value="${investigate.bornDate}" pattern="yyyy年MM月dd日" /></td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10">曾用名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="12">${investigate.oldName}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="2">身份证号码</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="35" rowspan="2">${investigate.relevantNumber}</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="2">籍贯</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13" rowspan="2">
					<c:choose>
						<c:when test="${ investigate.originProId == '1110000' || investigate.originProId == '1120000' 
									|| investigate.originProId == '1500000' || investigate.originProId == '1310000' }">
							${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }${fns:getAreaValueById(investigate.originCountryId, '')}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10">别名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="12">${investigate.alias}</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10">家庭住址</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="29">
					<c:choose>
						<c:when test="${ investigate.addressProId == '1110000' || investigate.addressProId == '1120000' 
									|| investigate.addressProId == '1500000' || investigate.addressProId == '1310000' }">
							${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${investigate.addressStreet}${investigate.addressDetail}	
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${fns:getAreaValueById(investigate.addressCountryId, '') }${investigate.addressStreet}${investigate.addressDetail}
						</c:otherwise>
					</c:choose>
				</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11">联系电话</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="17">${investigate.contactPhone }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">职业</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13">${investigate.job }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="10">经常居住地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;height:50px" colspan="29">
					<c:choose>
						<c:when test="${ investigate.habitualResidenceProId == '1110000' || investigate.habitualResidenceProId == '1120000' 
									|| investigate.habitualResidenceProId == '1500000' || investigate.habitualResidenceProId == '1310000' }">
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}	
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${fns:getAreaValueById(investigate.habitualResidenceCountryId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}
						</c:otherwise>
					</c:choose>
				</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11">联系电话</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="17">${investigate.contactPhone }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">案由</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13">${investigate.crimeReason }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">村<br>（居、<br>社<br>区）<br>基<br>层<br>组<br>织<br>意<br>见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="90">
				见附件
					<%-- <span style="display: block;height: 100px;text-align:left;text-indent: 2em;">${investigate.basicView }<br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span> --%>
				</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">公<br>安<br>派<br>出<br>所<br>意<br>见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="90">
				见附件
				<%-- 	<span style="display: block;height: 100px;text-align:left;text-indent: 2em;">${investigate.policeView }<br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span> --%>
				</td>
			</tr>
			
			<tr style="display:none;" >
				<td align="center">
					<a id="investigatePrintBtn3" class="easyui-linkbutton" >打印审前社会调查审批表</a>
				</td>
			</tr>
			
		</table>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
	
});

$('#investigatePrintBtn3').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('investigate_PrintMsg3'));
	LODOP.PRINT_INIT("打印审前社会调查审批表");
	//设置打印纸张大小，1代表纵向打印
	LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
	LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#sqshdcspbPrint').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}
</script>
</body>
</html>