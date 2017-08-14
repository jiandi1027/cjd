<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
 <form  action="${ctx}/dailymgr/interview/save" method="post" id="interviewDetailform">
 	<c:choose>
 		<c:when test="${empty interview.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="interviewDetailform" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${interview.culpritId}" formId="interviewDetailform" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="走访登记信息" style="width:100%;padding:5px;">
           <input type="hidden" name="id" id="paroleId" value="${interview.id }"/>
            <table width="100%" class='grid'>
				<tr>
					<th width="10%" align="right">走访人：</th>
					<td width="23%">${interview.interviewPerson }</td>
					<th width="10%" align="right">走访日期：</th>
					<td width="23%" style="border:0px solid;"><fmt:formatDate value="${interview.interviewDate}" pattern="yyyy-MM-dd" /></td>
					<td style="border:0px solid;"  width="10%" ></td>
                    <td style="border:0px solid;"  width="23%"></td>
				</tr>
				<tr>
					<th >走访对象：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','ZFDX',interview.zfdx,'')}</td>
					<th>走访原因：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','INTERVIEW_REASON',interview.interviewReason,'')}</td>
					<th>行动能力：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','XDNL',interview.xdnl,'')}</td>
				</tr>
				<tr>
					<th>健康状况：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','JKZK',interview.jkzk,'')}</td>
					<th>不良嗜好：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','BLSH',interview.blsh,'')}</td>
					<th>生活来源：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','SHLY',interview.shly,'')}</td>
				</tr>
				<tr>
					<th>经济情况：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','JJQK',interview.jjqk,'')}</td>
					<th>婚姻情况：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','HYQK',interview.hyqk,'')}</td>
					<th>居住情况：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','JZQK',interview.jzqk,'')}</td>
				</tr>
					<tr>
					<th>活动情况：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','HDQK',interview.hdqk,'')}</td>
					<th>重大变故：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','ZDBG',interview.zdbg,'')}</td>
					<th>近期表现：</th>
					<td>${fns:getSysDicValueByKey('SF_INTERVIEW','JQBX',interview.jqbx,'')}</td>
				</tr>
				    <tr>
                <th>走访地点：</th>
                    <td >
                      ${fns:getAreaValueById(interview.addressPro, '') }${fns:getAreaValueById(interview.addressCity, '') }${fns:getAreaValueById(interview.addressCountry, '') }${interview.addressStreet }${interview.addressDetail }
                    </td>
                    <tr>
				<tr rowspan="5">
                    <th>具体走访情况：</th>
							<td colspan="5">
							<textArea id="interviewCondition" name="interviewCondition" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${interview.interviewCondition }</textArea></td>
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
 <!--     <div align="center">
           <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" >打印《社区矫正人员走访情况登记表》</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a> 
		  </p>
    </div> -->
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
        	 $('#interviewDetailform').form('submit');
        }
        function clearForm(){
            $('#interviewDetailform').form('clear');
        }
        function back(){
        	parent.location.reload();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
        }
        $(function() {
        	$('#interviewDetailform').form({
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
      	$('#interviewPerson').combobox({    
       		mode : 'remote',
    	    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${fns:getSysAccount().groupId }',    
    	    valueField:'id',    
    	    textField:'accountname'
    	   
    	}); 
    </script>

