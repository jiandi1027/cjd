<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

<form action="" method="post" id="">
	<input type="hidden" name="id" value="${investigate.id}"/>
	
	<div id="investigate_PrintMsg2"></div>
	
		<div class="easyui-panel" id="sqshdcbPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;border:0">
			<div id="fenyeone">
	
		<div style="text-align: center;"><span style="font-weight: bold;">柳州市社区矫正审前社会调查表</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		<div style="text-align: center;"><span style="font-weight: bold;">调查对象姓名：${investigate.name }</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;">调&nbsp;查&nbsp;单&nbsp;位：${investigate.sfsGroupName }</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;">填&nbsp;表&nbsp;日&nbsp;期：<fmt:formatDate value="${investigate.endTime }" pattern="yyyy年MM月dd日" /></span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 50px;"></span></div>
		<div style="text-align: center;"><span style="font-weight: bold;">柳州市司法厅监制</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 20px;"></span></div>
		
		<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;">
		
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="2" width="10%">调<br>查<br>人<br>员</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="29">${investigate.investigator1 }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="28">单位职务</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="23">${investigate.position1 }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" >姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="29" >${investigate.investigator2 }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="28" >单位职务</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="23">${investigate.position2 }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="5" width="10%">调<br>查<br>对<br>象</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="12" width="12%">${investigate.name }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">性别</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="7" width="7%">${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%">民族</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="17" width="17%">${fns:getSysDicValueByKey('common_table', 'nation', investigate.nation, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">出生年月</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13" width="13%"><fmt:formatDate value="${investigate.bornDate}" pattern="yyyy年MM月dd日" /></td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">曾用名</td>
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
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">别名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="12">${investigate.alias}</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">家庭住址</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="29">
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
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">经常居住地</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="29">
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
				<c:if test="${listSize == 0}">
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%" rowspan="6">家<br>庭<br>背<br>景</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%" rowspan="3">家庭成员</td>
				</c:if>
				<c:if test="${listSize != 0}">
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%" rowspan="${listSize + 4}">家<br>庭<br>背<br>景</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%" rowspan="${listSize + 1}">家庭成员</td>
				</c:if>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%">关系</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">姓名</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="8" width="8%">年龄</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%">职业</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="27" width="26%">住址</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13" width="14%">联系方式</td>
			</tr>
			<c:if test="${listSize == 0}">
			<tr height="20px;">
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="8" width="8%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="27" width="26%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13" width="14%"></td>
			</tr>
			<tr height="20px;">
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="8" width="8%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="11" width="11%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="27" width="26%"></td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="13" width="14%"></td>
			</tr>
			</c:if>
			<c:forEach var="investigateFamily" items="${list}">
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="12" width="12%">${fns:getSysDicValueByKey('sf_investigate_family', 'dic_relation_key', investigateFamily.dicRelationKey, '') }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">${investigateFamily.name }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="8" width="8%">${investigateFamily.age }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" width="10%">${investigateFamily.job }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="26" width="26%">${investigateFamily.address }</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="14" width="14%">${investigateFamily.phone }</td>
			</tr>
			</c:forEach>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">家庭成员与调查对象相处情况</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.familySituation }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">家庭经济状况</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.economicStatus }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">家庭成员与调查对象相处情况</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.minorOtherCases }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="4">个<br>性<br>特<br>点</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">生理状况</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.physiConditions }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">心理特征</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.psychFeature }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">性格类型</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.mettleType }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">爱好特长</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.hobbies }</td>
			</tr>
			
	</table>
		</div>
		
		
		
		<div id="fenyetwo">
		<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;">
		
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="5"width="10%">犯<br>罪<br>前<br>表<br>现</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10"width="10%">工作(学习)表现</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80"width="80%">${investigate.display }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">业余生活</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.amateurLife }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">邻里关系</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.neighborhoodRelations }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">社会交往</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.socialInteraction }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">违纪违法情况</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.badFact }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="4">悔<br>罪<br>表<br>现</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">对犯罪行为的认识</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.crimeAcquaint }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">悔过态度</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.repentantAttitude }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">罚金刑履行情况及履行能力</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.fineFulfillAbility }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">附带民事赔偿履行情况及履行能力</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.reparationFulfillAbility }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="2">社<br>会<br>反<br>响</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">被害人或其亲属态度</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.victimAttitude }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">社会公众态度</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.publicAttitude }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10" rowspan="3">监<br>管<br>条<br>件</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">家庭成员态度</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.familyAttitude }</td>
			</tr>
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">生活环境</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">${investigate.lifeEnvironment }</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">村（居、社区）基层组织意见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="80">
					<span style="display: block;height: 100px;">${investigate.basicView }<br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			</table>
			</div>
			
			<div id="fenyethree">
			<table width="100%" style="border-collapse:collapse;border-spacing:0;border-left:1px solid;border-top:1px solid;text-align: center;">
		
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10"width:10%>公<br>安<br>派<br>出<br>所<br>意<br>见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="90"width:90%>
					<span style="display: block;height: 100px;">${investigate.policeView }<br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">司<br>法<br>所<br>意<br>见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="90">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="10">县<br>级<br>司<br>法<br>行<br>政<br>机<br>关<br>意<br>见</td>
				<td style="border-right:1px solid;border-bottom:1px solid;" colspan="90">
					<span style="display: block;height: 100px;"><br></span>
					<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
					<span style="display: block;height: 10px;"><br></span>
					<span style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
					<span style="display: block;height: 10px;"><br></span>
				</td>
			</tr>
			
			<tr style="display:none;" >
				<td align="center">
					<a id="investigatePrintBtn2" class="easyui-linkbutton" >打印审前社会调查表</a>
				</td>
			</tr>
			
		</table>
		</div>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
});

$('#investigatePrintBtn2').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
	
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('investigate_PrintMsg2'));
	LODOP.PRINT_INIT("打印审前社会调查表");
	//设置打印纸张大小，1代表纵向打印
	LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
	LODOP.ADD_PRINT_HTM(40, 60,"80%","85%",$('#fenyeone').html());
	LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
	LODOP.NEWPAGE();
	LODOP.ADD_PRINT_HTM(40, 60,"80%","85%",$('#fenyetwo').html())
	LODOP.NEWPAGE();
	LODOP.ADD_PRINT_HTM(40, 60,"80%","85%",$('#fenyethree').html())
	

}
</script>
</body>
</html>