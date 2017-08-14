<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">
var hasOpen=false;
var hasOpen1=false;
	//添加矫正对象信息
	function addCulpritInfo(){
		 parent.$.modalDialog({
	         title : '添加信息',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-200,
	         resizable:true,
	         maximizable:true,
	         href : '${ctx}/culpritinfo/culprit/form',
	         buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#culpritInfo_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#culpritAddFormBtn1');
	                 f.click();
	             }
	         },{
	             text : '重置',
	             iconCls:'icon-undo',
	             handler : function() {
	            	 var f = parent.$.modalDialog.handler.find('#culpritInfo');
	            	 f.get(0).reset(); //清空表单数据 
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	         }  ]
	     });
	}
	$('#searchCulpritFormbtn').click(
			function() {
				$('#culpritInfo_list_content').datagrid('load',
						serializeForm($('#culpritInfoSearchForm')));
			});

	$('#cleanCulpritFormSearch').click(function () {
		$('#culpritInfo_list_content').datagrid('load', {});
		$('#search_dicPenalTypeKey1').combobox('reset');
		$('#search_dicFirstReportGetKey').combobox('reset');
		$('#search_dicFirstReportTypeKey').combobox('reset');
		$('#search_dicAdjudgeRedressOrgKey').combobox('reset');
		$('#culpritInfoSearchForm').form('clear');
		
	});
	
	//删除犯人
	function deleteCulpritInfo(){
		var arr = $('#culpritInfo_list_content').datagrid('getSelections');
		if (arr.length <= 0) {
			$.messager.show({
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} else {
			$.messager.confirm('提示信息', '确认删除?', function(r) {
				if (r) {
					$.post('${ctx}/culpritinfo/culprit/delete', {
						id : arr[0].id
					}, function(result) {
						//1 刷新数据表格 
						$('#culpritInfo_list_content').datagrid('reload');
						//2 清空idField   
						$('#culpritInfo_list_content').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show({
							title : '提示信息!',
							msg : '操作成功!'
						});
					});
				} else {
					return;
				}
			});
		}
		
	}
	
	
	
	
	$(function() {
		
		
		//js方法：序列化表单 			
		
	});
	function serializeForm(form) {
		var obj = {};
		$.each(form.serializeArray(),
				function(index) {
					if (obj[this['name']]) {
						obj[this['name']] = obj[this['name']] + ','
								+ this['value'];
					} else {
						obj[this['name']] = this['value'];
					}
				});
		return obj;
	}
	function formatRole(value, row, index) {
		var str = '';
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				str = result.name;
			}
		});
		return str;

	}
	
	
	function submitAskLeave(id){
		alert(id);
		$.ajax({
			type : 'get',
			url : '${ctx}/culprit/moveIn/submitMoveIn?id=' + id,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==200){
					alert("申请成功！");
				}
				
			}
		});
	}
