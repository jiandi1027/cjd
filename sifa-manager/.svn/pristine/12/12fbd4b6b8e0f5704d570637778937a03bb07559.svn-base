<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>假释</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
 <form  action="${ctx}/rewardspunishment/paroleController/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty parole.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${parole.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="假释相关信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="paroleId" value="${parole.id }"></input>
            <table width="100%">
                <tr>
                    <td>结案报告:</td>
                    <td><input type="file" multiple="multiple" name="endCasePath" id="endCasePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr>
                
                 <tr>
                    <td>证据材料:</td>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>法律依据：</td>
							<td colspan="5"><input type="text" name="reason" required=true  multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.reason }"  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>表现概况：</td>
							<td colspan="5"><input type="text" name="actions" required=true multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.actions }" style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                    <td>短信发送至：</td>
					<td></td>
                </tr>  
            </table>           
    </div>
   <!--  <div class="easyui-panel" id="p3" title="质量评定" style="width:100%;padding:10px;margin-bottom: 30px;">
    <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" >
   		<TBODY>
			<TR>
				<TD>
					<TABLE align=center>
						<TBODY>
							   <TR>	
									<TD height=30 width="15%" align=left >矫正科输入质量评分：</TD>
									<TD height=30 width="15%" align=left >矫正科执法质量评分：</TD>
									<TD height=30 width="15%" align=left >法制科执法质量评分：</TD>
								</TR>
								
				                 <TR>	
									<TD height=30 width="15%" align=left >矫正处输入质量评分：</TD>
									<TD height=30 width="15%" align=left >矫正处执法质量评分：</TD>
									<TD height=30 width="15%" align=left >法制处执法质量评分：</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
  		 	</TBODY>
 		</TABLE>
 	</div> --> 
     <div class="easyui-panel" id="p3" title="审核信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                   <td width="20%">操作人</td>
                   <td width="20%">操作时间</td>
                   <td width="20%">审批环节</td>
                   <td width="20%">意见</td>
                   <td width="20%">备注</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.dicDecideType == '1'?'同意':'退回'}</td>
                   <td>${processDetail.opinion}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
    <!--  <div align="center">
         <p colspan="4">
         <c:if test="${parole.auditType eq 'procuratorate'}">
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#procuratorate').dialog('open').css({'width':'auto','height':'auto'})">报检察院</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		 </c:if> 
		 <c:if test="${parole.auditType eq 'publicity'}">
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#publicity').dialog('open').css({'width':'auto','height':'auto'})">公示结果</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		 </c:if>
		 <c:if test="${parole.auditType ne 'procuratorate' && parole.auditType ne 'publicity'}">
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="check()">审核</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </c:if>
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updated()">修改</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div> -->
    </form>
    	<div id="check" title="假释处理" modal=true draggable=false
		class="easyui-dialog" closed=true style="width:400px;height:400px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="checkForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>是否批准:</td>
					<td>
						<input type="radio" name="decideType" checked="checked" value="1"/>批准&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="decideType" value="2" />退回					
					</td>
					
				</tr>
				<c:if test="${parole.auditType eq 'xjzkCheck'}">
			    <tr>
			    	<TD height=30 align=left >是否推荐为典型案例：</TD>
					<TD  width="35%">
						<input type="radio" name="recommendStatus" value="1"/>是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="recommendStatus" value="2" />否
					</TD>
			    </tr>
			 	</c:if>
			 	<c:if test="${parole.auditType eq 'xjzkCheck'}">
				<TR>	
					<TD height=30 align=left >输入质量：</TD>
					<TD width="35%">
						<input type="button"  value="评定" onclick="$('#dd').dialog('open')"/>
					</TD>
				</TR>
				<TR>	
					<TD height=30 align=left >输入质量评分：</TD>
					<TD width="35%">
						<input  class="easyui-validatebox" required=true
							 missingMessage="质量评分不能为空!"  readonly="readonly" id="handleQualityGoal" name="optScore" />
					</TD>
				</TR>
				</c:if>
				<c:if test="${parole.auditType eq 'xjzkCheck'||parole.auditType eq 'xfzkCheck'}">
				<TR>	
					<TD height=30 align=left >执法质量：</TD>
					<TD width="35%">
						<input type="button"  value="评定" onclick="$('#tt').dialog('open')" />
					</TD>
				</TR>
				<TR>
					<TD height=30 align=left >执法质量评分：</TD>
					<TD width="35%">
						<input class="easyui-validatebox" required=true
							 missingMessage="执法质量不能为空!" readonly="readonly" id="actionQualityGoal" name="zfScore" />
					</TD>
				</TR>	
				</c:if>				
						
				<tr>
					<td>审批意见:</td>
					<td><input type="text" name="opinion" multiline="true"
						class="easyui-textbox" required=true 
						data-options="width:220,height:80"
						 value="" /></td>
				</tr>
				<tr>
					<td>短信发送:</td>
					<td></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" onclick="apply('checkForm')">确定</a>
						<a  id="btn2" class="easyui-linkbutton">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
    <div id="updated" title="假释信息修改" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 400px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="updatedForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>法律依据:</td>
					<td><input type="text" name="reason" multiline="true"
						class="easyui-textbox" required=true 
						data-options="width:260,height:100"
						 value="${parole.reason }" /></td>
				</tr>
				<tr>
					<td>表现概况:</td>
					<td><input type="text" name="actions" multiline="true"
						class="easyui-textbox" required=true 
						data-options="width:260,height:100"
						 value="${parole.actions }" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn3" class="easyui-linkbutton">确定</a>
						<a href="javascript:void(0)" id="btn2" class="easyui-linkbutton" onclick=" $('#updated').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dd" class="easyui-dialog" title="输入质量评定明细" style="width:500px;height:400px;padding:10px; top:250px; left:650px;background:#c4d8ed"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed: true" >
        <p><input type="checkbox" name="zhiliang" id="zhiliang1" value="1"/><label for="zhiliang1">要求输入系统平台的内容,没有输入的,每处扣1分,共</label><input type="text" id="num0" value="1" style="width:20px;"/>处</p>  
        <p><input type="checkbox" name="zhiliang" id="zhiliang2" value="1"/><label for="zhiliang2">要求扫描输入系统平台的材料缺页的,每缺1页扣1分,共</label><input type="text" id="num1"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang3" value="0.5"/><label for="zhiliang3">扫描输入系统平台的材料,不连续连贯的,扣0.5分</label><input type="hidden" id="num2"  value="1" style="width:20px;"/></p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang4" value="2"/><label for="zhiliang4">该扫描输入系统平台的材料未扫描输入的,每件扣2分,共</label><input type="text" id="num3"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang5" value="1"/><label for="zhiliang5">扫描输入系统平台的材料不符合系统要求格式的,扣1分,共</label><input type="text" id="num4"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang6" value="0.5"/><label for="zhiliang6">输入系统平台的文字、内容错误的,每处扣0.5分,共</label><input type="text" id="num5"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang7" value="0.5"/><label for="zhiliang7">输入系统平台的文字、内容与书面材料内容不相符的,每处扣0.5分,共</label><input type="text" id="num6"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhiliang" id="zhiliang8" value="1"/><label for="zhiliang8">发现其他输入问题的，根据实际情况扣分,共</label><input type="text" value="1" id="num7"  style="width:20px;"/>分</p>
    <div style="background:#c4d8ed">
    	具体说明:<input  name="" class="f1 easyui-textbox" style="width:300px;height:60px;"/>
    </div>
    <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkZhiLiang();">确定</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#dd').dialog('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    </div>
