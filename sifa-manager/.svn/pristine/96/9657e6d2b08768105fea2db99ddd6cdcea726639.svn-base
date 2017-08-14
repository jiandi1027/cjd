<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="${ctxStatic }/style/css/global.css">
<link rel="stylesheet" href="${ctxStatic }/style/css/default.css">
<link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome.min.css">
<!--[if IE 7]>
<link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="https://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/highcharts.js"></script>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/exporting.js"></script>
</head>

<body>
	<div class="home-main">
		<ul>
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>社区矫正人员刑罚执行类别统计</h3></div>
					<div class="home-cb" id="container1">

					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>社区矫正人员历年年底在矫人数变化图</h3></div>
					<div class="home-cb" id="container3">
						<script type="text/javascript">
						
						var culpritByYearList='${culpritByYearJson}';
						var culpritByYears = eval("("+culpritByYearList+")");
						var years=new Array();
						var datas=new Array();
						for(var i=0;i<culpritByYears.length;i++){
							var obj= new Object();
							years[i]=culpritByYears[i]["year"]+"年";
							datas[i]=culpritByYears[i]["count"];
						}
						
						Highcharts.chart('container3', {
							chart: {
								type: 'column'
							},
							title: {
								text: null
							},
							subtitle: {
								text: null
							},
							xAxis: {
								categories: years,
								crosshair: true
							},
							yAxis: {
								min: 0,
								title: {
									text: ''
								}
							},
							tooltip: {
								headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
									'<td style="padding:0"><b>{point.y} </b></td></tr>',
								footerFormat: '</table>',
								shared: true,
								useHTML: true
							},
							plotOptions: {
								column: {
									pointPadding: 0.2,
									borderWidth: 0
								}
							},
							exporting: {
								enabled:false
							},
							series: [{
								name: '娇正人员统计',
								data:datas
						
							}]
						});
						</script>
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>社区矫正在矫对象犯罪类型比例分析</h3></div>
					<div class="home-cb" id="container2">
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>最近六个月社区矫正人员变化统计</h3></div>
					<div class="home-cb" id="container4">
						<script type="text/javascript">
						var culpritByMonthList='${culpritByMonthJson}';
						var culpritByMonths = eval("("+culpritByMonthList+")");
						var monnths=new Array();
						var datas=new Array();
						for(var i=0;i<culpritByMonths.length;i++){
							var obj= new Object();
							monnths[i]=culpritByMonths[i]["month"].replace('-','年')+"月";
							datas[i]=culpritByMonths[i]["count"];
						}
							Highcharts.chart('container4', {
								title: {
									text: null
								},
								subtitle: {
									text: null
								},
							
								yAxis: {
									title: {
										text: '　'
									}
								},

								xAxis: {
									categories: monnths,
									crosshair: true
								},
								exporting: {
									enabled:false
								},							
								series: [{
									name: '娇正人员统计',
									data:  datas
								}]
							
							});
						</script>
					</div>
				</div>
			</li>
		</ul>
	</div>
		<script type="text/javascript">

		
							$(document).ready(function () {
								var culpritPenalTypeList='${culpritPenalTypeJson}';
								pie('container1',culpritPenalTypeList);
								var culpritCrimeTypeList='${culpritCrimeTypeJson}';
								pie('container2',culpritCrimeTypeList);
								// Build the chart
								
							});
							
							function pie(div,culpritTypeList){
								var culpritTypes = eval("("+culpritTypeList+")");
								//alert(culpritPenalTypes.length);
								var datas=new Array();;
								for(var i=0;i<culpritTypes.length;i++){
									var obj= new Object();
									obj.name=culpritTypes[i]["typeName"];
									obj.y=parseInt(culpritTypes[i]["per"]);
									datas[i]=obj;
								}
								Highcharts.chart(div, {
									chart: {
										plotBackgroundColor: null,
										plotBorderWidth: null,
										plotShadow: false,
										type: 'pie'
									},
									title: {
										text: null
									},
									plotOptions: {
										pie: {
											allowPointSelect: true,
											cursor: 'pointer',
											dataLabels: {
												enabled: false
											},
											showInLegend: true
										}
									},
									exporting: {
										enabled:false
									},
									series: [{
										name: 'Brands',
										colorByPoint: true,
										data: datas
									}]
								});
							}
						</script>
</body>
</html>