//操作
var roleId='${sysAccount.roleId}';
function formatterAct(value,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-firstReport-info" onclick="detailCulprit(\''+row.id+'\')">详细</a>';
	//司法所办理入矫
	/* if(row.hasPermission==1 && row.finshInfo==0){
		operation='<a href="javascript:void(0);" class="organization-easyui-firstReport-book" onclick="deal(\''+row.id+'\')">办理入矫</a>'+space;
	} */
	
	if(row.finshInfo==0){
		//司法所办理入矫
		<shiro:hasPermission name="culpritinfo/culprit/deal">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-firstReport-book" data-options="plain:true,iconCls:\'fi-book icon-blue\'" onclick="deal(\''+row.id+'\')">办理入矫</a>';
		</shiro:hasPermission>
		//矫正科修改信息
		<shiro:hasPermission name="culpritinfo/culprit/update">
		if(row.dicFirstReportGetKey=='1570003' || row.dicFirstReportGetKey==null){//直接报到显示'修改',否则显示"处理"
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-firstReport-pencil" onclick="updateCulprit(\''+row.id+'\')">修改</a>'+space;
		}else{
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-firstReport-pencil1" onclick="updateCulprit(\''+row.id+'\')">处理</a>'+space;
		}
		</shiro:hasPermission>
	}
	
    return operation;
	 
}

//办理入矫dealDialog
function deal(id){
	parent.$.modalDialog({
         title : '办理入矫',
         iconCls:'fi-book icon-blue',
         width : sy.getBrowerWidth()-700,
         height : 400,
         resizable:true,
         maximizable:true,
         modal:true,
         href : '${ctx}/culpritinfo/culprit/deal?id=' + id,
         buttons : [ {
           	 text : '完成入矫',
                iconCls:'icon-save',
                handler : function() {
                	for(var i=1;i<10;i++){
                		var finish=$('#finshInfo'+i).html();
                		if(finish==''){
                			$.messager.alert({
            					title : '提示信息!',
            					msg : '请确认首次报到各事项是否完成!'
            				});	
                			return false;
                		}
                		
                	}
                	               	
                	$.messager.confirm('提示信息', '确认完成入矫?', function(r) {
        				if (r) {
        					$.ajax({
                    			type : 'post',
                    			url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&finshInfo=1',
                    			cache : false,
                    			async : false, //同步请求
                    			dataType : 'json',
                    			success : function(result) {
                    				if(result.status==200){
                    				$.messager.show({
                    					title : '提示信息!',
                    					msg : '完成入矫!'
                    				});	
                    				}
                    			}
                    		});
        					//$('#dealDialog').dialog('close');
                        	parent.$.modalDialog.handler.dialog('close');
                        	$('#culpritInfo_list_content').datagrid('load', {});
        				} else {
        					return;
        				}
        			});

                }
            },{
                text : '关闭',
                iconCls:'fi-x icon-blue',
                handler : function() {
               	 parent.$.modalDialog.handler.dialog('close');
                	
                }
            }] 		 
     });	
}

//首次报道信息详细
function detailCulprit(id){
	parent.$.modalDialog({
        title : '详细',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable:true,
        maximizable:true,
        modal:true,
        href : '${ctx}/culpritinfo/culprit/detail?id=' + id,
        buttons : [ {
       	 	text : '打印《告知书》',
            iconCls:'fi-print icon-blue',
            handler : function() {
             		var f = parent.$.modalDialog.handler.find('#printGZS1');
             		f.click();			
            	}
        } ,{
       	 text : '打印《报到情况通知单》',
            iconCls:'fi-print icon-blue',
            handler : function() {
            	var f = parent.$.modalDialog.handler.find('#printBDTZD');
         		f.click();	
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }] 
    });	
	
}

//修改首次报道
function updateCulprit(id){
	parent.$.modalDialog({
        title : '信息修改',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable:true,
        maximizable:true,
        href : '${ctx}/culpritinfo/culprit/update?id=' + id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#culpritInfo_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                //var f = parent.$.modalDialog.handler.find('#culpritInfo');
                //f.submit();
                var f = parent.$.modalDialog.handler.find('#culpritAddFormBtn1');
                f.click();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#culpritInfo');
           	 f.get(0).reset(); //清空表单数据 
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }  ]
    });
}



function penalType(value,row,index){
	if(value){
		return sy.getDicValue('sf_investigate','entrust_type_id',value,index);
	}else{
		return '未录入'
	}
}
function crimeInfo(value,row,index){
	if(row.culpritJudgment){
		return row.culpritJudgment.crimeInfo;
	}else{
		return '未录入'
	}
}

$(function(){
	$('#culpritName1').combobox({ 
		url:'${ctx}/culpritinfo/culprit/findAll?finshInfo=0',    
	    valueField:'name',    
	    textField:'name',
	    mode: 'local',
	    editable:'false' ,
	    panelHeight:'auto',
	    panelMaxHeight:200,
	    filter: function(q, row){ //自动过滤数据
	        var opts = $(this).combobox('options');  
	        return row[opts.textField].indexOf(q) >= 0;
	    }
	});
});


</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="culpritInfoSearchForm" class="confirmForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:true">
			<div region="center" border="false">
				<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="culpritInfo_list_content"/>
		           </c:if>
		            <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"  style="width:100%;">
					<table>
						<tr>
							<td class="search-title">报到对象： </td>
							<td>
								<input name="name" id="culpritName1"/>
							</td>	
						</tr>
						<tr>
							<td class="search-title">人员编号：  </td>
							<td><input name="no" class="easyui-textbox" /></td>
						</tr>
						<tr>	
							<td class="search-title">身份证号： </td>
							<td><input name="identification" class="easyui-textbox" /></td>
						</tr>
						<tr>	
							<td class="search-title">矫正类别： </td>
							<td>
							<input name="dicPenalTypeKey" id="search_dicPenalTypeKey1" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
						<tr>	
							<td class="search-title">报到类型： </td>
							<td>
							<input name="dicFirstReportGetKey" id="search_dicFirstReportGetKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=culprit_table&columnName=dicFirstReportGetKey&parentKey=1570000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
						<tr>	
							<td class="search-title">报到状态： </td>
							<td>
							<input name="dicFirstReportTypeKey" id="search_dicFirstReportTypeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=culprit_table&columnName=dicFirstReportTypeKey&parentKey=1580000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
						<tr>	
							<td class="search-title">决定机关： </td>
							<td>
							<input name="dicAdjudgeRedressOrgKey" id="search_dicAdjudgeRedressOrgKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=DIC_ENTRUST_UNIT_TYPE_KEY&parentKey=85000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
						<tr>
							<td class="search-title">创建起始：  </td>
							<td><input name="searchCreatedStartDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">创建截至： </td>
							<td><input name="searchCreatedEndDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">报到截至： </td>
							<td><input name="searchLimiteDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
						</tr>
					</table>
					</div>
				</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="confirmButton easyui-linkbutton" id="searchCulpritFormbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanCulpritFormSearch" iconCls="icon-undo" >清空</a>
			</div>
		</div>
		</div>
	</form>

	<div region="center" border="false">
		
		<table class="easyui-datagrid" id="culpritInfo_list_content" title="首次报到人员列表"  
			data-options="singleSelect:true,collapsible:true,rownumbers:true,fit:true,striped:true,fitColumns:true,toolbar:'#toolbarCulprit',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/culpritinfo/culprit/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-firstReport-book').linkbutton({text:'办理入矫',plain:true,iconCls:'fi-book icon-blue'});
                        $('.organization-easyui-firstReport-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-firstReport-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-firstReport-pencil1').linkbutton({text:'处理',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'no',width:'8%',align:'center',sortable:true">人员编号</th>
					<th data-options="field:'name',width:'7%',align:'center'">报到对象</th>
					<th data-options="field:'identification',width:'12%',align:'center'">身份证号码</th>
					<th data-options="field:'dicSexKey',width:'3%',align:'center',formatter:function(value,row,index){
							if (value==10001){return '男';}else{return '女';}}">性别</th>
					<th data-options="field:'groupName',width:'8%',align:'center'" >所属单位</th>
					<th data-options="field:'dicPenalTypeKey',width:'6%',align:'center' " formatter="penalType">矫正类别</th>
					<th data-options="field:'dicFirstReportGetKey',width:'5%',align:'center',formatter:function(value,row,index){
						 return	sy.getDicValue('culprit_table','dicFirstReportGetKey',row.dicFirstReportGetKey,'');}">报到类型</th>
					<th data-options="field:'dicFirstReportTypeKey',width:'7%',align:'center',formatter:function(value,row,index){
						 return	sy.getDicValue('culprit_table','dicFirstReportTypeKey',row.dicFirstReportTypeKey,'');}">报到状态</th>
					<th data-options="field:'dicAdjudgeRedressOrgKey',width:'5%',align:'center',formatter:function(value,row,index){
						if(row.culpritJudgment ==null || row.culpritJudgment.dicAdjudgeRedressOrgKey==null || row.culpritJudgment.dicAdjudgeRedressOrgKey==''){
							return '未录入'
						}else{
						 return	sy.getDicValue('sf_investigate','DIC_ENTRUST_UNIT_TYPE_KEY',row.culpritJudgment.dicAdjudgeRedressOrgKey,'');
						}}">决定机关</th>
					<th data-options="field:'created',width:'10%',align:'center',sortable:true" >创建时间</th>
					<th data-options="field:'createdTime',width:'10%',align:'center',sortable:true,formatter:function(value,row,rowIndex){  
					if(row.culpritJudgment ==null || row.culpritJudgment.limitDate==null){
							return '未录入'
						}else{
						  return row.culpritJudgment.limitDate 
						}  
    	 			}">报道截至时间</th>
					<th data-options="field:'action',width:'17%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	

		<div id="toolbarCulprit" style="display: none;">
			 <shiro:hasPermission name="culpritinfo/culprit/form">
	        	<a onclick="addCulpritInfo();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	         </shiro:hasPermission>
	         <shiro:hasPermission name="culpritinfo/culprit/delete">
	        	<a onclick="deleteCulpritInfo();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
			 </shiro:hasPermission>
		</div>
	
	<div id="dealDialog"></div>
</div>

