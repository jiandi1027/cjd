<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
 <form  action="${ctx}/dailymgr/talk/save" method="post" id="talkformDetail">
 	 	<c:choose>
 		<c:when test="${empty talk.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="talkformAdd" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${talk.culpritId}" formId="talkformAdd" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="谈话教育信息"  style="width:100%;padding:5px;">
           <input type="hidden"  name="id" id="paroleId" value="${talk.id }"/>
            <table width="100%" class= "grid">
                <tr>
                    <th width="10%" >谈话人：</th>
                    <td width="23%" >${talk.talkor }</td>
                      <th width="10%">记录人：</th>
                    <td  style="border:0px solid;" width="23%">${talk.recorder }</td>
                    <td style="border:0px solid;"  width="10%" ></td>
                    <td style="border:0px solid;"  width="23%"></td>

                </tr>
                 <tr>
                  <th width="10%">谈话日期：</th>
                    <td width="23%" ><fmt:formatDate value='${talk.talkTime }' pattern="yyyy-MM-dd" /></td>
                    <th width="10%">谈话开始时间：</th>
                    <td width="23%" ><fmt:formatDate value='${talk.talkStartTime}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
                     <th width="10%">谈话结束时间：</th>
                    <td width="23%" ><fmt:formatDate value='${talk.talkEndTime}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                
                <tr>
               <th>谈话地点：</th>
               
                    <td colspan="5">
                    ${fns:getAreaValueById(talk.addressPro, '') }${fns:getAreaValueById(talk.addressCity, '') }${fns:getAreaValueById(talk.addressCountry, '') }${talk.addressStreet }${talk.addressDetail }
                    </td>
                    </tr>
                <tr rowspan="5">
                    <th>谈话记录：</th>
							<td colspan="5">
							 <textArea id="record" readonly="readonly" name="record" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					>${talk.record }</textArea>
								 	<br>
                </tr> 
                <tr rowspan="5">
                    <th>备注：</th>
							<td colspan="5">
							 <textArea id="note" readonly="readonly" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					>${talk.note }</textArea>
								 	<br>
                </tr>
                <tr>
                    <th width="10%">附件：</th>
                    <td colspan="5" align="left" width="89%">
                    	<div id="uploader"></div>
						<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</c:forEach>
						</div>
						
                    </td>
                </tr>
            </table>           
    </div>
    </form>
    <script>
    var reportType;
        
        $('#culpritId').combogrid({    
        	delay: 500,
        	 panelWidth: 300, 
        	 striped:true,
        	 panelHeight: 300,
    		mode: 'remote',  
			idField: 'id',
			textField: 'name',
			url: '${ctx}/culpritinfo/culprit/list',
			columns: [[
				{field:'name',title:'姓名',width:120,align:'center'},
				{field:'dicSexKey',title:'性别',width:80,align:'center'}
			]],
			fitColumns: true,
			pagination: true,           //是否分页  
        rownumbers: true,           //序号  
        collapsible: false,         //是否可折叠的  
        method: 'post',
        onSelect:function(record){
        	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
        	 $('#talkformDetail').form('load',arr[0]);
       	}
        }); 
        
        
      //取得分页组件对象  
        var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
        if (pager) {  
            $(pager).pagination({  
                pageSize: 10,               //每页显示的记录条数，默认为10  
                beforePageText: '第',       //页数文本框前显示的汉字  
                afterPageText: '',
                displayMsg: ''
            });
          }    
        
        /*选择固定居住省触发省下面的市*/
   		$('#addressPro').combobox({    
   			onSelect: function(record){
        		$('#addressCity').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName',
        		    editable:'false'    
        		}); 
			}   
   		}); 
        /*选择固定居住省触发省下面的市*/
   		$('#addressCity').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=46',    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false'    
   		}); 
       /*选择固定市触发市下面的县*/
       $('#addressCity').combobox({
       		onSelect: function(record){
       			$('#addressCountry').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName',
    		    editable:'false' 
       	
       			}); 
			}
		});
	
    </script>
