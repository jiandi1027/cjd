<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>
<style type="text/css">
*{ margin:0; padding:0;}
.page-form{ width:978px; height:648px; margin:0 auto; padding:54px; font-family:'仿宋_GB2312'; line-height:150%;}
.page-form h1{ font-size:14px; font-weight:normal; font-family:'宋体'; text-align:center; padding:15px 0;}
.page-form ul, .page-form li{ list-style:none;}
.page-form li span{ text-decoration:underline;}

</style>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
var LODOP; //声明为全局变量 
$(function() {
	
});

$('#askLeavePrintBtn1').click(function (){
	CreatePrintPage();
	LODOP.PREVIEW();
});

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('askLeaveTable_PrintMsg'));
    LODOP.PRINT_INIT("打印解除社区矫正证明书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#askLeaveTable').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
<form action="" method="post" id="">
	<div class="page-form">
   	  <div class="page-wrap">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse;" >
        	<tr>
            	<td width="50">&nbsp;</td>
            	<td width="266" style=" border:1px solid #000;">
                	<h1>进入特定区域（场所）准许（不准许）<br>通知书</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（存根）<br>（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li>姓名<span>&nbsp;&nbsp;${culprit.name}&nbsp;&nbsp;</span>性别<span>&nbsp;&nbsp;${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}&nbsp;&nbsp;</span></li>
                        	<li>出生日期<span>&nbsp;&nbsp;<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></span></li>
                        	<li>身份证号码<span>${culprit.identification}</span></li>
                        	<li>居住地<span>${culprit.address}</span></li>
                        	<li>户籍地<span>${culprit.regResidence }</span></li>
                        	<li>罪名<span>${culprit.crimeInfo}</span></li>
                        	<li>原判刑罚<span>${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}</span></li>
                        	<li>原判刑期<span>${culprit.culpritJudgment.adjudgePeriod}</span></li>
                        	<li>矫正类别<span>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</span></li>
                        	<li>社区矫正期限<span>自<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />起
                        	<br>至 <fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />止。</span></li>
                        	<li>执行机关<span>${culprit.groupName}</span></li>
                        	<li>进入理由<span>表现良好　　　　　　</span></li>
                        	<li>进入地点时间<span>2017年7月3日　　</span></li>
                        	<li>准许<input type="checkbox">&nbsp;&nbsp;不准许<input type="checkbox"></li>
                        	<li>发往本人、<span>鹿城区　</span>公安局</li>
                            <li>&nbsp;</li>
                            <li>填发人<span>张三丰　　　　　　　　</span></li>
                            <li>批准人<span>张三丰　　　　　　　　</span></li>
                            <li>填发日期<span>2017　</span>年<span>3　</span>月<span>3　</span>日</li>
                        </ul>
                    </div>                    
                </td>
            	<td width="70" style="text-align:center; background:url(images/line.png) repeat-y center;"><div style="background-color:#ffffff; padding:15px 0;">(2017)<br>字<br>第<br>5<br>号</div></td>
            	<td width="266" valign="top" style=" border:1px solid #000;">
                	<h1>进入特定区域（场所）准许（不准许）<br>通知书</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li>社区服刑人员<span>张三丰　</span>：</li>
                        	<li>　　你在接受社区矫正期间因<span>　　　　　　　　</span>，申请于            进入          。根据《社区矫正实施办法》第十二条之规定，决定批准（不批准）你的进入申请。</li>
                            <li>&nbsp;</li>
                        	<li>　　特此通知。</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li style="text-align:right">公章　　　　</li>
                            <li style="text-align:right"><span>2017　</span>年<span>3　</span>月<span>3　</span>日</li>
                        </ul>
                    </div>                    
                </td>
            	<td width="70" style="text-align:center; background:url(images/line.png) repeat-y center;"><div style="background-color:#ffffff; padding:15px 0;">(2017)<br>字<br>第<br>5<br>号</div></td>
            	<td width="266" valign="top" style=" border:1px solid #000;">
                	<h1>进入特定区域（场所）准许（不准许）<br>通知书</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li><span>鹿城区 </span>公安局</li>
                            <li>　　社区服刑人员<span> 张三丰 </span>，男（女），身份证号码<span> 330328198205302110 </span>，居住地<span> 浙江省鹿城区 </span>，因犯<span> 抢劫 </span>罪于<span> 2017 </span>年<span> 7 </span>月<span> 3 </span>日被<span> 鹿城区 </span>人民法院依法判处<span> 死刑 </span>。依据<span> 20170305 </span>号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，自<span> 2017 </span>年<span> 3 </span>月<span> 15 </span>日至<span> 2017 </span>年<span> 4 </span>月<span> 15 </span>日被依法实行社区矫正。因<span> 表现良好 </span>，申请
于<span> 2017年3月15日 </span>进入<span> 鹿城区司法局 </span>。根据
《社区矫正实施办法》第十二条之规定，决定批准（不批准）其的进入申请。</li>
                            <li>&nbsp;</li>
                        	<li>　　特此通知。</li>
                            <li>&nbsp;</li>
                            <li style="text-align:right">公章　　　　</li>
                            <li style="text-align:right"><span>2017　</span>年<span>3　</span>月<span>3　</span>日</li>
                        </ul>
                    </div>
                </td>
            	<td width="50">&nbsp;</td>
            </tr>
        </table>
      </div>
    </div>
</form>
