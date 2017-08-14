<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>

<!doctype html>
<html>
<head>
<script type="text/javascript" src="${ctxStatic }/lib/jquery/1.9.1/jquery.min.js" charset="utf-8"></script>
<title>柳州司法</title>
<style type="text/css">
*{ margin:0; padding:0;}
.page-form{ width:978px; height:648px; margin:0 auto; padding:54px; font-family:'仿宋_GB2312';}
.page-form h1{ font-size:12px; font-weight:normal; font-family:'宋体'; text-align:center; padding:15px 0;}
.page-form ul, .page-form li{ list-style:none;}
.page-form li span{ text-decoration:underline;}
.page-form em{ font-style:normal;}
</style>
</head>

<body>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
   	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>

	<div style="display:none;">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="printRevokeParoleTable" onclick="preview_qmjjTable()">打印当前页</a>  
	</div>
	<div id="jztzs_PrintMsg"></div>
	<div class="page-form" id="jztzsPrintPage">
   	  <div class="page-wrap">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse;" >
        	<tr>
            	<td width="20">&nbsp;</td>
            	<td width="205" style=" border:1px solid #000;" valign="top">
                	<h1>解除社区矫正通知书<br>（存根）</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li>姓名<span>&nbsp;${culprit.name}&nbsp;</span>性别<span>&nbsp;${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}&nbsp;</span></li>
                        	<li>出生日期<span>&nbsp;<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />&nbsp;</span></li>
                        	<li>身份证号码<span>${culprit.identification}</span></li>
                        	<li>罪名<span>&nbsp;${culprit.crimeInfo}&nbsp;</span></li>
                        	<li>原判刑罚<span>&nbsp;${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}&nbsp;</span></li>
                        	<li>原判刑期<span>&nbsp;${culprit.culpritJudgment.adjudgePeriod}&nbsp;</span></li>
                        	<li>原判法院<span>&nbsp;${culprit.culpritJudgment.adjudgeOrg}&nbsp;</span></li>
                        	<li>居住地<span>&nbsp;${culprit.address}&nbsp;</span></li>                          
                        	<li>户籍地<span>&nbsp;${culprit.regResidence }&nbsp;</span></li>
                        	<li>矫正类别<span>&nbsp;${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}&nbsp;</span></li>
                        	<li>社区矫正期：限自<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="d" /></span>日起<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="d" /></span>日止。</li>
                        	<li>矫正期间执行变更：<span>　　　　　</span>。</li>
                        	<li>发往<span>　　　　　</span>人民法院（公安（分）局、监狱管理局），<span>　　　　　</span>人民检察院，<span>　　　　　</span>公安（分）局．</li>
                            <li>填发人<span>　　　　　</span></li>
                            <li>批准人<span>　　　　　</span></li>
                            <li>填发日期<span>　　　　　</span></li>
                        </ul>
                    </div>                    
                </td>
            	<td width="40" style="text-align:center; background:url(images/line.png) repeat-y center;"><div style="background-color:#ffffff; padding:15px 0;"><em style=" display:inline-block; transform: rotate(90deg);">(2017)</em><br><br>字<br>第<br>5<br>号</div></td>
            	<td width="204" valign="top" style=" border:1px solid #000;">
                	<h1>解除社区矫正通知书<br>（存根）</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li><span>${culprit.groupName}</span>：<span>${culprit.name}</span>，${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，身份证号码<span>${culprit.identification}</span>，居住地<span>${culprit.address} </span>，因犯<span> ${culprit.crimeInfo} </span>罪于<span><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日"/></span>被<span> ${culprit.culpritJudgment.adjudgeOrg}</span>判处<span> ${culprit.culpritJudgment.crimeInfo}</span>。依据<span>${culprit.culpritJudgment.adjudgeId}</span>号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，自<span> <fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="d" /></span>日被依法实行社区矫正。于<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="d" /></span>日矫正期满，依法解除社区矫正。</li>
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
            	<td width="40" style="text-align:center; background:url(images/line.png) repeat-y center;"><div style="background-color:#ffffff; padding:15px 0;"><em style=" display:inline-block; transform: rotate(90deg);">(2017)</em><br><br>字<br>第<br>5<br>号</div></td>
            	<td width="204" valign="top" style=" border:1px solid #000;">
                	<h1>解除社区矫正通知书<br>（存根）</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                        	<li><span>${culprit.groupName}</span>：<span>${culprit.name}</span>，${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，身份证号码<span>${culprit.identification}</span>，居住地<span>${culprit.address} </span>，因犯<span> ${culprit.crimeInfo} </span>罪于<span><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日"/></span>被<span> ${culprit.culpritJudgment.adjudgeOrg}</span>判处<span> ${culprit.culpritJudgment.crimeInfo}</span>。依据<span>${culprit.culpritJudgment.adjudgeId}</span>号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，自<span> <fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="d" /></span>日被依法实行社区矫正。于<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="d" /></span>日矫正期满，依法解除社区矫正。</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li>&nbsp;</li>
                            <li style="text-align:right">公章　　　　</li>
                            <li style="text-align:right"><span>  　  　</span>年<span> 　</span>月<span> 　</span>日</li>
                        </ul>
                    </div>                                  
                </td>
            	<td width="40" style="text-align:center; background:url(images/line.png) repeat-y center;"><div style="background-color:#ffffff; padding:15px 0;"><em style=" display:inline-block; transform: rotate(90deg);">(2017)</em><br><br>字<br>第<br>5<br>号</div></td>
            	<td width="205" valign="top" style=" border:1px solid #000;">
                	<h1>解除社区矫正通知书</h1>
                    <div style="padding:0 10px; text-align:center; padding-bottom:15px;">（  ） 字第  号</div>
                    <div style="padding:0 10px 10px 10px;">
                    	<ul>
                            <li><span>${culprit.groupName}</span>：<span>${culprit.name}</span>，${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，身份证号码<span>${culprit.identification}</span>，居住地<span>${culprit.address} </span>，因犯<span> ${culprit.crimeInfo} </span>罪于<span><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日"/></span>被<span> ${culprit.culpritJudgment.adjudgeOrg}</span>判处<span> ${culprit.culpritJudgment.crimeInfo}</span>。依据<span>${culprit.culpritJudgment.adjudgeId}</span>号判决书（裁定书、决定书），管制（缓刑、假释、暂予监外执行）期间，自<span> <fmt:formatDate value="${culprit.redressStartDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressStartDate}" pattern="d" /></span>日被依法实行社区矫正。于<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="yyyy" /></span>年<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="M" /></span>月<span><fmt:formatDate value="${culprit.redressEndDate}" pattern="d" /></span>日矫正期满，依法解除社区矫正。</li>
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
                            <li style="text-align:right"><span>  　  　</span>年<span> 　</span>月<span> 　</span>日</li>
                        </ul>
                    </div>
                </td>
            	<td width="20">&nbsp;</td>
            </tr>
            <tr style="display:none;" >
				<td align="center">
					<a id="jztzsPrint" class="easyui-linkbutton" >打印解除社区矫正通知书</a>
				</td>
			</tr>
        </table>
      </div>
    </div>
    <script type="text/javascript">
	var LODOP; //声明为全局变量 
	$(function() {
		 $('#jztzsPrint').click(function (){
				CreatePrintPage();
				LODOP.PREVIEW();
			});
	});
	
 
	
	//创建打印页面
	function CreatePrintPage(){
		LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('jztzs_PrintMsg'));
		LODOP.PRINT_INIT("打印解除社区矫正通知书");
	    //设置打印纸张大小，1代表纵向打印
	    LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "A4");
	    LODOP.ADD_PRINT_HTM(40,60,"70%","100%",$('#jztzsPrintPage').html());
	    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
	    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
	    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
	    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
	    LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);
	}
	
	</script>
</body>
</html>