</div> 
<div id="publicity" title="公示结果处理" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 400px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="publicityForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table id="publicityAdd">
				<tr>
			    	<TD height=30 align=left >公示结果：</TD>
					<TD >
						<input type="radio" name="showResult" value="1" checked="checked"/>无异议&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
					<TD>	
						<input id="result"type="radio" name="showResult" value="2" />公示意见
					</TD>
				</tr>
				<tr align="center">
					<td colspan="6"><a id="publicityBtn" class="easyui-linkbutton" onclick="apply('publicityForm')">确定</a>
						<a href="javascript:void(0)" id="btn2" class="easyui-linkbutton" onclick=" $('#publicity').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="procuratorate" title="检察院意见处理" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 400px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="procuratorateForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
			    	<TD height=30 align=left >检查院意见：</TD>
					<TD  width="35%">
						<input type="radio" name="procuratorate" value="1"/>同意&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="procuratorate" value="2" />不同意
					</TD>
			    </tr>
			     <tr>
                    <td>相关材料:</td>
                    <td><input type="file" name="procuratoratePath" id="procuratoratePath" value="上传"></input></td>
                </tr>
                <tr>
					<td>短信发送:</td>
					<td></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn3" class="easyui-linkbutton" onclick="apply('procuratorateForm')">确定</a>
						<a href="javascript:void(0)" id="btn2" class="easyui-linkbutton" onclick=" $('#procuratorate').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
