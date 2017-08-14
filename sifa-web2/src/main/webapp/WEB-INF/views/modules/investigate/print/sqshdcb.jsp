<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>

<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

<form action="" method="post" id="">
	<input type="hidden" name="id" value="${investigate.id}" />

	<div id="investigate_PrintMsg2"></div>

	<div class="easyui-panel" id="sqshdcbPrint"
		style="width: 100%; border: 0" align="center">
		<div
			style="width: 165mm; font-size: 16px; font-family: FangSong_GB2312; border: 0">
			<div id="fenye">
				<!-- 	<br><br><br><br><br><br><br><br><br><br><br><br><br> -->
				<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 150px;"></span>
				</div>
				<div style="text-align: center; font-size: 39px;">
					<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;柳州市社区矫正审前社会调查表</span>
				</div>


				<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 240px;"></span>
				</div>



				<div
					style="margin-left: 110px; text-align: center; font-size: 28px;">
					<span style="font-weight: bold;">&nbsp;调查对象姓名&nbsp;&nbsp;：<span
						style="text-align: center; display: inline-block; width: 230px; border-bottom: 1px solid #333;">${investigate.name }</span></span>
				</div>
				
				<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 10px;"></span>
				</div>
				
				<div
					style="margin-left: 110px; text-align: center; font-size: 28px;">
					<span style="font-weight: bold;">&nbsp;调&nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;单&nbsp;&nbsp;位&nbsp;&nbsp;：<span
						style="text-align: center; display: inline-block; width: 230px; border-bottom: 1px solid #333;">${investigate.sfsGroupName }</span></span>
				</div>
					<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 10px;"></span>
				</div>
				<div
					style="margin-left: 110px; text-align: center; font-size: 28px;">
					<span style="font-weight: bold;">&nbsp;&nbsp;填&nbsp;&nbsp;&nbsp;表&nbsp;&nbsp;日&nbsp;&nbsp;期&nbsp;&nbsp;：
						<span style="text-align: center; display: inline-block; width: 230px; border-bottom: 1px solid #333;"><fmt:formatDate
								value="${investigate.endTime }" pattern="yyyy年MM月dd日" /></span>
					</span>
				</div>
				
				<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 220px;"></span>
				</div>
				<div style="text-align: center;">
					<span style="font-weight: bold; font-size: 28px;">柳州市司法厅监制</span>
				</div>
				<div style="text-align: center;">
					<span style="font-weight: bold; display: block; height: 120px;"></span>
				</div>
			</div>
			<div id="fenyeone">
				<table width="100%"
					style="border-collapse: collapse; border-spacing: 0; border-left: 1px solid; border-top: 1px solid; text-align: center;">

					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="8" rowspan="2" width="8%">调<br>查<br>人<br>员
						</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18" width="18%">姓名</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="28" width="28%">${investigate.investigator1 }</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12" width="12%">单位职务</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="34" width="34%">${investigate.position1 }</td>
					</tr>
					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18">姓名</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="28">${investigate.investigator2 }</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12">单位职务</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="34">${investigate.position2 }</td>
					</tr>

					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="8" rowspan="5">调<br>查<br>对<br>象
						</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18">姓名</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12">${investigate.name }</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="7">性别</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="7">&nbsp;&nbsp;${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }&nbsp;&nbsp;</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="7">民族</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="7	">${fns:getSysDicValueByKey('common_table', 'nation', investigate.nation, '') }</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12">出生年月</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="22"><fmt:formatDate value="${investigate.bornDate}"
								pattern="yyyy年MM月dd日" /></td>
					</tr>
					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18" width="18%">曾用名</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12" width="12%">${investigate.oldName}</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 100px"
							colspan="10" width="10%" rowspan="2">身份<br>证号</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 100px"
							colspan="30" width="30%" rowspan="2">${investigate.relevantNumber}</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 100px"
							colspan="8" width="8%" rowspan="2">籍贯</td>

						<td id="sqdcb_jiguan"
							style="border-right: 1px solid; border-bottom: 1px solid; height: 100px"
							colspan="14" width="14%" rowspan="2"><c:choose>
								<c:when
									test="${ investigate.originProId == '1110000' || investigate.originProId == '1120000' 
									|| investigate.originProId == '1500000' || investigate.originProId == '1310000' }">
								${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }
								</c:when>
								<c:otherwise>
									${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }${fns:getAreaValueById(investigate.originCountryId, '')}
								</c:otherwise>
							</c:choose></td>


					</tr>
					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18">别名</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12">${investigate.alias}</td>
					</tr>
					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18">家庭住址</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="22"><c:choose>
								<c:when
									test="${ investigate.addressProId == '1110000' || investigate.addressProId == '1120000' 
									|| investigate.addressProId == '1500000' || investigate.addressProId == '1310000' }">
						 	${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${investigate.addressStreet}${investigate.addressDetail}	
						</c:when>
								<c:otherwise>
							${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${fns:getAreaValueById(investigate.addressCountryId, '') }${investigate.addressStreet}${investigate.addressDetail}
						</c:otherwise>
							</c:choose></td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="12">联系电话</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18">${investigate.contactPhone }</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8">职业</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="14">${investigate.job }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18">经常居住地</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="22"><c:choose>
								<c:when
									test="${ investigate.habitualResidenceProId == '1110000' || investigate.habitualResidenceProId == '1120000' 
									|| investigate.habitualResidenceProId == '1500000' || investigate.habitualResidenceProId == '1310000' }">
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}	
						</c:when>
								<c:otherwise>
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${fns:getAreaValueById(investigate.habitualResidenceCountryId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}
						</c:otherwise>
							</c:choose></td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="12">联系电话</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18">${investigate.contactPhone }</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="8">案由</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="14">${investigate.crimeReason }</td>
					</tr>
					<tr>
						<c:if test="${listSize == 0}">
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8" width="8%" rowspan="6">家<br>庭<br>背<br>景
							</td>
							<td
								style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
								colspan="18" width="20%" rowspan="3">家庭成员</td>
						</c:if>
						<c:if test="${listSize != 0}">
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="10" width="10%" rowspan="${listSize + 4}">家<br>庭<br>背<br>景
							</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="10" width="10%" rowspan="${listSize + 1}">家庭成员</td>
						</c:if>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8"height="50px;" width="8%">关系</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="10" height="50px;"width="10%">姓名</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" height="50px;"width="8%">年龄</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" height="50px;"width="8%">职业</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="26" height="50px;"width="26%">住址</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="14"height="50px;" width="14%">联系方式</td>
					</tr>
					<c:if test="${listSize == 0}">
						<tr height="50px;">
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="26"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="14"></td>
						</tr>
						<tr height="50px;">
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="10"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="26"></td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="14"></td>
						</tr>
					</c:if>

					<c:forEach var="investigateFamily" items="${list}">
						<tr>

							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8">${fns:getSysDicValueByKey('sf_investigate_family', 'dic_relation_key', investigateFamily.dicRelationKey, '') }</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="10">${investigateFamily.name }</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8">${investigateFamily.age }</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="8">${investigateFamily.job }</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="26">${investigateFamily.address }</td>
							<td style="border-right: 1px solid; border-bottom: 1px solid;"
								colspan="14">${investigateFamily.phone }</td>
						</tr>
					</c:forEach>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="100px">家庭成员与调查对象相处情况</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.familySituation }</td>
					</tr>
					<tr>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; height: 50px"
							colspan="18" height="100px">家庭经济状况</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.economicStatus }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="100px">家庭成员与调查对象相处情况</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.minorOtherCases }</td>
					</tr>




				</table>
			</div>


			<br>
			<div id="fenyetwo">
				<table width="100%"
					style="border-collapse: collapse; border-spacing: 0; border-left: 1px solid; border-top: 1px solid; text-align: center;">

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" rowspan="4" width="8%">个<br>性<br>特<br>点
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" width="18%" height="50px">生理状况</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74" width="74%">${investigate.physiConditions }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">心理特征</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.psychFeature }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">性格类型</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.mettleType }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">爱好特长</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.hobbies }</td>
					</tr>


					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" rowspan="5">犯<br>罪<br>前<br>表<br>现
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">工作(学习)表现</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.display }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">业余生活</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.amateurLife }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">邻里关系</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.neighborhoodRelations }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">社会交往</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.socialInteraction }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">违纪违法情况</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.badFact }</td>
					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" rowspan="4">悔<br>罪<br>表<br>现
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">对犯罪行为的认识</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.crimeAcquaint }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">悔过态度</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.repentantAttitude }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">罚金刑履行情况及履行能力</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.fineFulfillAbility }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">附带民事赔偿履行情况及履行能力</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.reparationFulfillAbility }</td>
					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" rowspan="2">社<br>会<br>反<br>响
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">被害人或其亲属态度</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.victimAttitude }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">社会公众态度</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.publicAttitude }</td>
					</tr>
				</table>
			</div>
			<br>
			<div id="fenyethree">
				<table width="100%"
					style="border-collapse: collapse; border-spacing: 0; border-left: 1px solid; border-top: 1px solid; text-align: center;">

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" rowspan="3" width="8%">监<br>管<br>条<br>件
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" width="18%" height="50px">家庭成员态度</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74" width="74%">${investigate.familyAttitude }</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18" height="50px">生活环境</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: center; text-indent: 2em;"
							colspan="74">${investigate.lifeEnvironment }</td>
					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="18">村（居、社区）基层组织意见</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="74" height="150px">见附件</td>
						<%-- <span style="display: block; height: 50px; text-align: left; text-indent: 2em;">${investigate.basicView }<br></span> --%>
						<!-- <span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
							<span style="display: block; height: 10px;"><br></span>-->

					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8" width="8%">公<br>安<br>派<br>出<br>所<br>意<br>见
						</td>
						<td
							style="border-right: 1px solid; border-bottom: 1px solid; text-align: left; text-indent: 6em;"
							colspan="92" width="92%" height="200px">见附件 <%-- <span
							style="display: block; height: 100px; text-align: center; text-indent: 2em;">${investigate.policeView }<br></span>
							<span style="padding-left: 60%;">负责人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</span>
							<span style="display: block; height: 10px;"><br></span> --%>
						</td>
					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8">司<br>法<br>所<br>意<br>见
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="92"><br> <br>
							<div style="text-align: left; text-indent: 6em;">具体意见:</div> 
							<br><br>
							<div style="text-align: left; text-indent: 4em;">${sfsyj}</div> <span
							style="display: block; height: 20px;"><br></span> <span
							style="padding-left: 60%; text-align: left; text-indent: 2em;">负责人签名：${sfsname}</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">${sfsdate}</span> <span
							style="display: block; height: 10px;"><br></span></td>
					</tr>

					<tr>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="8">县<br>级<br>司<br>法<br>行<br>政<br>机<br>关<br>意<br>见
						</td>
						<td style="border-right: 1px solid; border-bottom: 1px solid;"
							colspan="92" height="250px"><br>
							<div style="text-align: left; text-indent: 6em;">具体意见:</div> <br>
							<br>
							<div style="text-align: left; text-indent: 4em;">${xfgyj}</div> <span
							style="display: block; height: 20px; text-align: left; text-indent: 2em;"><br></span>
							<span style="padding-left: 60%;">负责人签名：${xfgname}</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;盖&nbsp;&nbsp;章&nbsp;)</span><br>
							<span style="display: block; height: 10px;"><br></span> <span
							style="padding-left: 60%;">${xfgdate}</span> <span
							style="display: block; height: 10px;"><br></span></td>
					</tr>

					<tr style="display: none;">
						<td align="center"><a id="investigatePrintBtn2"
							class="easyui-linkbutton">打印审前社会调查表</a></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
	/* 	var jiguan=$('#sqdcb_jiguan').value;
		
		if(jiguan=='undefined'||jiguan==null||jiguan=='')
		{
			$('#sqdcb_jiguan').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		}
	 */

	$(function()
	{
	});

	$('#investigatePrintBtn2').click(function()
	{
		CreatePrintPage();
		LODOP.PREVIEW();

	});

	//创建打印页面
	function CreatePrintPage()
	{
		LODOP = getLodop(document.getElementById('LODOP_OB'), document
				.getElementById('LODOP_EM'), document
				.getElementById('investigate_PrintMsg2'));
		LODOP.PRINT_INIT("打印审前社会调查表");
		//设置打印纸张大小，1代表纵向打印
		LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
		LODOP.ADD_PRINT_HTM(40, 60, "80%", "85%", $('#fenye').html());

		LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
		LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
		LODOP.SET_PRINT_STYLEA(0, "TableHeightScope", 1);
		LODOP.NEWPAGE();
		LODOP.ADD_PRINT_HTM(40, 60, "80%", "85%", $('#fenyeone').html());
		LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第1页/共3页");

		LODOP.NEWPAGE();
		LODOP.ADD_PRINT_HTM(40, 60, "80%", "85%", $('#fenyetwo').html());
		LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第2页/共3页");

		LODOP.NEWPAGE();
		LODOP.ADD_PRINT_HTM(40, 60, "80%", "85%", $('#fenyethree').html());
		LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第3页/共3页");

	}
</script>