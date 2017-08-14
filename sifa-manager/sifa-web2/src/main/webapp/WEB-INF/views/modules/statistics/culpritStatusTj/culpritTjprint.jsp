<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(installMsgId){
	 CreatePrintPage(installMsgId);
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(installMsgId){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),installMsgId);
    LODOP.PRINT_INIT("");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,30,"70%","100%",document.getElementById('TJPrint').innerHTML);
    /* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);  */
    //LODOP.PREVIEW();
    LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
}

 </script>
<div style="margin:0 2px;padding:0;font-size:16px;font-family:Arial, Helvetica, sans-serif;">
	<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printTjBtn1" onclick="preview(TJ_PrintMsg)">打印当前页</a> 
	</div>
	<div id="TJ_PrintMsg"></div>
	<div class="easyui-panel" id="TJPrint" style="width:100%;border:0;" align="center">
		<div style="font-size:24px;font-weight:bold;text-align:center;width:1100px;">
		社区矫正人员情况统计表（<fmt:formatDate value="${culpritStatusTj.reportDate}"
									pattern="yyyy年MM月" />）（试行）
		</div>
		<table width="100%" style="margin-top:10px;border-collapse:collapse;text-align: left;width:1050px;">
		<tr style="font-size:19px;font-weight:bold;">
			<td>填报单位：${culpritStatusTj.groupName}</td>
			<td>负责人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>制表人：${creater}</td>
			<c:choose>
			<c:when test="${culpritStatusTj.reporttime eq null}">
			<td style="text-align: right">填报时间：<fmt:formatDate value="${reportTime}"
										pattern="yyyy年MM月dd日" /></td>
			</c:when>
			<c:otherwise>
			<td style="text-align: right">填报时间：<fmt:formatDate value="${culpritStatusTj.reporttime}" pattern="yyyy年MM月dd日" /></td>
			</c:otherwise>
			</c:choose>
		</tr>
		</table>

	<table width="100%" id="get1" style="border-collapse:collapse;border:1px solid;text-align: left;width:1050px;" >
	<tr style="text-align: center;">
		<td rowspan=5 width="4%" style="border-right: 1px solid;border-bottom: 1px solid;">
			<div style="padding-bottom:20px;">地</div>
			<div style="padding-top:180px;">区</div>
		</td>
		<td rowspan=3 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">本<br/>月<br/>在<br/>册<br/>人<br/>数</td>
		<td rowspan=3 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">上<br/>月<br/>在<br/>册<br/>人<br/>数</td>
		<td colspan=5 width="10%" style="border-right: 1px solid;border-bottom: 1px solid;">变动情况</td>
		<td colspan=5 width="10%" style="border-right: 1px solid;border-bottom: 1px solid;">类别</td>
		<td colspan=9 width="18%" style="border-right: 1px solid;border-bottom: 1px solid;">犯罪类型</td>
		<td colspan=3 width="6%" style="border-right: 1px solid;border-bottom: 1px solid;">户籍</td>
		<td colspan=2 width="4%" style="border-right: 1px solid;border-bottom: 1px solid;">性别</td>
		<td colspan=2 width="4%" style="border-right: 1px solid;border-bottom: 1px solid;">民族</td>
		<td colspan=4 width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">年龄情况</td>
		<td colspan=4 width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">文化结构</td>
		<td colspan=3 width="6%" style="border-right: 1px solid;border-bottom: 1px solid;">就业、就学情况</td>
		<td colspan=4 width="8%" style="border-right: 1px solid;border-bottom: 1px solid;">奖惩情况</td>
		<td rowspan=3 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">截<br/>止<br/>本<br/>月<br/>脱<br/>管</td>
		<td rowspan=3 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">本<br/>月<br/>重<br/>新<br/>犯<br/>罪</td>
		<td colspan=3 width="6%" style="border-right: 1px solid;border-bottom: 1px solid;">累计项目</td>
	</tr>
	<tr style="text-align: center;">
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">本<br/>月<br/>增<br/>加</td>
		<td colspan=4 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">本月减少</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">管<br/>制</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">缓<br/>刑</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">假<br/>释</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">暂<br/>予<br/>监<br/>外<br/>执<br/>行</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">剥<br/>夺<br/>政<br/>治<br/>权<br/>利</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">危<br/>害<br/>国<br/>家<br/>安<br/>全<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">危<br/>害<br/>公<br/>共<br/>安<br/>全<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">破<br/>坏<br/>社<br/>会<br/>主<br/>义<br/>市<br/>场<br/>经<br/>济<br/>秩<br/>序<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">侵<br/>犯<br/>公<br/>民<br/>人<br/>身<br/>权<br/>利<br/>、<br/>民<br/>主<br/>权<br/>利<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">侵<br/>犯<br/>财<br/>产<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">妨<br/>害<br/>社<br/>会<br/>管<br/>理<br/>秩<br/>序<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">贪<br/>污<br/>受<br/>贿<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">渎<br/>职<br/>罪</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">其<br/>他</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">城<br/>镇<br/>户<br/>口</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">农<br/>村<br/>户<br/>口</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">其<br/>他</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">男<br/>性</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">女<br/>性</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">汉<br/>族</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">少<br/>数<br/>民<br/>族</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">未<br/>满<br/>18<br/>周<br/>岁</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">18<br/>至<br/>45<br/>周<br/>岁</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">46<br/>至<br/>60<br/>周<br/>岁</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">61周<br/>岁<br/>以<br/>上</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">大<br/>专<br/>及<br/>以<br/>上</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">高<br/>中</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">初<br/>中</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">小<br/>学<br/>及<br/>以<br/>下</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">在<br/>校<br/>就<br/>读</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">就<br/>业</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">无<br/>业</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">社<br/>区<br/>矫<br/>正<br/>机<br/>构<br/>奖<br/>励</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">社<br/>区<br/>矫<br/>正<br/>机<br/>构<br/>处<br/>罚</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">裁<br/>定<br/>减<br/>刑</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">受<br/>治<br/>安<br/>处<br/>罚</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">累<br/>计<br/>接<br/>收</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">累<br/>计<br/>解<br/>除<br/>矫<br/>正</td>
		<td rowspan=2 width="2%" style="border-right: 1px solid;border-bottom: 1px solid;">累<br/>计<br/>重<br/>新<br/>犯<br/>罪</td>
	</tr>
	<tr style="text-align: center;">
		<td style="border-right: 1px solid;border-bottom: 1px solid;">期<br/>满<br/>解<br/>除<br/>矫<br/>正</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">收<br/>监<br/>执<br/>行</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">死<br/>亡</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">其<br/>他</td>
	</tr>
	<tr style="text-align: center;">
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
		<td  style="border-right: 1px solid;border-bottom: 1px solid;">人</td>
	</tr>
	<tr style="text-align: center;">
		<td style="border-right: 1px solid;border-bottom: 1px solid;">1</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">2</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">3</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">4</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">5</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">6</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">7</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">8</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">9</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">10</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">11</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">12</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">13</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">14</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">15</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">16</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">17</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">18</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">19</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">20</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">21</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">22</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">23</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">24</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">25</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">26</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">27</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">28</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">29</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">30</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">31</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">32</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">33</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">34</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">35</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">36</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">37</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">38</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">39</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">40</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">41</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">42</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">43</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">44</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">45</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">46</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">47</td>
		<td style="border-right: 1px solid;border-bottom: 1px solid;">48</td>
		</tr>
	 <c:forEach items="${childTjList}" var="culpritStatusTj">
	<c:if test="${culpritStatusTj.dicState eq 91801}"> 
		<tr  style="text-align: center;">
			<td style="border-right: 1px solid;border-bottom: 1px solid;">
			${culpritStatusTj.groupName}
			</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.byzcrs}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.syzcrs}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.change_byzj}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.change_qmjcjz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.change_sjzx}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.change_sw}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.change_qtyy}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.class_gz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.class_hx}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.class_js}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.class_zyjwzx}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.class_bdzzql}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_whgjaqz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_whggaqz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_phshzyz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_qfgmrsqlz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_qfccz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_fhshglzxz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_twhlz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_dzz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.type_other}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.reg_city}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.reg_village}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.reg_other}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.sex_male}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.sex_female}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.nation_han}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.nation_few}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.age_u18}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.age_19to45}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.age_46to60}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.age_61p}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.qualification_junior}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.qualification_senior}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.qualification_middle}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.qualification_primary}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.work_study}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.work_on}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.work_nojob}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.praise_sqjl}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.praise_sqcf}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.praise_cdjx}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.praise_szacf}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.jzbytg}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.zfxz}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.total_accept}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.total_relieve}</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;">${culpritStatusTj.total_crime_again}</td>
		</tr>
		</c:if>
		</c:forEach>
		<c:forEach items="${childTjList}" var="culpritStatusTj">
		<c:if test="${culpritStatusTj.dicState eq 91802 && groupleavel ne 2}"> 
		<tr  style="text-align: center;">
			<td style="border-right: 1px solid;border-bottom: 1px solid;">
			<span style="color:#FF0000">${culpritStatusTj.groupName}<br/>(未上报)</span>
			</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"></td>
		</tr>
		</c:if> 
		</c:forEach> 
		<tr style="text-align: center;">
			<td style="border-right: 1px solid;border-bottom: 1px solid;">
			合计&nbsp;
			</td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="byzcrs">${culpritStatusTj.byzcrs}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="syzcrs">${culpritStatusTj.syzcrs}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="change_byzj">${culpritStatusTj.change_byzj}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="change_qmjcjz">${culpritStatusTj.change_qmjcjz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="change_sjzx">${culpritStatusTj.change_sjzx}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="change_sw">${culpritStatusTj.change_sw}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="change_qtyy">${culpritStatusTj.change_qtyy}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="class_gz">${culpritStatusTj.class_gz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="class_hx">${culpritStatusTj.class_hx}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="class_js">${culpritStatusTj.class_js}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="class_zyjwzx">${culpritStatusTj.class_zyjwzx}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="class_bdzzql">${culpritStatusTj.class_bdzzql}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_whgjaqz">${culpritStatusTj.type_whgjaqz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_whggaqz">${culpritStatusTj.type_whggaqz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_phshzyz">${culpritStatusTj.type_phshzyz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_qfgmrsqlz">${culpritStatusTj.type_qfgmrsqlz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_qfccz">${culpritStatusTj.type_qfccz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_fhshglzxz">${culpritStatusTj.type_fhshglzxz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_twhlz">${culpritStatusTj.type_twhlz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_dzz">${culpritStatusTj.type_dzz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="type_other">${culpritStatusTj.type_other}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="reg_city">${culpritStatusTj.reg_city}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="reg_village">${culpritStatusTj.reg_village}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="reg_other">${culpritStatusTj.reg_other}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="sex_male">${culpritStatusTj.sex_male}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="sex_female">${culpritStatusTj.sex_female}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="nation_han">${culpritStatusTj.nation_han}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="nation_few">${culpritStatusTj.nation_few}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="age_u18">${culpritStatusTj.age_u18}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="age_19to45">${culpritStatusTj.age_19to45}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="age_46to60">${culpritStatusTj.age_46to60}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="age_61p">${culpritStatusTj.age_61p}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="qualification_junior">${culpritStatusTj.qualification_junior}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="qualification_senior">${culpritStatusTj.qualification_senior}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="qualification_middle">${culpritStatusTj.qualification_middle}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="qualification_primary">${culpritStatusTj.qualification_primary}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="work_study">${culpritStatusTj.work_study}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="work_on">${culpritStatusTj.work_on}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="work_nojob">${culpritStatusTj.work_nojob}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="praise_sqjl">${culpritStatusTj.praise_sqjl}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="praise_sqcf">${culpritStatusTj.praise_sqcf}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="praise_cdjx">${culpritStatusTj.praise_cdjx}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="praise_szacf">${culpritStatusTj.praise_szacf}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="jzbytg">${culpritStatusTj.jzbytg}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="zfxz">${culpritStatusTj.zfxz}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="total_accept">${culpritStatusTj.total_accept}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="total_relieve">${culpritStatusTj.total_relieve}</span></td>
			<td style="border-right: 1px solid;border-bottom: 1px solid;"><span id="total_crime_again">${culpritStatusTj.total_crime_again}</span></td>
		</tr>
	</table>
	</div>
	
	<c:if test="${culpritStatusTj.dicState eq 91803 }">
		<div class="easyui-panel" style="width:100%;border:0;font-family:Arial, Helvetica, sans-serif;" align="center" >
			<table width="100%" class="grid" style="margin-top:50px;border-collapse:collapse;text-align: left;width:1000px;">
					<tr style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">报表状态：</th>
						<td style="border:1px solid">退回</td>
					</tr>
					<tr style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">退回时间：</th>
						<td style="border:1px solid"><fmt:formatDate value="${culpritStatusTj.returnTime}"
									pattern="yyyy年MM月dd日" /></td>
					</tr>
					<tr  style="font-size:16px;font-weight:bold;">
						<th width="10%" style="border:1px solid">退回原因：</th>
						<td style="border:1px solid"><textarea readOnly=true style="width:800px;height:80px;border:0 none">${culpritStatusTj.returnReason }</textarea>
						</td>
					</tr>
			</table>
		</div>
	</c:if>
</div>