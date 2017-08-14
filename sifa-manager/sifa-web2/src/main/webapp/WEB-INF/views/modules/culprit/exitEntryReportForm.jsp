<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="" method="post" id="exitEntryReportInfo">
 <input type="hidden" name="id" id="exitEntryReportId" value="${exitEntryReport.id}"/>
     <div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid" id="addTable">
            	<c:if test="${exitEntryReport.dicZjlxKey == null}">
            	 <tr>
            			<th width="15%">证件类型：</th>
				   		<td width="30%">
				   			<input name="dicZjlxKey" class="easyui-combobox" id="dicZjlxKey0" required=true
								data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=60000',panelHeight:'auto',editable:false"></input>
				   		</td>
						<th width="15%">证件号码：</th>
							<td width="30%"  style="border-right:0;">
							<input name="cedentialsNumber" class="f1 easyui-textbox" required=true id="cedentialsNumber0"/>
						</td>
						<td width="10%" style="border-left:0;">
						<a  class="easyui-linkbutton" onClick='addtr()' data-options="iconCls:'fi-plus icon-green'">新增</a>
						</td>
					</tr>
            		</c:if>
            		<c:if test="${exitEntryReport.dicZjlxKey != null}">
            			<c:set value="${fn:split(exitEntryReport.dicZjlxKey,',') }" var="ths"></c:set>
              			<c:forEach items="${ths }" var="th" varStatus="status">
              				<tr>
                  	                                                                                                                                                                                                                                                                                                		<th width="15%">证件类型：</th><td width="30%">
                  			<input class="easyui-combobox"  value="${th}" name="dicZjlxKey" required=true
								data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=60000',panelHeight:'auto',editable:false"></td>
                  			<th width="15%">证件号码：</th><td width="30%" style="border-right:0;">
                  			<input name="cedentialsNumber" value="${fn:split(exitEntryReport.cedentialsNumber, ',')[status.count-1]}" class="f1 easyui-textbox" required=true/></td>
              				<c:if test="${status.count-1==0}">
              					<td width="10%" style="border-left:0;">
              						<a  class="easyui-linkbutton" onClick='addtr()' data-options="iconCls:'fi-plus icon-green'">新增</a>
              					</td>
              				</c:if>
              				<c:if test="${status.count-1!=0}">
              					<td width="10%" style="border-left:0;" onClick='getDel(this)'>
              						<a  class="easyui-linkbutton" data-options="iconCls:'fi-x icon-red'">删除</a>
              					</td>
              				</c:if>
							</tr>
              			</c:forEach>
					</c:if>
                <tr>
                    <th>收缴时间：</th>
					<td><input name="filingDate" id="filingDate" 
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<fmt:formatDate value="${exitEntryReport.filingDate}" pattern="yyyy-MM-dd" />"/></td>
					<th>收缴人：</th>
					<td colspan="2"><input name="handlingPerson" id="handlingPerson" class="f1 easyui-textbox" value="${exitEntryReport.handlingPerson}"/></td>
                </tr>
                <tr>
                    <th>通报备案事由&nbsp;&nbsp;&nbsp;<br/>及法律依据 ：</th>
					<td colspan="4"><textarea name="filingReason" id="filingReason" class="easyui-validatebox" multiline="true"
						onkeydown='textarealength(this,100)' onkeyup='textarealength(this,100)' onMouseOut="textarealength(this,200)" 
						style="width:90%; height: 80px; overflow: hidden;" maxlength=100><c:if test="${exitEntryReport.filingReason==null}">通报备案事由:矫正人员${culprit.name }犯${culprit.culpritJudgment.crimeInfo}，于<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" />被宣告缓刑。 根据《中华人民共和国护照法》第十三条第四项和《中华人民共和国出入境管理法》第八条第三项之规定，应不予批准出境。</c:if><c:if test="${exitEntryReport.filingReason!=null}">${exitEntryReport.filingReason}</c:if></textarea> <br />
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">${fn:length(exitEntryReport.filingReason)}</em>个字。
					</p></td>
                </tr>
            </table>
    </div>
    </form>
    <div style="text-align: center;display: none;">
	    <a id="saveExitEntryReportBtn" class="easyui-linkbutton" >保存</a>
    </div>
    <div style="text-align: center;display: none;">
	    <a id="arrowUpBtn" class="easyui-linkbutton" >上报</a>
    </div>
<script type="text/javascript">
$(function(){
	var rows=$('#addTable tr').length;
	for(var i=0;i<=rows;i++){
		 $("#dicZjlxKey"+i).combobox({
			 onSelect: function(record){
				var str=$(this).attr('id');
				var id=str.substring(str.length-1,str.length);
        		if(record.key=="60001"){//身份证
        			$("#cedentialsNumber"+id).textbox({ validType:'idcard' });
        		}else if(record.key=="60002"){//护照
        			$("#cedentialsNumber"+id).textbox({ validType:'passportNum' });
        		}else if(record.key=="60003"){//回乡证
        			$("#cedentialsNumber"+id).textbox({ validType:'' });
        		}else if(record.key=="60004"){//台胞证
        			$("#cedentialsNumber"+id).textbox({ validType:'tbcard' });
        		}else if(record.key=="60005"){//港澳台通行证
        			$("#cedentialsNumber"+id).textbox({ validType:'gatcard' });
        		}else if(record.key=="60006"){//决定机关已收缴
        			$("#cedentialsNumber"+id).textbox({ validType:'' });
        		}else if(record.key=="60007"){//其他机关收缴
        			$("#cedentialsNumber"+id).textbox({ validType:'' });
        		}

        	}
		   });
	}
	
})

