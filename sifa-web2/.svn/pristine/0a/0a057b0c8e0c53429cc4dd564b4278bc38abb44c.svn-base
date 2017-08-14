<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	 <div class="easyui-panel" title="基本信息" style="width:100%;padding:5px;margin:0 auto;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">矫正对象：</th>
					<td width="23%" style="border-right-style:none">${moveIn.name }
						</td>
					<td width="10%" style="border-style:none"></td>
					<td width="23%" style="border-style:none"></td>
					<td width="10%" style="border-style:none"></td>
					<td style="border-style:none"></td>
				</tr>
				<tr>
					<th width="10%">身份证号：</th>
					<td width="23%">${moveIn.cedentialsNumber }
						</td>
					<th width="10%">性别：</th>
					<td width="23%" >${fns:getSysDicValueByKey('common_table','sex',moveIn.dicSexKey ,'')} </td>
					<th width="10%">民族：</th>
					<td>${fns:getSysDicValueByKey('common_table','nation',moveIn.nation ,'')}</td>
				</tr>
				<tr>
					<th>曾用名：</th><td>${moveIn.alias }</td>
					<th>出生日期：</th><td><fmt:formatDate value="${moveIn.bornDate}" pattern="yyyy-MM-dd" /></td>
					<th>文化程度：</th><td>${fns:getSysDicValueByKey('common_table','whcd',moveIn.dicWhcdKey ,'')}
                  	</td>
				</tr>
				<tr>
					<th>婚姻状况：</th><td> ${fns:getSysDicValueByKey('common_table','hyzk',moveIn.dicHyzkKey ,'')}</td>
                  	<th>职业：</th><td>${moveIn.job }</td>
					<th>原政治面貌：</th> <td> ${fns:getSysDicValueByKey('common_table','zzmm',moveIn.oldPoliticStatusId  ,'')}</td>
				</tr>
				<tr>
					<th>籍贯：</th><td>${moveIn.origin }</td>
					<th>户籍所在地：</th><td>${moveIn.regResidence } </td>
					<th>联系方式：</th><td>${moveIn.contactPhone }</td>
				</tr>
				<tr>
					<th>原判罪名：</th><td>${moveIn.crimeInfo }</td>
					<th>刑期：</th><td>${moveIn.adjudgePeriod}</td>
					<th>刑罚执行类别：</th><td> ${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',moveIn.dicPenalTypeKey ,'')}</td>
				</tr>
				<tr>
					<th>刑期变动：</th><td>${moveIn.adjudgeChange }</td>
					<th>刑期开始日期：</th>
					<td><fmt:formatDate value="${moveIn.adjudgeStartTime}" pattern="yyyy-MM-dd" />
					</td>
					<th>刑期结束日期：</th>
					<td><fmt:formatDate value="${moveIn.adjudgeEndTime}" pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<th>矫正期限：</th><td>${moveIn.redressPeriod }</td>		
					<th>矫正开始日期：</th><td><fmt:formatDate value="${moveIn.redressStartDate}" pattern="yyyy-MM-dd" /></td>
					<th>矫正结束日期：</th><td><fmt:formatDate value="${moveIn.redressEndDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</table>
		</div>
	 <div class="easyui-panel" title="迁入相关信息" style="width:100%;padding:5px;margin:0 auto;">
	 	<table width="100%" class="grid" >
			<tr>
				<th width="10%">申请时间：</th>
				<td width="23%"><fmt:formatDate value="${moveIn.moveTime}"
									pattern="yyyy-MM-dd" />
				 </td>
				<th width="10%">原司法所：</th><td width="23%">${moveIn.oldGroup }</td>
				<th width="10%">拟迁往司法所：</th><td>${moveIn.groupName }</td>
			</tr>
			<tr>
				<th>现居住地：</th>
				<td colspan="5">${moveIn.oldPlace }</td>
			</tr>
			<tr>
				<th>拟居住地：</th>
				<td colspan="5">${moveIn.newPlace }</td>
			</tr>
			<tr>
				<th>居住地变更原因：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.reason }</textarea></td>
			</tr>
			<tr>
				<th>司法所意见：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.opinion }</textarea></td>
			</tr>
			<tr>
				<th>备注：</th>
				<td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${moveIn.note }</textarea></td>
			</tr>
			<tr>
				<th>已上传附件：</th>
				<td style="border-right-style: none" colspan="5">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn"
									onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	 </div>
	 <div class="easyui-panel" title="调查相关信息" style="width:100%;padding:5px;margin:0 auto;">
	 	<table width="100%" class="grid" >
	 		<tr>
				<th width="10%">姓名：</th>
				<td width="23%">${investigator1}</td>
				<th width="10%">单位职务：</th>
				<td>${moveIn.position1}</td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td>${investigator2}</td>
				<th>单位职务：</th>
				<td>${moveIn.position2}</td>
			</tr>
			<tr>
				<th>协理员：</th>
				<td>${assistorId1}</td>
				<th>单位职务：</th>
				<td>${moveIn.position3}</td>
			</tr>
			<tr>
				<th>调查相关材料：</th>
				<td style="border-right-style: none" colspan="3">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList1}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn"
									onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	 </div>
	<div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td>${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
	<div class="easyui-panel" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                  <th style="text-align:center;" width="15%">操作人</th>
                   <th style="text-align:center;" width="15%">操作时间</th>
                   <th style="text-align:center;" width="15%">操作环节</th>
                   <th width="30%"  style="text-align:center;">审批意见</th>
                   <th  style="text-align:center;">审批结果</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">${processDetail.opinion}</td>
                   <td style="text-align:center;">${processDetail.dicDecideType == '1'?'同意':'退回'}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
    <div id="moveInPrintBGSPB"></div>
    <div id="moveInPrintBFZM"></div>
    <div id="mxCheckDetailForm"></div>
     <div style="text-align: center;display: none;"> 
	    <a id="moveInPrint_bgspb" class="easyui-linkbutton" >打印《社区服刑人员居住地变更审批表》</a>
	    <a id="moveInPrint_bgzm" class="easyui-linkbutton" >打印《社区服刑人员居住地变更证明》</a>
    </div>
</div>	
<script type="text/javascript">
$(function(){
	
})

$('#moveInPrint_bgspb').click(function (){
	var url = '${ctx}/culprit/moveIn/print?id=${moveIn.id}&type=1';
	$('#moveInPrintBGSPB').dialog({
	    title: '打印《社区服刑人员居住地变更审批表》',
        iconCls:'fi-print icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#movePrintBGSPB_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#moveInPrintBGSPB').dialog('close');
			}
		}]
	});
	$('#moveInPrintBGSPB').window('center');
});

$('#moveInPrint_bgzm').click(function (){
	var url = '${ctx}/culprit/moveIn/print?id=${moveIn.id}&type=2';
	$('#moveInPrintBFZM').dialog({
	    title: '打印《社区服刑人员居住地变更证明》',
        iconCls:'fi-print icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#movePrintBGZM_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#moveInPrintBFZM').dialog('close');
			}
		}]
	});
	$('#moveInPrintBFZM').window('center');
});

function mxcheckdetail(infotype){
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${revokeProbation.processInstanceId}';
	$('#mxCheckDetailForm').dialog({    
	    title: '评分详细', 
	    iconCls:'fi-checkbox icon-blue',
	    width: 800,
	    height: 650,
	    href: url,    
	    modal: true,
        resizable:true,
        maximizable:true,
	    buttons :[{
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#mxCheckDetailForm').dialog('close');
			}
		}]
	});
	$('#mxCheckDetailForm').window('center');
}

</script>