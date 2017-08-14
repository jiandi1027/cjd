<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">
var hasOpen2=false;
	$(function() {
		$('#searchbtn').click(
				function() {
					$('#t_list_fileManagement').datagrid('load',
							$.serializeObject($('#fileManagementSearchForm')));
				});

		function cleanSearch() {
			$('#t_list_fileManagement').datagrid('load', {});
			$('#fileManagementSearchForm').form().find('input').val('');
		}
	});

	function formatOper(val, row, index) {
		var space = '&nbsp;';
		/* var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="fileManagementUpdate(\''+row.id+'\')">修改</a>'+space; */
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="fileManagementDetail(\''+row.id+'\')">详情</a>'+space;

		
		operation +='<a href="javascript:void(0);" class="organization-easyui-linkbutton-link" onclick="terminalBinding(\''+row.id+'\')">绑定终端</a>'+space;
		operation +='<a href="javascript:void(0);" class="organization-easyui-linkbutton-finger" onclick="fingerprint(\''+row.id+'\')">录指纹</a>'+space;
		operation +='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="updateCulpritAgain(\''+row.id+'\')">补录</a>'+space;
		/* operation +='&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="callRegister(\''+row.id+'\')"><span style="color:blue;">声纹采集</span></a>'; */
	    
		return operation;
	}
	//信息补录
	function updateCulpritAgain(id) {
		parent.$.modalDialog({
	        title : '信息补录',
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
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_fileManagement').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
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
	
	function fileManagementDetail(id) {

		parent.$.modalDialog({
			title : '档案详情',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
			resizable:true,
	        maximizable:true,
			href : '${ctx}/dailymgr/fileManagement/detail?id=' + id
		});

	}
	
	/* function fileManagementUpdate(id) {

		parent.$.modalDialog({
			title : '档案修改',
			iconCls : 'fi-pencil icon-blue',
			width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
			resizable:true,
	        maximizable:true,
			href : '${ctx}/dailymgr/fileManagement/update?id=' + id	
		});

	} */
	
	function fingerprint(id){
		if ('${fingerType}' == 1) {
			var content;
			var b = new Base64();
			if (FPSOnline11.Register()) {
				content = b.encode(FPSOnline11.GetRegisterTemplate());
			} else {
				$.messager.alert("提示信息","指纹采集失败！");
				return;
			}
			
			$.ajax({
				type : 'post',
				url : '${ctx}/finger/reg',
				data : {
					culpritId:id,
					regTemplate : content
				},
				dataType : 'json',
				async : false,
				success : function(result) {
			    	progressClose();
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : '指纹登记成功'
					});
				},
				error : function(result) {
			    	progressClose();
			    	$.messager.alert('提示信息', '指纹登记失败!请联系管理员！');
				}
			});
		} else {
			$.ajax({
				type : 'post',
				url : '${ctx}/finger/regIface',
				data : {
					culpritId:id
				},
				dataType : 'json',
				async : false,
				success : function(o) {
			    	progressClose();
			    	
			    	var info = "";
					if (o.msg.length <= 0) {
						info = "该对象所在司法所没有登记的识别仪器或者已登记仪器用户数已达最大";
					} else {
						var result = o.msg;
						var arr = result.split(",");
						var str1 = arr[0];// iface验证返回值
						if (str1 == 'more') {
							showSendMachine(result, id);
						} else {
							info = "对象工号为:" + id + ",信息已发送至识别仪器:" + o.msg
									+ ",请录入相关资料,如果一段时间后设备中没有该对象信息,可以手动以:" + id
									+ "为工号建立用户,并录入相关信息!";
						}
					}
					if (info.length > 0) {
				    	$.messager.alert('提示信息', info);
					}
					return;
				},
				error : function(result) {
			    	progressClose();
			    	$.messager.alert('提示信息', '对象信息已发送失败!请联系管理员！');
				}
			});
		}
	}
	
	function showSendMachine(result, cId) {
		parent.$.modalDialog({
	        title : 'iface采集机器指定',
	        iconCls:'fi-folder-add icon-blue',
	        width : 500,
	        height : 300,
	        href : "${ctx}/finger/list?culpritId=" + cId,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '提交',
	            iconCls:'fi-arrow-up icon-blue',
	            handler : function() {
	                //parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                //var f = parent.$.modalDialog.handler.find('#investigatePush');
	                //f.submit();
	                $('#ifaceDealBtn1').click();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	                //parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                //var f = parent.$.modalDialog.handler.find('#investigatePush');
	                //f.submit();
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        }]
	    });
		
		
		return ;
/* url : "../../finger.do?m=regIfaceToCp&time="
		+ new Date()
				.getTime(),
params : {
	macId : macId,
	culpritId : cId
},
	if (temp == 'no') {
		info = "您选择的考勤机有误或已被删除,请重新选择发送！";
	} else {
		info = "对象工号为:"
				+ cId
				+ ",信息已发送至选择的识别仪器,请在1-2分钟后录入相关资料,如果一段时间后设备中没有该对象信息,可以手动以:"
				+ cId
				+ "为工号建立用户,并录入相关信息!"; */

	}
	
	
	
	
	
	
	
	
	
	
	function callRegister(id){
		if (confirm("确定重新进行注册?")) {
			progressLoad();
			$.ajax({
				url : '${ctx}/dailymgr/callRegister/register?culpritId=' + id,
				method : 'post',
				dataType : 'json',
				success : function(result) {
					var info = "";
					var resultmsg = result.msg;
					if (resultmsg == "true") {
						//info="声纹采集电话已拨出！";
						setTimeout('getCallBackmsg(' + id + ')', 3000);
					}
					if (resultmsg == "notelno") {
						info = "未开通声纹识别功能，请先开通声纹识别功能！";
					}
					if (info.length > 0) {
		            	progressClose();
		            	$.messager.show({
		    				title : "提示信息",
		    				msg : info
		    			});
					}
				},
				error : function() {
	            	progressClose();
	            	$.messager.show({
	    				title : "提示信息",
	    				msg : "声纹登记失败!请联系管理员！"
	    			});
				}
			});
		}
	}
	
	function getCallBackmsg(id) {
		progressClose();
		$.ajax({
			url : '${ctx}/sys/sysCallBackmsg/callBackmsg?culpritId=' + id,
			method : 'post',
			dataType : 'json',
			success : function(result) {
	        	progressClose();
				var info = "";
				var resultmsg = result.msg;
				if (resultmsg == "true") {
					info = "声纹采集电话已拨出！";
				}
				if (resultmsg == "nostate") {
					info = "声纹采集电话已拨出！";
				}
				if (resultmsg == "false") {
					info = "当前线路繁忙，请稍后再试！";
				}
				if (info.length > 0) {
	            	$.messager.show({
	    				title : "提示信息",
	    				msg : info
	    			});
				}
			},
			error : function() {
	        	progressClose();
	        	$.messager.show({
					title : "提示信息",
					msg : "声纹采集失败!请联系管理员！"
				});
			}
		});
	}
	
	
	function terminalBinding(id) {
		parent.$.modalDialog({
			title : '绑定终端',
			iconCls : 'fi-link icon-blue',
			width : 700,
			height : 260,
			href : '${ctx}/monitoring/terminal/form?id=' + id,
			resizable:true,
	        maximizable:true,
			buttons : [ {
	            text : '绑定',
	             iconCls:'fi-link icon-blue',
	             handler : function() {
	                 var f = parent.$.modalDialog.handler.find('#bindingform');
	                 f.submit();
	             }
	         },{
		            text : '解除绑定',
		             iconCls:'fi-unlink icon-blue',
		             handler : function() {
		            		$.messager.confirm('提示信息', '确认解绑?', function(r) {
		    					if (r) {
		    						$.ajax({
				        				url : '${ctx}/monitoring/terminal/delete?culpritId=' + id,
				        				method : 'post',
				        				success : function(result) {
				        					$.messager.show({
				        	    				title : "提示信息",
				        	    				msg : "解绑成功"
				        	    			});	
				        				},
				        				error : function() {
				        					parent.$.modalDialog.handler.dialog('close');
				        	            	$.messager.show({
				        	    				title : "提示信息",
				        	    				msg : "删除失败!请联系管理员！"
				        	    			});
				        				}
				        			});
		    					}else{
		    						return;
		    					}
		            	 });
		             }
		         }
	         ]
		});

	}
	//判断是否绑定
	function isbinding(value,rowData,rowIndex){
		var opt = '111';
		$.ajax({
			url : '${ctx}/monitoring/terminal/isbinding?culpritId=' + rowData.id,
			method : 'post',
			dataType : 'text',
			async:false,
			success : function(data) {
				opt =data;
			},
			error : function() {
			}
		});
		return opt ;
	}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="fileManagementSearchForm" class="confirmForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:true">
			<div region="center" border="false">
				<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_list_fileManagement"/>
		           </c:if>
		            <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"  style="width:100%;">
					<table>
						<tr>
							<td class="search-title">矫正对象： </td>
							<td>
								<input name="name" class="easyui-textbox" />
							</td>	
						</tr>
						<tr>	
							<td class="search-title">联系电话： </td>
							<td><input name="contactPhone" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">矫正状态：</td>
							<td>
								<input name="dicStatusKey" id="search_dicStatusKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=dicStatusKey&parentKey=13000&showAll=1',panelHeight:'auto',panelMaxHeight:200,editable:false">
							</td>
						</tr>
						<tr>	
							<td class="search-title">矫正类别： </td>
							<td>
							<input name="dicPenalTypeKey" id="search_dicPenalTypeKey2" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>
						</tr>
						<tr>
							<td class="search-title">建档起始：  </td>
							<td><input name="searchStartDate_file" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">建档截至： </td>
							<td><input name="searchEndDate_file" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						</tr>
						<tr>
							<td class="search-title">期满起始：  </td>
							<td><input name="searchRedressStartDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
						</tr>
						<tr>	
							<td class="search-title">期满截至： </td>
							<td><input name="searchRedressEndDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
						</tr>
					</table>
					</div>
					</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="confirmButton easyui-linkbutton"  id="searchbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton"  iconCls="icon-undo"  onclick="javascript:$('#search_dicStatusKey').combobox('reset');$('#search_dicPenalTypeKey2').combobox('reset');$('#fileManagementSearchForm').form('clear');$('#t_list_fileManagement').datagrid('load', {});">清空</a>
			</div>
		</div>
		</div>
	</form>
	<div data-options="region:'center',border:true">
		<table class="easyui-datagrid" id="t_list_fileManagement" title="档案管理列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/dailymgr/fileManagement/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-link').linkbutton({text:'绑定终端',plain:true,iconCls:'fi-link icon-blue'});
                        $('.organization-easyui-linkbutton-finger').linkbutton({text:'录指纹',plain:true,iconCls:'fi-folder-add icon-blue'});
                         $('.organization-easyui-linkbutton-pencil').linkbutton({text:'补录',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">序号</th>
					<th data-options="field:'name',width:'10%',align:'center'">矫正对象</th>
					<th data-options="field:'contactPhone',width:'10%',align:'center'">联系电话</th> 
					<th data-options="field:'dicStatusKey',width:'10%',align:'center',formatter:function(value,rowData,rowIndex){    
    if(typeof(rowData.dicStatusKey) != 'undefined' && rowData.dicStatusKey!=''){
    	 return sy.getDicValue('common_table','dicStatusKey',rowData.dicStatusKey,''); 
    }  }">矫正状态</th>
					<th data-options="field:'crimeInfo',width:'10%',align:'center'">主要罪名</th>
					<!-- <th data-options="field:'groupName',width:'10%',align:'center'">所属单位</th> -->
					<th data-options="field:'dicPenalTypeKey',width:'10%',align:'center',formatter:function(value,rowData,rowIndex){    
    	return sy.getDicValue('sf_investigate','entrust_type_id',value,'');}">矫正类别</th>
					<th data-options="field:'createdTime',width:'15%',align:'center',sortable:true">建档时间</th>
					<th data-options="field:'redressEndDate',width:'10%',align:'center',sortable:true,formatter:function(value,rowData,rowIndex){    
    	 return  rowData.culpritJudgment.redressEndDate }">期满时间</th>
					<!-- <th data-options="field:'_op2',width:'10%',align:'center',sortable:true,formatter:isbinding">是否绑定</th> -->
				    <th data-options="field:'_opt',width:'23%',align:'center',formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
</div>