<div id="tt" class="easyui-dialog" title="执法质量评定明细" style="width:800px;height:600px;padding:10px; top:190px; left:580px;background:#c4d8ed"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed: true" >
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang9"/><label for="zhiliang9">调查人员少于2人的,扣2分,共</label><input type="text" id="zhifa0" value="1" style="width:20px;"/>处</p>  
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang10"/><label for="zhiliang10">书面证据复印件,没有加盖提供单位公章的,或者没有提供人签名并捺指印的,扣3分,共</label><input type="text" id="zhifa1"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang11"/><label for="zhiliang11">询问笔录未注明询问开始和结束时间的,扣0.5分,共</label><input type="hidden" id="zhifa2"  value="1" style="width:20px;"/></p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang12"/><label for="zhiliang12">询问笔录未注明谈话地点、谈话人、记录人的,扣0.5分,共</label><input type="text" id="zhifa3"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang13"/><label for="zhiliang13">询问笔录中,被询问人姓名处未按指印的,扣0.5分,共</label><input type="text" id="zhifa4"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang14"/><label for="zhiliang14">询问笔录不按一"问"一"答" 形式进行,或者使用其他符号表示的,扣0.5分,共</label><input type="text" id="zhifa5"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang15"/><label for="zhiliang15">询问笔录涂改处,没有被询问人捺指印确认的,每处扣1分,共</label><input type="text" id="zhifa6"  value="1" style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang16"/><label for="zhiliang16">询问未成年人时,未在询问笔录中注明其父母或其他监护人的,扣2分,共</label><input type="text" value="1" id="zhifa7"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang17"/><label for="zhiliang17">询问笔录中,未反映出询问人身份、询问目的,以及未告之被询问人法律责任的,扣0.5分,共</label><input type="text" value="1" id="zhifa8"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="5" id="zhiliang18"/><label for="zhiliang18">询问笔录末尾部分,未由被询问人签署"以上笔录我已看过,和我说的一样"或"以上笔录已读给我听过,和我说的一样"字样的,扣5分,共</label><input type="text" value="1" id="zhifa9"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="5" id="zhiliang19"/><label for="zhiliang19">询问笔录末尾部分,未由被询问人签字的,扣5分,共</label><input type="text" value="1" id="zhifa10"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang20"/><label for="zhiliang20">未捺指印的,扣3分,共</label><input type="text" value="1" id="zhifa11"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang21"/><label for="zhiliang21">未注明日期的,扣1分,共</label><input type="text" value="1" id="zhifa12"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang22"/><label for="zhiliang22">询问笔录制作完成后,未由被询问人在笔录除最后一页之外的每一页右下脚签名、捺指印,扣3分,共</label><input type="text" value="1" id="zhifa13"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang23"/><label for="zhiliang23">询问笔录制作完成后,未签名,或者未捺指印的,每发现一起扣0.5分,共</label><input type="text" value="1" id="zhifa14"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang24"/><label for="zhiliang24">询问笔录制作完成后,未由被调查人在笔录右边侧骑缝处捺指印的,扣3分,共</label><input type="text" value="1" id="zhifa15"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang25"/><label for="zhiliang25">询问笔录制作完成后,只捺1个指印的,扣1分,共</label><input type="text" value="1" id="zhifa16"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang26"/><label for="zhiliang26">询问笔录制作完成后,指印未覆盖到笔录的每一页的,扣1分,共</label><input type="text" value="1" id="zhifa17"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang27"/><label for="zhiliang27">询问笔录制作完成后,在左侧按指印的,扣0.5分,共</label><input type="text" value="1" id="zhifa18"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang28"/><label for="zhiliang28">询问笔录末尾部分,询问人、记录人没有手写签名的,扣1分,共</label><input type="text" value="1" id="zhifa19"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="2" id="zhiliang29"/><label for="zhiliang29">对笔录中出现的矛盾关键点,未详细核实的,扣2分,共</label><input type="text" value="1" id="zhifa20"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang30"/><label for="zhiliang30">应该调查的人员没有调查的,每发现一起扣1分,共</label><input type="text" value="1" id="zhifa21"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang31"/><label for="zhiliang31">被调查人反映的情况相互矛盾没有发现的扣0.5分,共</label><input type="text" value="1" id="zhifa22"  style="width:20px;"/>处</p> 
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang32"/><label for="zhiliang32">将相互矛盾的材料没有经过合理分析判断直接作为定案证据的每发现一起扣1分,共</label><input type="text" value="1" id="zhifa23"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang33"/><label for="zhiliang33">证据收集不充分或者证据之间不能相互印证的,证据不能形成有效证据链的,发现一处扣1分,共</label><input type="text" value="1" id="zhifa24"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang34"/><label for="zhiliang34">违法行为发生的时间、地点、事实后果、情节记载不清或者前后不一的,每发现一处扣1分,共</label><input type="text" value="1" id="zhifa25"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang35"/><label for="zhiliang35">记载内容不全的,每缺一项扣1分,共</label><input type="text" value="1" id="zhifa26"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang36"/><label for="zhiliang36">调查中反映的同一当事人,前后姓名不一的,扣1分,共</label><input type="text" value="1" id="zhifa27"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang37"/><label for="zhiliang37">对被处罚的社区矫正人员的身份证明应当提取而未提取的,扣1分,共</label><input type="text" value="1" id="zhifa28"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="0.5" id="zhiliang38"/><label for="zhiliang38">询问笔录等证据材料被询问人拒绝签字（盖章）确认而调查人员未注明情况的,发现一处扣0.5分,共</label><input type="text" value="1" id="zhifa29"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang39"/><label for="zhiliang39">辨认时,被辨认的人数少于七人,或者辨认的照片少于十人的照片的,扣3分,共</label><input type="text" value="1" id="zhifa30"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang40"/><label for="zhiliang40">减刑（假释）案件,未进行公示的,扣3分,共</label><input type="text" value="1" id="zhifa31"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="3" id="zhiliang41"/><label for="zhiliang41">减刑（假释）案件,未报检察院出具监督意见的,扣3分,共</label><input type="text" value="1" id="zhifa32"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang42"/><label for="zhiliang42">警告案件,未责令社区矫正人员具结悔过的,扣1分,共</label><input type="text" value="1" id="zhifa33"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang43"/><label for="zhiliang43">主要证据不足,不能证明社区矫正人员有违法事实的,扣10分,共</label><input type="text" value="1" id="zhifa34"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang44"/><label for="zhiliang44">主要证据错误,导致社区矫正人员身份或者事实认定错误的,扣10分,共</label><input type="text" value="1" id="zhifa35"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang45"/><label for="zhiliang45">不按法定程序收集证据或者伪造证据的,扣10分,共</label><input type="text" value="1" id="zhifa36"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="10" id="zhiliang46"/><label for="zhiliang46">对违法行为的事实认定错误或者主要事实不清的,扣10分,共</label><input type="text" value="1" id="zhifa37"  style="width:20px;"/>处</p>
        <p><input type="checkbox" name="zhifa" value="1" id="zhiliang47"/><label for="zhiliang47">其他根据情况扣分,扣</label><input type="text" value="1" id="zhifa38"  style="width:20px;"/>分</p>
    <div style="background:#c4d8ed">
    	具体说明:<input  name="" class="f1 easyui-textbox" style="width:600px;height:60px;"/>
    </div>
    <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkZhiFa();">确定</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#dd').dialog('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    </div>
