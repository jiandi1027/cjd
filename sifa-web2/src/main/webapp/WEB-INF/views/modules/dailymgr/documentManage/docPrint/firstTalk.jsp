<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
	<div id="firstTalk_PrintMsg"></div>
	<div style="display: none;">
		<a id="talkPrintBtn1" class="easyui-linkbutton">打印</a>
	</div>
			
	<div class="easyui-panel" id="firistTalkPrint" style="width:100%;border:0" align="center">
		<div style="width:165mm;font-size: 16px;font-family: FangSong_GB2312;border:0">
		
		<div style="text-align: center;"><span style="font-weight: bold;font-size: 24px;">社区服刑人员首次谈话记录</span></div>
		<div style="text-align: center;"><span style="font-weight: bold;display: block;height: 40px;"></span></div>
		
		<table width="100%" style="border-collapse:collapse;border:1px solid;text-align: left;width:670px;">
			<tr>
				<td>谈话时间：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:40%;" value="<fmt:formatDate value='${talk.talkTime }' pattern="yyyy年MM月dd日" />" readonly="readonly"/>
				地点：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:39%;" value="${talk.place}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>谈话人：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:40%;" value="${talk.talkor }" readonly="readonly"/>
				记录人：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:39%;" value="${talk.recorder }" readonly="readonly"/></td>
			</tr>
			
			<tr>
				<td>社区服刑人员：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:20%;" value="${culprit.name }" readonly="readonly"/>
				性别<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:20%;" value="${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}" readonly="readonly"/>
				出生日期：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:23%;" value="<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>文化程度：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:30%;" value="${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}" readonly="readonly"/>
				联系电话：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:44%;" value="${culprit.contactPhone }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>户籍所在地：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:84%;" value="${culprit.regResidence }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td >现居住地：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:87%;" value="${culprit.address }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>
				<textarea multiline="true"  readonly="readonly" id="textarea_record" 
					style="text-align:left;width:98%;outline: none;border:0 none;overflow-x:hidden;overflow-y:hidden;font-size: 16px;font-family: FangSong_GB2312;">${talk.record }</textarea>
				<div  style="text-align:left;line-height:40px;margin-right:40px;margin-bottom:40px;">
				社区服刑人员（签名捺手印）：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:25%;" readonly="readonly"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</div>
				</td>
			</tr>
		</table>
		</div>
    </div>
    
</form>
<script type="text/javascript">
$(function() {
	var h=document.getElementById("textarea_record").scrollHeight;
	console.log(h);
	  h = h > 850 ? 1800 : h;
	  document.getElementById("textarea_record").style.height = h+"px";
	  console.log(h);
});

$('#talkPrintBtn1').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('firstTalk_PrintMsg'));
	LODOP.PRINT_INIT("打印首次谈话记录");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,50,"70%","100%",$('#firistTalkPrint').html());
	//LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	//LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	//LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	//LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
</body>
</html>