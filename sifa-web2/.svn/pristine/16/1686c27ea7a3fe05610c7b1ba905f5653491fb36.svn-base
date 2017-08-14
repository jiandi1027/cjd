<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="easyui-layout" style="width: 100%; height: 100%;">


	<div data-options="region:'center'" style="width: 80%">

		<div class="easyui-layout" style="width: 100%; height: 100%">
			<div data-options="region:'north',title:'导入表',collapsible:false"
				style="height: 15%;">
				<form id="biaoge_form" enctype="multipart/form-data">
					<div style="float: left; margin: 15px 0px 0px 15px">
						统计结果详情表: <input class="easyui-filebox" id="file1" name="filename1"
							buttonText='选择文件' ,
	    buttonAlign='left'
							accept="application/vnd.ms-excel" style="width: 300px" />
					</div>

					<div style="float: left; margin: 15px 0px 0px 15px">

						请休假统计表: <input class="easyui-filebox" id="file2" name="filename2"
							buttonText='选择文件' ,
	    			buttonAlign='left'
							accept="application/vnd.ms-excel" style="width: 300px" />
					</div>
					<div style="float: left; margin: 15px 0 15px 15px">
						月份：<input name="yuefen" id="biaoge_month"
							class="Wdate easyui-validatebox"
							onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM',maxDate:'2120-10'})" />
					</div>
					<input type="hidden" id="hid" name="biaoshi">

				</form>


				<div style="float: left; margin: 15px 0 15px 15px">
					<a href="#" class="easyui-linkbutton" id="biaoge_btn1"
						iconCls="fi-page-export">生成考勤统计表</a>

				</div>
				<input type="hidden" id="dcbiaoshi" value="0">
			</div>

			<div data-options="region:'center'" style="height: 35%;">
				<div class="easyui-layout" style="width: 100%; height: 100%">

					<div data-options="region:'west',title:'统计结果详情表',collapsible:false"
						style="width: 50%;">


						<div style="height: 100%; width: 100%;">
							<table id="table1" class="easyui-datagrid"
								data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true">
								<thead>
									<tr>
										<th
											data-options="field:'department',width:'14%',align:'center'">部门名称</th>
										<th data-options="field:'bianhao',width:'14%',align:'center'">人员编号</th>
										<th data-options="field:'name',width:'14%',align:'center'">姓名</th>
										<th data-options="field:'datetime',width:'14%',align:'center'">日期</th>
										<th
											data-options="field:'dakacishu',width:'14%',align:'center'">打卡次数</th>
										<th
											data-options="field:'dakashijian',width:'28%',align:'center'">打卡时间</th>
									</tr>
								</thead>
							</table>
						</div>


					</div>

					<div data-options="region:'east',title:'请休假统计表',collapsible:false"
						style="width: 50%;">


						<div style="height: 100%; width: 100%;">
							<table id="table2" class="easyui-datagrid"
								data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true">
								<thead>
									<tr>
										<th data-options="field:'datetime',width:'12%',align:'center'">填表日期</th>
										<th data-options="field:'name',width:'9%',align:'center'">申请人</th>
										<th
											data-options="field:'department',width:'9%',align:'center'">申请部门</th>
										<th data-options="field:'leavetype',width:'9%',align:'center'">请假类型</th>
										<th
											data-options="field:'starttime1',width:'12%',align:'center'">起始时间</th>
										<th
											data-options="field:'starttime2',width:'9%',align:'center'">起始时段</th>
										<th data-options="field:'endtime1',width:'12%',align:'center'">截止时间</th>
										<th data-options="field:'endtime2',width:'9%',align:'center'">截止时段</th>
										<th data-options="field:'totalday',width:'9%',align:'center'">合计天数</th>
										<th data-options="field:'reason',width:'9%',align:'center'">事由</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div data-options="region:'south',title:'考勤统计表',collapsible:false"
				style="height: 50%;">
				<div style="width: 100%; height: 100%;">
					<table id="biaoge_kqb" style="text-align: center"
						data-options="toolbar:'#toolbar',singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true"></table>
				</div>
			</div>
		</div>




	</div>

</div>

<div id="toolbar" style="display: none;">

	<a id="excelButton2" href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'fi-page-export-csv icon-green'">导出</a>
</div>

