<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
 	<c:choose>
 		<c:when test="${empty parole.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${parole.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="假释相关信息" style="width:100%;padding:5px;">
           <input type="hidden" name="id" id="paroleId" value="${parole.id }"></input>
            <table width="100%" class="grid">
                <tr rowspan="5">
                    <th width="10%">附件下载：</th>
                    <td width="90%" colspan="5">
                    	 <div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
                    </td>
                </tr>
                <tr>
                   <th width="10%"><span class="c-red">*</span>假释年限：</th>
					<td>
					${parole.reduceTime}
					</td>
				</tr>
				</tr> 
                <tr rowspan="5">
                    <th><span class="c-red"></span>法律依据：</th>
							<td colspan="5"><input type="text" name="reason" required=true  multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.reason }"  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <th><span class="c-red"></span>表现概况：</th>
							<td colspan="5"><input type="text" name="actions" required=true multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.actions }" style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                <th width="10%">送达方式：</th>
					<td>
					${parole.dicSdfsKey}
					</td>
				</tr>
            </table>           
    </div>
     <div class="easyui-panel" id="p3" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
    <TABLE width="100%" class="grid">
							   <TR>	
									<TH  width="10%" align=left >矫正科输入评分：</TH>
										<td width="23%">${jzksr}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
										</td>
									<TH  width="10%" align=left >矫正科执法评分：</TH>
										<td width="23%">${jzkzf}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(2)">查看详细</a>
										</td>
									<TH  width="10%" align=left >法制科执法评分：</TH>
										<td width="23%">${fzkzf}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(3)">查看详细</a>
										</td>
								</TR>
								
				                 <TR>	
									<TH  width="10%" align=left >矫正处输入评分：</TH>
										<td width="23%">${jzcsr}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(4)">查看详细</a>
										</td>
									<TH  width="10%" align=left >矫正处执法评分：</TH>
										<td width="23%">${jzczf}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(5)">查看详细</a>
										</td>
									<TH  width="10%" align=left >法制处执法评分：</TH>
										<td width="23%">${fzczf}&nbsp;&nbsp;
										<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(6)">查看详细</a>
										</td>
								</TR>
 		</TABLE>
 	</div> 
	<div id="parolePrint"></div>
	<div style="text-align: center;display: none;">
    	<a id="parole1" class="easyui-linkbutton" >打印社区服刑人员假释建议书</a>
    </div>
<div id="mxCheckDetailForm"></div> 
</div>
<script>
function mxcheckdetail(infotype){
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${parole.processInstanceId}';
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
    $('#parole1').click(function (){
    	var url = '${ctx}/rewardspunishment/parole/print?id=${parole.id}';
    	$('#parolePrint').dialog({
    	    title: '打印社区服刑人员假释建议书',
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
    				$('#parolePrintBtn').click();
    			}
    		}, {
    			text:'关闭',
    			iconCls:'fi-x icon-blue',
    			handler:function(){
    				$('#parolePrintBtn1').click();
    			}
    		}]
    	});
    	$('#securityPunishmentPrint').window('center');
    });
</script>
