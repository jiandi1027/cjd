<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
 <form  action="${ctx}/dailymgr/talk/save" method="post" id="talkformAdd">
 	<c:choose>
 		<c:when test="${empty talk.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="talkformAdd" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${talk.culpritId}" formId="talkformAdd" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="谈话教育信息"  style="width:100%;padding:5px;">
           <input type="hidden" name="id" id="paroleId" value="${talk.id }"/>
            <table width="100%" class= "grid">
                <tr>
                    <th width="10%" ><span class="c-red">*</span>谈话人：</th>
                    <td width="23%"><input value="${talk.talkor }" data-options=' panelHeight : "auto",panelMaxHeight : "200"' required=true missingMessage="谈话人不能为空！" name="talkor" id="talkor" class="easyui-combobox"/></td>
                     <th width="10%" >记录人：</th>
                    <td style="border:0px solid;"width="23%"><input value="${talk.recorder }" name="recorder" id="recorder" class="f1 easyui-textbox" /></td>
                     <td style="border:0px solid;"  width="10%" ></td>
                    <td style="border:0px solid;"  width="23%"></td>
                </tr>
                  <tr>
                   <th ><span class="c-red">*</span>谈话日期：</th>
                    <td >
                     <input type="text" id="talkTime" name="talkTime" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${talk.talkTime }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true  />
                    </td>
                    <th><span class="c-red">*</span>谈话开始时间：</th>
                    <td >
                     <input type="text" id="talkStartTime" name="talkStartTime" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${talk.talkStartTime }"
					pattern="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" required=true  />
                   </td>
                     <th ><span class="c-red">*</span>谈话结束时间：</th>
                    <td>
                    <input type="text" id="talkEndTime" name="talkEndTime" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${talk.talkEndTime }"
					pattern="yyyy-MM-dd HH:mm:ss" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" required=true  />
                    </td>
                </tr>
                <tr>
                 <th><span class="c-red">*</span>谈话地点：</th>
                    <td colspan="5"><input name="addressPro" id="addressPro" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false" value='${talk.addressPro }'></input>省
                    	<input name="addressCity" id="addressCity" class="easyui-combobox" required=true editable=false value= '${talk.addressCity}'></input>市
                    	<input name="addressCountry" id="addressCountry" class="easyui-combobox" required=true editable=false value = '${talk.addressCountry }'></input>县（区）
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" value = '${talk.addressStreet }' />乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" value = '${talk.addressDetail }' />（详细门牌号）
                    </td>
                    </tr>
                <tr rowspan="5">
                    <th><span class="c-red">*</span>谈话记录：</th>
							<td colspan="5">
							 <textArea id="record" name="record" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,1000)' required=true  onKeyUp="textarealength(this,1000)" maxlength="1000">${talk.record }</textArea>
								 	<br>
								 	备注：此处最多可以输入<em class="c-red">1000</em>个字，你已输入<em class="textarea-length c-red"> 
						<c:if test="${talk.record==null}">0</c:if>
						<c:if test="${talk.record!=null}">${fn:length(talk.record)}</c:if></em>个字。</td>
                </tr> 
                <tr rowspan="5">
                    <th>备注：</th>
							<td colspan="5">
							 <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${talk.note }</textArea>
								 	<br>
								 	备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red"> 
						<c:if test="${talk.note==null}">0</c:if>
						<c:if test="${talk.note!=null}">${fn:length(talk.record)}</c:if></em>个字。</td>
                </tr>
                <tr>
                    <th width="10%">附件：</th>
                    <td colspan="5" align="left" width="89%">
                    	<div id="uploader"></div>
						<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
						</c:forEach>
						</div>
                    </td>
                </tr>
            </table>           
    </div>

    </form>
    <script>
    var reportType;
        function submitForm(){
        	 $('#talkformAdd').form('submit');
        }
        function clearForm(){
            $('#talkformAdd').form('clear');
        }
        $(function() {
        	$("#uploader").powerWebUpload({ auto: true,fileNumLimit:5,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
        	
        	$('#talkformAdd').form({
        		url:'${ctx}/dailymgr/talk/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                        parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        			}
        			
        		}
        	});	
        
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
        	 $('#talkformAdd').form('load',arr[0]);
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
        });
        

        /*选择固定居住省触发省下面的市*/
   		$('#addressPro').combobox({    
   			onSelect: function(record){
        		$('#addressCity').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName',
        		    onLoadSuccess:function(){
    	       			var data = $('#addressCity').combobox('getData');
    	       			//alert('${talk.addressPro}          '+$('#addressPro').combobox('getValue'));
                 		if (data.length > 0) {
                 			if($('#addressPro').combobox('getValue')=='${talk.addressPro}'){
                 				$('#addressCity').combobox('select', '${talk.addressCity}');
                 			}else{
                 				$('#addressCity').combobox('setValue', '');
                 				$('#addressCountry').combobox('setValue', '');
                 			}
                 		} 
                 		
    	       		},
        		    editable:'false'    
        		}); 
			}   
   		
   		}); 
        
       /*选择固定市触发市下面的县*/
       $('#addressCity').combobox({
       		onSelect: function(record){
       			$('#addressCountry').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName',
       		 onLoadSuccess:function(){
    		 		$('#addressCountry').combobox('setValue', '');
     			var data = $('#addressCountry').combobox('getData');
 	      		if (data.length > 0) {
 	      			//alert('${talk.addressCity}          '+$('#addressCity').combobox('getValue'));
 	      			if($('#addressCity').combobox('getValue')=='${talk.addressCity}'){
         				$('#addressCountry').combobox('select', '${talk.addressCountry}');
         			}else{
         				$('#addressCountry').combobox('setValue', '');
         			}
 	      		} 
     			
     		},
    		    editable:'false' 
       	
       			}); 
			}
		});
		
       $('#talkor').combobox({    
      		mode : 'remote',
   	    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${fns:getSysAccount().groupId }',    
   	    valueField:'id',    
   	    textField:'accountname'
   	   
   	}); 
	
    </script>