<script type="text/javascript">
	$("#toolbar").attr("disabled", true);
	$('#biaoge_kqb').datagrid(
	{
		singleSelect : true,
		fitColumns : true,
		fit : true,
		columns :
		[
		[
		{
			field : 'xuhao',
			title : '序号',
			rowspan : 3,
			width : "4%",
			align : "center"
		},
		{
			field : 'name',
			title : '姓名',
			rowspan : 3,
			width : '8%',
			align : "center"
		},
		{
			field : 'department',
			title : '部门',
			rowspan : 3,
			width : "8%",
			align : "center"
		},
		{
			title : '出勤记录',
			colspan : 11,
			width : "50%",
			align : "center"
		},
		{
			field : 'dakacishu',
			title : '打卡',
			rowspan : 3,
			width : "7%",
			align : "center"
		},
		{
			field : 'beizhu',
			title : '备注',
			rowspan : 3,
			width : "12%",
			align : "center"
		} ],

		[
		{
			field : 'workday',
			title : '实际上班(天)',
			rowspan : 2,
			width : "7%",
			align : "center"
		},
		{
			field : 'restday',
			title : '休息日(天)',
			rowspan : 2,
			width : "7%",
			align : "center"
		},
		{
			field : 'overday',
			title : '加班(天)',
			rowspan : 2,
			width : "7%",
			align : "center"
		},

		{
			title : '请休假(天)',
			colspan : 5,
			rowspan : 1,
			width : "29%",
			align : "center"
		},

		{
			field : 'overtime',
			title : '迟到(次)',
			rowspan : 2,
			width : "5%",
			align : "center"
		},

		{
			field : 'earlytime',
			title : '早退(次)',
			rowspan : 2,
			width : "5%",
			align : "center"
		},
		{
			field : 'absenteeismtime',
			title : '缺卡 (次)',
			rowspan : 2,
			width : "5%",
			align : "center"
		}, ],
		[
		{
			field : 'thingrest',
			title : '事假',
			width : "5%",
			align : "center"
		},
		{
			field : 'illrest',
			title : '病假',
			width : "5%",
			align : "center"
		},
		{
			field : 'injurrest',
			title : '工伤假',
			width : "5%",
			align : "center"
		},
		{
			field : 'birthrest',
			title : '产假',
			width : "5%",
			align : "center"
		},
		{
			field : 'otherrest',
			title : '其他',
			width : "5%",
			align : "center"
		} ]

		]

	});

	$("#file1").filebox(
	{

		"onChange" : function()
		{

			$('#hid').val("1");
			var formData = new FormData($("#biaoge_form")[0]);

			$.ajax(
			{
				type : 'post',
				url : '${ctx}/sys/biaoge/file',
				data : formData,
				async : false,
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(result)
				{
					$('#table1').datagrid(
					{
						url : '${ctx}/sys/biaoge/list1',
					})

					/* 
						$('#table1').datagrid({
							data:result.rows,
							page:result.page,
							total:5
							
						}); */
				},
				error : function(result)
				{

					console.log(result);
				}
			});

		},

	});
	$("#file2").filebox(
	{
		"onChange" : function()
		{

			$('#hid').val("2");
			var formData = new FormData($("#biaoge_form")[0]);

			$.ajax(
			{
				type : 'post',
				url : '${ctx}/sys/biaoge/file',
				data : formData,
				async : false,
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(result)
				{
					$('#table2').datagrid(
					{
						url : '${ctx}/sys/biaoge/list2',
					})

				},
				error : function(result)
				{

					console.log(result);
				}
			});
		}
	});

	$('#excelButton2').click(function()
	{
		console.log($('#dcbiaoshi').val())
		if ($('#dcbiaoshi').val() == '0')
		{
			$.messager.show(
			{
				title : '提示信息!',
				msg : "请先生成Excel"
			})
		} else if ($('#dcbiaoshi').val() == '1')
		{
			window.location.href = '${ctx}/sys/file/xiazai';
		}

	});
	$('#biaoge_btn1')
			.click(
					function()
					{

						var a = document.all.filename1.value;
						var b = document.all.filename2.value;
						var c = document.all.biaoge_month.value;

						if (a == "" || b == "" || c == "")
						{
							$.messager.show(
							{
								title : '提示信息!',
								msg : "文件及月份不能为空"
							})
						} else
						{
							var formData = new FormData($("#biaoge_form")[0]);

							$
									.ajax(
									{
										type : 'post',
										url : '${ctx}/sys/biaoge/panduan',
										data : formData,
										async : false,
										contentType : false,
										processData : false,
										dataType : "json",
										success : function(result)
										{
											//生成Excel成功把标识设置为1 ，导出可用
											$('#dcbiaoshi').val('1');
											//没有该月份记录
											if (result.status == 200)
											{

												//保存考勤表到数据库 
												$
														.ajax(
														{
															type : 'post',
															url : '${ctx}/sys/biaoge/batchimport',
															data : formData,
															async : false,
															contentType : false,
															processData : false,
															dataType : "json",
															success : function(
																	result)
															{

																if (result.status == 200)
																{
																	$(
																			'#biaoge_kqb')
																			.datagrid(
																					{
																						data : result.data
																					});
																	$(
																			'#biaoge_form')
																			.form(
																					'clear');

																	$.messager
																			.show(
																			{
																				title : '提示信息!',
																				msg : result.msg
																			})
																} else
																{
																	$.messager
																			.show(
																			{
																				title : '提示信息!',
																				msg : result.msg
																			});
																}

															},
															error : function(
																	result)
															{
																$.messager
																		.show(
																		{
																			title : '提示信息!',
																			msg : "生成Excel失败,请检查导入表格式！"
																		});
															}
														});
											} else if (result.status == 550) //如果已存在该月份数据
											{
												$.messager
														.confirm(
																'提示信息',
																'已存在该月份数据，是否覆盖',
																function(r)
																{
																	var a = 0;
																	if (r)
																	{
																		a = 1;
																	}

																	//保存考勤表到数据库   传入是否覆盖数据
																	$
																			.ajax(
																			{
																				type : 'post',
																				url : '${ctx}/sys/biaoge/batchimport?fugai='
																						+ a,
																				data : formData,
																				async : false,
																				contentType : false,
																				processData : false,
																				dataType : "json",
																				success : function(
																						result)
																				{

																					if (result.status == 200)
																					{
																						$(
																								'#biaoge_form')
																								.form(
																										'clear');
																						$(
																								'#biaoge_kqb')
																								.datagrid(
																										{
																											data : result.data
																										});

																						$.messager
																								.show(
																								{
																									title : '提示信息!',
																									msg : result.msg
																								})
																					} else
																					{
																						$.messager
																								.show(
																								{
																									title : '提示信息!',
																									msg : result.msg
																								});
																					}

																				},
																				error : function(
																						result)
																				{
																					$.messager
																							.show(
																							{
																								title : '提示信息!',
																								msg : "生成Excel失败,请检查导入表格式！"
																							});
																				}
																			});

																});

											}

										},
										error : function(result)
										{
											$.messager.show(
											{
												title : '提示信息!',
												msg : result.msg
											});
										}
									});
						}
					});
</script>