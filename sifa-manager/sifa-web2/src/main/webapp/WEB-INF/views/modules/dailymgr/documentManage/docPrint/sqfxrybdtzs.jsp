<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<form action="" method="post" id="">
		<div style="text-align:center;margin-top:10px;margin-bottom:10px;padding: 0;display:none;">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'" id="bdtzsBtn" onclick="CreatePrintPage();LODOP.PREVIEW();">打印当前页</a> 
		</div>
	<div id="bdtzs_PrintMsg"></div>
	<div class="easyui-panel" id="bdtzsPrint" align="center" style="width:100%;border:0;">
		<div style="width:165mm;border:0;font-size: 16px;font-family: FangSong_GB2312;">
		<table width="100%" style="border-collapse:collapse;border:0;text-align: left;width:670px;">
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员报到通知书（存根）</span></td>
			</tr>
			<tr style="display:block;margin-top:10px;">
				<td>社区服刑人员：${culprit.name} </td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;按照 ${culpritLaw.indictmentNum}<c:if test='${culpritLaw.dicWslxKey==125001}'>判决书</c:if>
				<c:if test='${culpritLaw.dicWslxKey==12502}'>裁定书</c:if>
				<c:if test='${culpritLaw.dicWslxKey==12503}'>决定书</c:if>，
				根据《社区矫正实施办法》第六条、《广西壮族自治区社区矫正实施细则（试行）》第三十条之规定，你必须于<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" />前到${culprit.groupName}司法所报到，依法接受社区矫正，愈期不报到，县级司法行政机关将依据规定对你提出警告直至向人民法院提出收监执行建议。
				</td>
				
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;特此通知
				</td>
			</tr>
			<tr height="50px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;以上内容我已阅知。
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员（签名捺手印）：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:25%;" readonly="readonly"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司法局（公章 ）
				</td>

			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:25%;" readonly="readonly"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</td>

			</tr>
			<tr height="50px;">
			</tr>
			<tr>
				<td align="center">--------------------------------（骑缝章）--------------------------------</td>
			</tr>
			<tr height="20px;">
			</tr>
			<tr>
				<td width="100%" align="center"><span style="font-weight: bold;font-size: 24px;font-family: FZXiaoBiaoSong-B05S">社区服刑人员报到通知书（存根）</span></td>
			</tr>
			<tr style="display:block;margin-top:10px;">
				<td>社区服刑人员：${culprit.name} </td>
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;按照 ${culpritLaw.indictmentNum}<c:if test='${culpritLaw.dicWslxKey==125001}'>判决书</c:if>
				<c:if test='${culpritLaw.dicWslxKey==12502}'>裁定书</c:if>
				<c:if test='${culpritLaw.dicWslxKey==12503}'>决定书</c:if>，
				根据《社区矫正实施办法》第六条、《广西壮族自治区社区矫正实施细则（试行）》第三十条之规定，你必须于<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy年MM月dd日" />前到${culprit.groupName}司法所报到，依法接受社区矫正，愈期不报到，县级司法行政机关将依据规定对你提出警告直至向人民法院提出收监执行建议。
				</td>
				
			</tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;特此通知
				</td>
			</tr>
			<tr height="50px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;以上内容我已阅知。
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;社区服刑人员（签名捺手印）：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:25%;" readonly="readonly"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司法局（公章 ）
				</td>

			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td>
				&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<input style="border-bottom:1px solid;border-left:0;border-right:0;border-top:0;width:25%;" readonly="readonly"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
				</td>

			</tr>
			<tr height="50px;">
			</tr>
			<tr>
			
			<tr>
				<td align="center" style="display: none;">
					<input type="hidden" id="decideType" name="decideType" value="1">
				
					<a id="securityPunishmentPrintBtn1" class="easyui-linkbutton">打印</a>
					<a id="securityPunishmentPrintBtn3" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
		</table>
    
    	</div>
    </div>
    
</form>
<script type="text/javascript">
var LODOP; //声明为全局变量 

//创建打印页面
function CreatePrintPage(){
	LODOP = getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),document.getElementById('bdtzs_PrintMsg'));
    LODOP.PRINT_INIT("打印治安管理处罚建议书");
    //设置打印纸张大小，1代表纵向打印
    LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");
    LODOP.ADD_PRINT_HTM(40,50,"70%","100%",$('#bdtzsPrint').html());
    //LODOP.ADD_PRINT_TEXT(1050, 370, 200, 22, "第#页/共&页");
    //LODOP.SET_PRINT_STYLEA(2, "ItemType", 2);
    //LODOP.SET_PRINT_STYLEA(2, "HOrient", 1);
    //LODOP.SET_PRINT_STYLEA(0, "TableHeightScope",1);
}

</script>
</body>
</html>