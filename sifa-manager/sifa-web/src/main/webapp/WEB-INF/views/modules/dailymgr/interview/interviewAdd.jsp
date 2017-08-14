<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>新增走访登记</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/interview/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty interview.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${interview.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="谈话教育信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="paroleId" value="${interview.id }"/>
            <table width="100%">
				<tr>
					<td width="10%">走访人:</td>
					<td width="23.5%"><input value="${interview.interviewPerson }"
						required=true missingMessage="走访人不能为空！" name="interviewPerson" id="interviewPerson"
						class="f1 easyui-textbox" /></td>
					<td width="10%">走访日期:</td>
					<td width="23.5%"><input value="${interview.interviewDate }"
						name="interviewDate" editable="false" class="easyui-datebox" /></td>
					<td width="10%">走访地点:</td>
					<td ><input value="${interview.interviewPlace }"
						required=true missingMessage="走访地址不能为空！" name="interviewPlace" id="interviewPlace"
						class="f1 easyui-textbox" /></td>
				</tr>
				<tr>
					<td >走访对象:</td>
					<td><select id="zfdx" class="easyui-combobox"  name="zfdx" id = "zfdx" style="width:44%">
							<option value="对象本人">对象本人</option>
							<option value="监护人">监护人</option>
							<option value="志愿者">志愿者</option>
							<option value="矫正小组成员">矫正小组成员</option>
							<option value="村居工作站成员">村居工作站成员</option>
							<option value="被害人">被害人</option>
							<option value="亲属">亲属</option>
							<option value="朋友">朋友</option>
							<option value="邻居">邻居</option>
							<option value="其他">其他</option>
					</select></td>
					<td>走访原因:</td>
					<td><select id="interviewReason" class="easyui-combobox"  name="interviewReason" id = "interviewReason" style="width:44%">
							<option value="日常走访">日常走访</option>
							<option value="专项活动走访">专项活动走访</option>
							<option value="节假日等特殊时间走访">节假日等特殊时间走访</option>
							<option value="违规违纪走访">违规违纪走访</option>
							<option value="帮困扶助">帮困扶助</option>
							<option value="突发事件">突发事件</option>
							<option value="其他">其他</option>
					</select></td>
					<td>行动能力:</td>
					<td><select id="xdnl" class="easyui-combobox" name="xdnl" id="xdnl" style="width:44%">
							<option value="正常">正常</option>
							<option value="行动不便">行动不便</option>
							<option value="无行动能力">无行动能力</option>
					</select></td>
				</tr>
				<tr>
					<td>健康状况:</td>
					<td><select id="jkzk" class="easyui-combobox" name="jkzk" id="jkzk" style="width:44%">
							<option value="健康">健康</option>
							<option value="一般">一般</option>
							<option value="疾病">疾病</option>
							<option value="身体残疾">身体残疾</option>
							<option value="中风">中风</option>
							<option value="高血压">高血压</option>
							<option value="糖尿病">糖尿病</option>
							<option value="心脏病">心脏病</option>
							<option value="其他">其他</option>
					</select></td>
					<td>不良嗜好:</td>
					<td><select id="blsh" class="easyui-combobox" name="blsh" id="blsh" style="width:44%">
							<option value="无">无</option>
							<option value="有吸毒史">有吸毒史</option>
							<option value="酗酒">酗酒</option>
							<option value="赌博">赌博</option>
							<option value="沉迷网络">沉迷网络</option>
							<option value="其他">其他</option>
					</select></td>
					<td>生活来源:</td>
					<td><select id="shly" class="easyui-combobox" name="shly" id="shly" style="width:44%">
							<option value="自谋职业">自谋职业</option>
							<option value="家庭资助">家庭资助</option>
							<option value="低保">低保</option>
							<option value="无生活来源">无生活来源</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr>
					<td>经济情况:</td>
					<td><select id="jjqk" class="easyui-combobox" name="jjqk" id="jjqk" style="width:44%">
							<option value="无收入">无收入</option>
							<option value="经济条件较差">经济条件较差</option>
							<option value="经济条件一般">经济条件一般</option>
							<option value="经济条件较好">经济条件较好</option>
					</select></td>
					<td>婚姻情况:</td>
					<td><select id="hyqk" class="easyui-combobox" name="hyqk" id = "hyqk" style="width:44%">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离异">离异</option>
							<option value="丧偶">丧偶</option>
					</select></td>
					<td>居住情况:</td>
					<td><select id="jzqk" class="easyui-combobox" name="jzqk" id = "jzqk" style="width:44%">
							<option value="与家人同住">与家人同住</option>
							<option value="与父母同住">与父母同住</option>
							<option value="与子女同住">与子女同住</option>
							<option value="独居">独居</option>
							<option value="住养老院、社会福利院">住养老院、社会福利院</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
					<tr>
					<td>活动情况:</td>
					<td><select id="hdqk" class="easyui-combobox" name="hdqk" id="hdqk" style="width:44%">
							<option value="正常">正常</option>
							<option value="有私自外出可能">有私自外出可能</option>
							<option value="与社会不良人员交往">与社会不良人员交往</option>
					</select></td>
					<td>重大变故:</td>
					<td><select id="zdbg" class="easyui-combobox" name="zdbg" id = "zdbg" style="width:44%">
							<option value="无">无</option>
							<option value="亲人去世">亲人去世</option>
							<option value="本人或家人失业">本人或家人失业</option>
							<option value="重大家庭纠纷">重大家庭纠纷</option>
							<option value="家人患重病">家人患重病</option>
							<option value="与他人发生重大矛盾纠纷">与他人发生重大矛盾纠纷</option>
							<option value="离异">离异</option>
							<option value="发生重大财产变化">发生重大财产变化</option>
							<option value="发生大额家庭支出">发生大额家庭支出</option>
							<option value="其他">其他</option>
					</select></td>
					<td>近期表现:</td>
					<td><select id="jqbx" class="easyui-combobox" name="jqbx" id = "jqbx" value="${interview.jqbx }" style="width:44%">
							<option value="正常">正常</option>
							<option value="有重新再犯罪倾向">有重新再犯罪倾向</option>
							<option value="有参与赌博倾向">有参与赌博倾向</option>
							<option value="有参与群体性事件倾向">有参与群体性事件倾向</option>
							<option value="有暴力倾向">有暴力倾向</option>
							<option value="有自杀倾向">有自杀倾向</option>
							<option value="与他人或家人有矛盾纠纷">与他人或家人有矛盾纠纷</option>
							<option value="情绪较波动">情绪较波动</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr rowspan="5">
                    <td>具体走访情况：</td>
							<td colspan="5"><input type="text" name="interviewCondition"   multiline=true 
								class="f1 easyui-textbox" value="${interview.interviewCondition }"  style="width:49%;height:80px;"/></td>
                </tr> 
            </table>           
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
			  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a> 
		  </p>
    </div>
    </form>
    <script>
    var reportType;
    var zfdx = "${interview.zfdx }";
    var interviewReason = "${interview.interviewReason }";
    var xdnl = "${interview.xdnl }";
    var jkzk = "${interview.jkzk }";
    var blsh = "${interview.blsh }";
    var shly = "${interview.shly }";
    var jjqk = "${interview.jjqk }";
    var hyqk = "${interview.hyqk }";
    var jzqk = "${interview.jzqk }";
    var hdqk = "${interview.hdqk }";
    var zdbg = "${interview.zdbg }";
    var jqbx = "${interview.jqbx }";
    $('#zfdx').combo({    
        value:zfdx
    });
    $('#interviewReason').combo({    
        value:interviewReason
    });
    $('#xdnl').combo({    
        value:xdnl
    });
    $('#jkzk').combo({    
        value:jkzk
    });
    $('#blsh').combo({    
        value:blsh
    });
    $('#shly').combo({    
        value:shly
    });
    $('#jjqk').combo({    
        value:jjqk
    });
    $('#hyqk').combo({    
        value:hyqk
    });
    $('#jzqk').combo({    
        value:jzqk
    });
    $('#hdqk').combo({    
        value:hdqk
    });
    $('#zdbg').combo({    
        value:zdbg
    });  
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        function back(){
            parent.location.reload();
     			var index = parent.layer.getFrameIndex(window.name);
     		parent.layer.close(index);
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/dailymgr/interview/save',
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
        				parent.location.reload();
        				
            			var index = parent.layer.getFrameIndex(window.name);
    					parent.layer.close(index);
    					
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
        $('.easyui-combobox').combo({    
            edit:false
        });  
	
    </script>
</body>
</html>