</div>   
    <script>
    //初始化
    $(function(){
    	$('#btn2').click(function(){
    		$('#check').dialog('close');
    	});
    	//县矫正科公式意见点击事件
    	$('#result').click(function(){
    		//alert('1111')
    		$("#publicityAdd tr").eq(0).after("<tr>"
					+"<td>公示意见:</td>"
					+"<td><input type='text' name='showDetail' multiline='true'"
					+"class='easyui-textbox' required=true "
					+"data-options='width:220,height:80'"
					+" value='' /></td>"
					+"</tr>"
					+"<tr rowspn='3'>"
					+" <td>处理结果:</td>"
					+"<td colspan='3'><input type='text' name='showAction' style='width:220,height:80'"
					+" value='' /></td>"
					
					+"</tr>"); 
    	});
    		
    });
	function check(){
		//$('#check').get(0).reset();
		//$("#check input[name='id']").attr("value","");
		//$('#myform').form('clear');
		$('#check').dialog('open') .css({"width":"auto","height":"auto"});
	}
	function updated(){
		//$('#check').get(0).reset();
		//$("#check input[name='id']").attr("value","");
		//$('#myform').form('clear');
		$('#updated').dialog('open') .css({"width":"auto","height":"auto"});
	}
	/**
	 *  提交处理流程表单方法
	 */
	function apply(type){
		//id="\'"+id+"\'" ;
		var str=$("\'"+'#'+id+"\'").serialize();
			if(("\'"+'#'+id+"\'").form('validate')){
				
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/paroleController/submitParoleAudit',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#check').dialog('close');
						parent.location.reload();
		      			var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
							msg:result.msg
						});
					}
				});
			} else {
				$.messager.show({
					title:'提示信息!' ,
					msg:'数据验证不通过'
				});
			}
	}
	//提交修改表单
	$('#btn3').click(function(){
		var str=$('#updatedForm').serialize();
		$.ajax({
			type: 'post' ,
			url: '${ctx}/rewardspunishment/paroleController/save',
			cache:false ,
			data:str,
			dataType:'json' ,
			success:function(result){
				//1 关闭窗口
				$('#updated').dialog('close');
				location.reload();
      			//var index = parent.layer.getFrameIndex(window.name);
				//parent.layer.close(index);
			} ,
			error:function(result){
				$.meesager.show({
					title:result.status==200?"ok":"fail" ,  
					msg:result.msg
				});
			}
		});
	})
	//质量评分
function checkZhiLiang(){
	var obj=document.getElementsByName('zhiliang');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#num'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#handleQualityGoal").val())!="undefined"){
		 $("#handleQualityGoal").val(sum);
	 }else if(typeof($("#cityHandleQualityGoal").val())!="undefined"){
		 $("#cityHandleQualityGoal").val(sum);
	 }
	 $('#dd').dialog('close');
}

//执法评分
function checkZhiFa(){
	var obj=document.getElementsByName('zhifa');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#zhifa'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#actionQualityGoal").val())!="undefined"){
		 $("#actionQualityGoal").val(sum);
	 }else if(typeof($("#actionQualityGoalF").val())!="undefined"){
		 $("#actionQualityGoalF").val(sum);
	 }else if(typeof($("#cityJactionQualityGoal").val())!="undefined"){
		 $("#cityJactionQualityGoal").val(sum);
	 }else{
		 $("#cityFactionQualityGoal").val(sum);
	 }; 
	 $('#tt').dialog('close');
}
</script>
</body>
</html>
