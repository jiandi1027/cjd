<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
    <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview_outOfPrisonYiXue(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('outOfPrisonYiXue_PrintMsg'));
    LODOP.PRINT_INIT("撤销缓刑审批表");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#outOfPrisonYiXuePrint').html());
    /* LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
}
</script>

	<div>
		<div style="text-align:center;margin-top:10px;display:none;">
			&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="outOfPrisonYiXuePrintBtn" onclick="preview_outOfPrisonYiXue()">打印当前页</a>  
			&nbsp;&nbsp;
			注：红色下划线处可输入内容
		</div>
		<div id="outOfPrisonYiXue_PrintMsg"></div>
		<div id="outOfPrisonYiXuePrint">
		<div style="font-family:FangSong_GB2312;font-size:19px;
		margin-top:40px;width:165mm;height: 200mm;border:0;margin:0 auto;">
			<div style="font-size:24px;margin-top:20px;text-align: center;font-weight: bold;">
				社区矫正人员医学司法鉴定委托书
			</div>
			<div style="margin-top:20px;line-height:38px;">
				<span><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:150px;font-size:18px;" readonly="readonly"/></span>
				人民医院：
			</div>
			<div style="font-size:19px;text-indent:28px;line-height:38px;">
				<span>根据《社区矫正实施办法》和我省罪犯保外就医工作的相关规定，以及当事人申请，请贵单位指派鉴定人(3人)，按照下列鉴定目的对社区矫正人员进行医学司法鉴定。</span>
			</div>
			<div style="font-size:19px;text-indent:28px;line-height:38px;">
				鉴定对象姓名：${culprit.name}，
				性别：${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，
				出生日：<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />，
				文化程度：${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}，
				籍贯：${culprit.origin}，
				家庭住址：${culprit.regResidence}。
			</div>

			<div style="margin-top:10px;text-indent:28px;line-height:30px;">
				委托鉴定目的<input  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:76%;" readonly="readonly"/>
			</div> 
			<c:forEach begin="1" end="5">
				<div style="margin-top:10px;line-height:30px;">
				<span><input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:100%;" readonly="readonly"/></span>
				</div>
			</c:forEach>
			
			
			<div style="font-size:19px;margin-top:10px;text-indent:28px;line-height:30px;">
				请贵单位于
				<span><input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:50px;" readonly="readonly"/></span>
				年
				<span><input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:50px;" readonly="readonly"/></span>
				月
				<span><input type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid ;width:50px;" readonly="readonly"/></span>
				日以前出具医学司法鉴定书。 
			</div>
			
			<div style="font-size:19px;text-indent:45px;margin-top:60px;margin-left:200px;line-height:30px; text-align:left;">
				委托单位（章）：
			</div>
			<div style="font-size:19px;text-indent:45px;margin-top:30px;line-height:30px; margin-left:200px;text-align:left;">
				委托日期：
				<span ><input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:50px;" /></span>
				年
				<span ><input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:50px;" /></span>
				月
				<span ><input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid;width:50px;" /></span>
				日
			</div>
			<div 
				style="font-size:19px;text-indent:45px;margin-top:30px;margin-left:200px;line-height:30px; text-align:left;">
				联系人：
			</div>
			<div 
				style="font-size:19px;text-indent:45px;margin-top:30px;margin-left:200px;line-height:30px; text-align:left;">
				联系电话：
			</div>
		</div>
	</div>
	
</div>
