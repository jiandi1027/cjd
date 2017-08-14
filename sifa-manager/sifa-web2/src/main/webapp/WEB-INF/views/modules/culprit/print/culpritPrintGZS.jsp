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
 function preview(installMsgId){
	 CreatePrintPage(installMsgId);
	 LODOP.PREVIEW();
} 

//创建打印页面
function CreatePrintPage(installMsgId){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),installMsgId);
    LODOP.PRINT_INIT("打印告知书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,70,"70%","100%",document.getElementById('culpritGZSPrint').innerHTML);
/*     LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1); */
    //LODOP.PREVIEW();
}

  </script>
	<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div style="display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printCulpritGZSBtn" onclick="preview(culpritGZS_PrintMsg)">打印当前页</a> 
		</div>
		<div id="culpritGZS_PrintMsg"></div>
	    <div id="culpritGZSPrint">
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:30px;margin-top:20px;text-align: center;">
				<b>告知书</b>
			</div>
			<p style="margin-top:40px;line-height:30px;padding:0;                                                                                                                                                                                                                                                                                                                                           ">
				社区矫正人员${culprit.name }：
			</p>
			<p style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				你已于 <fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" /> 到我局报到，
				根据《社区矫正实施办法》规定，限你于<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" /> 前到松台司法所进行报到，否则你将承担相应的法律责任。
			</p>
			<p style="margin-top:300px;text-indent:30px;margin-right:100px;text-align:right;">
				社区矫正人员签名：
			</p>
			<p  style="margin-top:40px;text-align:right;padding:0;">
				<fmt:formatDate value="${nowDate}" pattern="yyyy年MM月dd日" />
			</p>
			<p style="line-height:30px;padding:0;margin: 0;font-size:14px;">
				注：本告知书一式两份，一份给社区矫正人员，一份留底存档。 
			</p>
		</div>
		</div>
	</div>

