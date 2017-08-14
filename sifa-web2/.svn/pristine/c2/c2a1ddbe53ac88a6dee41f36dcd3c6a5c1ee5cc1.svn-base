<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

 <form  action="${ctx}/rewardspunishment/warning/save" method="post" id="warningInfo">
 	<c:choose>
 		<c:when test="${empty warning.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${warning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red">*</span>违纪原因：</th>
                   <td >
                   	<select id="dicReasonTypeKey" class="f1 easyui-combobox" name="dicReasonTypeKey" missingMessage="违纪原因不能为空!"
							required="true"	data-options="editable:false"	>
						<option value="未按时报到">未按时报到</option>
						<option value="2次无理由不参加活动">2次无理由不参加活动</option>
						<option value="不及时销假">不及时销假</option>
						<option value="违反报告，外出，居住地变更规定">违反报告，外出，居住地变更规定</option>
						<option value="保外就医无正当理由不按时提交病情情况">保外就医无正当理由不按时提交病情情况</option>
						<option value="违反禁止令，情节轻微">违反禁止令，情节轻微</option>
						<option value="一年内违反信息核查3次（含）以上">一年内违反信息核查3次（含）以上</option>
						<option value="其他违反监督管理">其他违反监督管理</option>
						<option value="违法越界">违法越界</option>
						<option value="人机分离">人机分离</option>
						<option value="未参加集中点验">未参加集中点验</option>
					</select>
				  </td>
                </tr> 
                 <tr>
                 	 <th ><span class="c-red"></span>附件上传：</th>
					<td >
						<div id="u" ></div>
					</td>
                 </tr>
				<tr>
					<th ><span class="c-red">*</span>主要事实：</th>
					<td >
						<textArea class="f1 easyui-validatebox"
							data-options="multiline:true" name="fact" required=true id="fact" onMouseOut="textarealength(this,200)"
							style="width: 600px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
						<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字
					</td>
				</tr>
				<tr>	
					<th>处理依据：</th>
					<td>
						<input type="checkbox" id='check1' name="notePathName" value="用户管理《社区矫正实施办法》第二十三条" />
						<label for='check1'>用户管理《社区矫正实施办法》第二十三条</label>
					</td>
					</tr>
				<tr>
					<th></th>
					<td>
						<input type="checkbox" id='check2' name="legalBasis" value="浙江省社区矫正实施细则（试行）》第三十六条" />
						<label for='check2'>《浙江省社区矫正实施细则（试行）》第三十六条</label>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="checkbox" id='check3' name="legalBasisItems" value="《浙江省社区矫正人员考核奖惩办法（试行）》第四十条" />
						<label for = 'check3'>《浙江省社区矫正人员考核奖惩办法（试行）》第四十条</label>
					</td>
				</tr>
			</table>
    </div>
 </form>
<script>
	
        function submitForm(){
        	 $('#warningInfo').form('submit');
        }
        function clearForm(){
            $('#warningInfo').form('clear');
        }
 
        	
      	   $(function() {
      		 $("#u").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
      		$("#repentancePath").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
      		
     
      	       	$('#warningInfo').form({
      	       		url:'${ctx}/rewardspunishment/warning/save',
      	       		onSubmit:function(){
      	       			
      	       			
      	       			 progressLoad();
      	       			 var isValid = $(this).form('validate');
      	       			
      	                    if (!isValid) {
      	                        progressClose();
      	                    }
      	                    return isValid;
      	       		},
      	       		success:function(data){
      	       			data = JSON.parse(data);
      	       			progressClose();
	      	       		var flag = '${isAddFlag}';
	  	   				if (flag == 1) {
	  	   					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	  		   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	  		                parent.$.modalDialog.handler.dialog('close');
	  					}
	  	   				else {
	  						$('#overAlarmDialog').dialog("close");
	  	   				}
      	       			if(data.status==200){
      	       				$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:data.msg
      	       				});
      	       			}else{
      	       				 parent.$.messager.alert('错误', result.msg, 'error');
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
        	 $('#culpritInfo').form('load',arr[0]);
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
        
	
    </script>

