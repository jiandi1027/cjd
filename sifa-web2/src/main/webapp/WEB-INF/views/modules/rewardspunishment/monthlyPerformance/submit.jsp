<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>



<form method="post" id="submitform">
 <input type="hidden" name="id" id="id" value="${monthlyPerformance.id}"/>
 	<c:choose>
 		<c:when test="${empty monthlyPerformance.culpritId }">
 		<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="submitform" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	    <sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${monthlyPerformance.culpritId}" formId="submitform" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
     <div class="easyui-panel" id="revokeProbation_p3" title="请假历史" style="width:100%;padding:5px;margin:0 auto;">
             <table width="100%" class="grid">
                <tr>
                  <th width="15%"  style="text-align:center;">请假申请时间</th>
                   <th width="15%"  style="text-align:center;">请假理由</th>
                   <th width="15%"  style="text-align:center;">请假地点</th>
                   <th width="15%"  style="text-align:center;">开始时间</th>
                   <th width="15%"  style="text-align:center;">结束时间</th>
                   <th width="10%"  style="text-align:center;">请假状态</th>
                   <th width="10%"  style="text-align:center;">是否逾期</th>
                   
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                </tr>
                 </c:forEach>
            </table>
    </div>
      <div class="easyui-panel" id="revokeProbation_p3" title="近期日常报道纪录" style="width:100%;padding:5px;margin:0 auto;">
             <table width="100%" class="grid">
                <tr>
                  <th width="15%"  style="text-align:center;">报道日前</th>
                   <th width="15%"  style="text-align:center;">报道方式</th>
                   <th width="15%"  style="text-align:center;">是否按时</th>
                   <th width="30%"  style="text-align:center;">纪录人</th>
                   
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                   
                </tr>
                 </c:forEach>
            </table>
    </div>
     <div class="easyui-panel" title="月度考核评议信息" style="width:100%;">
            <table width="100%" class="grid" style="border-style:none">
                <tr>
                   <th width="10%">评定月份:</th>
				   <td> 
					<input readonly = 'readonly' type="text" name="monthlyDate" id="monthlyDate" value="${monthlyPerformance.monthlyDate}"/>
				   </td>
                </tr>
                <tr width="100%">
                    <th style="padding:1px;margin:0 auto;">主要表现:</th>
					<td style="padding:2px;margin:0 auto;"colspan="4"><input readonly = 'readonly'type="text" name="mainShow" value="${monthlyPerformance.mainShow }"  
								class="f1 easyui-textbox" multiline="true" style = "width:100%;padding:0px;margin:0 auto;"/></td>
                </tr>
                  <tr width="100%">
                    <th>其他情况:</th>
							<td style="padding:2px;margin:0 auto;"colspan="4"><input type="text" name="otherShow" value="${monthlyPerformance.otherShow }"  
								class="f1 easyui-textbox" multiline="true" style = "width:100%;"/></td>
                </tr>
                <tr>
                <th><span class="c-red">*</span>评议等级:</th>
							<td style="padding:2px;margin:0 auto;"colspan="5">
								<select name = 'monthlyPerGradeId'>
								<option value="合格" selected="selected">合格</option>
								<!-- 
								<option value="基本合格" <c:if test="${monthlyPerformance.monthlyPerGradeId eq'基本合格' }"> selected="selected"</c:if>>基本合格</option>
							    <option value="不合格" <c:if test="${monthlyPerformance.monthlyPerGradeId eq'不合格' }"> selected="selected"</c:if>>不合格</option>
								 -->
								 <option value="基本合格">基本合格</option>
							    <option value="不合格">不合格</option>
								</select>
								</td>
								
								 </tr>
            </table>
    </div>
   <!-- <div class="easyui-panel" title="报到记录" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table class="easyui-datagrid" id="t_list_content" title=" " style="width: 100%;height: 400px;" data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=${culpritId}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'shouldReportDate',width:'30%',align:'center'" >应报到日期</th>
					<th data-options="field:'reportDate',width:'40%',align:'center'" >报到日期</th>
					<th data-options="field:'dicTypeKey',width:'30%',align:'center',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT','DIC_TYPE_KEY',value,'')}" >报到方式</th>
				</tr>
			</thead>
		</table>
	</div> --> 
    </form>
    
    <script>
    function submitForm(){
        	 $('#submitform').form('submit');
        }
        $(function() {
        	$('#submitform').form({
        		url:'${ctx}/rewardspunishment/monthlyPerformance/submitMonthly',
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
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:'上报成功'
        				});
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为submit.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			progressClose();
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
        	 $('#submitform').form('load',arr[0]);
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
         
	