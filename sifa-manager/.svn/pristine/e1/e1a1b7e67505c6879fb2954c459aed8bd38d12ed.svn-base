<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
			
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
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
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('dingwei_PrintMsg'));
    LODOP.PRINT_INIT("打印社区服刑人员电子定位监控管理告知书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(50,60,"70%","100%",document.getElementById('dingweiPrint').innerHTML);
    LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);

}

</script>
<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
	<div id="idControls" style="text-align:center;margin-top:10px;display:none;">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="dingwei_PrintBtn" onclick="preview()">打印当前页</a> 
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#schemeDialog').dialog('close');">关闭</a> -->
	</div>
	<div id="dingwei_PrintMsg"></div>
	<div id="dingweiPrint">
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:24px;margin-top:50px;text-align: center;font-weight:bold;">
				社区服刑人员电子定位监控管理告知书
			</div>
			<div style="margin-top:40px;text-align:left;line-height:40px;">
			
			</div>
			<div style="text-indent:28px;letter-spacing:3px;line-height:40px;margin:0;">
			根据《社区矫正实施办法》和《广西自治区社区矫正实施细则（试行）》有关规定，社区服刑人员必须遵守如下规定：
			</div>
			<div  style="text-indent:28px;line-height:40px;margin:0;">
			一、必须随身携带电子定位终端监控设备，并保持在正常的良好状态；
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			二、接到矫正机构发送的工作短信、管理指令或电话后，必须及时回复短信、接听电话；
			</div>
			<div  style="margin:0;text-indent:28px;line-height:40px;">
			三、如果电子设备无法正常使用，应及时向司法所报告并维修；
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			四、未经批准不准擅自离开规定的活动区域；
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			五、不得有其他故意逃避监督管理行为；
			</div>
			<div style="margin:0;text-indent:28px;line-height:40px;">
			六、违反以上情形之一的应当接受处罚。
			</div>
			<div style="text-align:right;line-height:40px;margin-right:40px;margin-top:80px;">
			司法所(公章)
			</div>
			<div style="text-align:right;line-height:40px;margin-right:40px;margin-bottom:20px;">
			<fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" />
			</div>
			<div style="text-align:left;line-height:40px;margin-right:40px;margin-bottom:40px;">
			以上内容我已知晓并保证严格遵守。
			</div>
			<div  style="margin-top:30px;text-align:left;line-height:40px;margin-right:40px;">
				社区服刑人员（签名捺手印）：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:100px;" readonly="readonly"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日
			</div>
		</div>
	</div>	
</div>

	