var num=1;
function addtr(){
	var str='';
    str+="<tr>";
    str+="<th width='15%'>证件类型：</th>";
    str+="<td width='30%'><input name='dicZjlxKey' id='dicZjlxKey"+num+"'></input></td>";
    str+="<th width='15%'>证件号码：</th>";
    str+="<td width='30%' style='border:0;'><input name='cedentialsNumber' id='cedentialsNumber"+num+"'/></td>";
    str+="<td width='10%' style='border:0;'  onClick='getDel(this)'><a name='delBtn' id='delBtn"+num+"'>删除</a></td>";   
    str+="</tr>"; 
    $("#addTable  tr:eq(0)").after(str);
    	$("#delBtn"+num).linkbutton({
			iconCls:'fi-x icon-red'
		});  
    $("#cedentialsNumber"+num).textbox({required:true});
    $("#dicZjlxKey"+num).combobox({
    	url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=dicZjlxKey&parentKey=60000',    
	    valueField:'id',    
	    textField:'value',
	    panelHeight:'auto',
	    required:true,
	    onSelect: function(record){
			var str=$(this).attr('id');
			var id=str.substring(str.length-1,str.length);
    		if(record.key=="60001"){//身份证
    			$("#cedentialsNumber"+id).textbox({ validType:'idcard' });
    		}else if(record.key=="60002"){//护照
    			$("#cedentialsNumber"+id).textbox({ validType:'passportNum' });
    		}else if(record.key=="60003"){//回乡证
    			$("#cedentialsNumber"+id).textbox({ validType:'' });
    		}else if(record.key=="60004"){//台胞证
    			$("#cedentialsNumber"+id).textbox({ validType:'tbcard' });
    		}else if(record.key=="60005"){//港澳台通行证
    			$("#cedentialsNumber"+id).textbox({ validType:'gatcard' });
    		}else if(record.key=="60006"){//决定机关已收缴
    			$("#cedentialsNumber"+id).textbox({ validType:'' });
    		}else if(record.key=="60007"){//其他机关收缴
    			$("#cedentialsNumber"+id).textbox({ validType:'' });
    		}
    	} 
    });
    num++;
}

function getDel(k){
    $(k).parent().remove();     
}

var workRemindFlag='${workRemindFlag}';
$('#saveExitEntryReportBtn').click(function (){
	var dicZjlxKey='';
	var cedentialsNumber='';
	$("input[name='dicZjlxKey']").each(function(){ 
		dicZjlxKey+=","+$(this).val();
    });  
    $("input[name='cedentialsNumber']").each(function(){ 
    	cedentialsNumber+=","+($(this).val().toUpperCase());
    });
    dicZjlxKey=dicZjlxKey.substring(1,dicZjlxKey.length); 
	cedentialsNumber=cedentialsNumber.substring(2,cedentialsNumber.length);
	var filingDate=$("#filingDate").val();
	var handlingPerson=$("#handlingPerson").val();
	var id=$("#exitEntryReportId").val();
	var filingReason=$("#filingReason").val();
	var data={id:id,dicZjlxKey:dicZjlxKey,cedentialsNumber:cedentialsNumber,filingDate:filingDate,handlingPerson:handlingPerson,filingReason:filingReason};
	if ($('#exitEntryReportInfo').form('validate')) {
		$.ajax({
			type: 'post' ,
			url: '${ctx}/inculprit/exitEntryReport/save?dicIsCollectKey=1',
			cache:false ,
			data:data ,
			dataType:'json',
			success:function(data){
				if(workRemindFlag!='0'){
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
		            parent.$.modalDialog.handler.dialog('close');
				}
	             $.messager.show({
						title:'提示信息!',
						msg:data.msg
				});
			} ,
			error:function(data){
				$.messager.show({
	 					title:'提示信息!',
	 					msg:data.msg
	 				});
			}
		});
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据未填写完整,不能保存!'
		});
	}
});

$('#arrowUpBtn').click(function (){
	var dicZjlxKey='';
	var cedentialsNumber='';
	$("input[name='dicZjlxKey']").each(function(){ 
		dicZjlxKey+=","+$(this).val();
    });  
    $("input[name='cedentialsNumber']").each(function(){ 
    	cedentialsNumber+=","+($(this).val().toUpperCase());
    });
    dicZjlxKey=dicZjlxKey.substring(1,dicZjlxKey.length); 
	cedentialsNumber=cedentialsNumber.substring(2,cedentialsNumber.length); 
	var filingDate=$("#filingDate").val();
	var handlingPerson=$("#handlingPerson").val();
	var id=$("#exitEntryReportId").val();
	var filingReason=$("#filingReason").val();
	var data={id:id,dicZjlxKey:dicZjlxKey,cedentialsNumber:cedentialsNumber,filingDate:filingDate,handlingPerson:handlingPerson,filingReason:filingReason};
	if ($('#exitEntryReportInfo').form('validate')) {	
			$.ajax({
				type: 'post' ,
				url: '${ctx}/inculprit/exitEntryReport/arrowUp',
				cache:false ,
				data:data ,
				dataType:'json',
				success:function(data){
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
			            parent.$.modalDialog.handler.dialog('close');
			            $.messager.show({
							title:'提示信息!',
							msg:data.msg
					});
				} ,
				error:function(data){
					$.messager.show({
								title:'提示信息!',
								msg:data.msg
							});
				}
			});
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据未填写完整,不能保存!'
		});
	}
});


</script>
    
    