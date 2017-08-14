<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
			
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
				/* height: 244mm; */
				height: 200mm;
				border: 0;
				margin-right: auto; 
				margin-left: auto;
			}
			
			.bold{
			text-align:center;
			}
</style>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object> 
<script type="text/javascript">

var LODOP; //声明为全局变量 
//打印当前页
 function preview(){
	 CreatePrintPage();
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('sqjzzrs_PrintMsg'));
    LODOP.PRINT_INIT("打印社区矫正小组责任书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1,0, 0, "A4");
    LODOP.ADD_PRINT_HTM(50,60,"70%","100%",document.getElementById('sqjzzrsPrint').innerHTML);
    LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);

}

</script>
<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
	<div id="idControls" style="text-align:center;margin-top:10px;display:none;'">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="sqjzzrs_printBtn" onclick="preview()">打印当前页</a> 
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#schemeDialog').dialog('close');">关闭</a> -->
	</div>
	<div id="sqjzzrs_PrintMsg"></div>
	<div id="sqjzzrsPrint">
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:24px;margin-top:50px;text-align: center;font-weight:bold;">
				社区矫正小组责任书
			</div>
			<div style="margin-top:30px;text-indent:28px;line-height:40px;">
			为了共同做好对社区矫正人员<b>${culprit.name }</b>的监督管理和教育帮助，提高矫正质量，<b>${culprit.groupName }</b>与矫正小组签订本责任书，共同遵守。
			</div>
			<div style=" text-align:left;line-height:40px;">
				<b>一、司法所具体做好以下事项：</b>
			 </div>
			<div style="text-indent:28px;line-height:40px;">
				1、指导矫正小组对社区矫正人员进行监督管理和教育帮助；
			</div>
			<div style="text-indent:28px;line-height:40px;">
				2、认真听取矫正小组成员反映的情况并及时处理有关事宜。
			</div>
			<div style=" text-align:left;line-height:40px;">
				<b>	二、矫正小组具体做好以下事项：</b>
			</div>
			<div style="text-indent:28px;line-height:40px;">
				1、协助对社区矫正人员进行监督管理和教育帮助；
			</div>
			<div  style="text-indent:28px;line-height:40px;">
				2、督促社区矫正人员按要求向司法所报告有关情况、参加学习及社区服务，自觉遵守有关监督管理规定；
			</div>
			<div style="text-indent:28px;line-height:40px;">
				3、定期向司法所反映社区矫正人员遵纪守法、学习、日常生活和工作等情况；
			</div>
			<div style="text-indent:28px;line-height:40px;">
				4、发现社区矫正人员有违法犯罪或违反监督管理规定的行为，及时向司法所报告；
			</div>
			<div style="text-indent:28px;line-height:40px;">
		   		5、根据小组成员所在单位和身份确定的其他社区矫正事项。
		   </div>
			<div style="margin-right:150px;margin-top:40px;line-height:40px;text-align:right;">
				矫正小组（成员签字）：
			</div>
			<div style="margin-top:40px;margin-right:40px;text-align:right;">
			<fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" />
			
			</div>
		</div>
	</div>	
</div>

