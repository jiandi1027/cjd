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
<script type="text/javascript" src="${ctxStatic}/js/echarts.js" ></script>
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
					<div class="home-title"><h3>社区矫正在矫对象犯罪类型比例分析</h3></div>
					<div class="home-cb" id="container2">
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>社区矫正人员历年年底在矫人数变化图</h3></div>
					<div class="home-cb" id="containerByYear">
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
						var divYearChart = echarts.init(document.getElementById("containerByYear"));
						option = {

								grid: {
									left: '3%',
									right: '4%',
									bottom: '3%',
									containLabel: true
								},
								xAxis : [
									{
										type : 'category',
										data : years,
										splitLine:{
											show:false
										},
										axisTick: {
											alignWithLabel: true
										}
									}
								],
								yAxis : [
									{
										type : 'value',
										splitLine:{
											show:false
										},
										splitArea:{
											show:true,
										},
									}
								],
								series : [
									{
										type:'bar',
										label:{
										    normal:{
										        show:true,
										        position:'top'
										    }
										},
										itemStyle:{
											normal:{
												color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);}
											}
										},
										data:datas,
									}
								]
							};
						divYearChart.setOption(option);
						</script>
					</div>
				</div>
			</li>
			
			<li>
				<div class="home-sb">
					<div class="home-title"><h3>最近六个月社区矫正人员变化统计</h3></div>
					<div class="home-cb" id="containerByMonth">
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
						var divMonthChart = echarts.init(document.getElementById("containerByMonth"));
						var option = {
							    tooltip: {
							        trigger: 'axis',
							        axisPointer: { // 坐标轴指示器，坐标轴触发有效
							            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
							        },
							    },
							    grid: {
							        top: '20px',
							        left: '50px',
							        right: '15px',
							        bottom: '40px',
							    },
							    xAxis: {
							        type: 'category',
							        axisLine: {
							            show: true,
							        },
							        splitLine: {
							            show: false,
							        },
							        nameTextStyle: {
							            color: '#333',
							            fontStyle: 'normal',
							            fontWeight: 'normal',
							            fontFamily: '微软雅黑',
							            fontSize: 14,
							        },
							        data: monnths
							    },
							    yAxis: {
							        type: 'value',
							        axisLabel: {
							            formatter: function(params) {
							                var n = params;
							                return n;
							            }
							        }
							    },
							    series: [{
							        type: 'line',
							        symbolSize: 7,
							        lineStyle: {
							            normal: {
							                color: '#1ab394',
							                width: 2,
							            },
							        },
							        "itemStyle": {
							            "normal": {
							                "color": "#1ab394"
							            }
							        },
							        areaStyle: {
							            normal: {
							                    color: new echarts.graphic.LinearGradient(0, 0,0,1, [{
							                        offset: 0,
							                        color: 'rgba(0, 0, 0, 0.2)'
							                    }, {
							                        offset: 0.5,
							                        color: 'rgba(0, 0, 0, 0.08)'
							                    }, {
							                        offset: 0.8,
							                        color: 'rgba(0, 0, 0, 0.05)'
							                    }, {
							                        offset: 0.92,
							                        color: 'transparent'
							                    }, {
							                        offset: 1,
							                         color: 'transparent'
							                    }])
							                }
							        },
							        label: {
							            normal: {
							                show: true,
							                position: 'top',
							                formatter: function(params) {
							                    var n = params.value;
							                    if (n > 0) {
							                        return n ;
							                    } else {
							                        return "暂无数据";
							                    }

							                }
							            },
							        },
							        data: datas
							    }]
							};
							divMonthChart.setOption(option);
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
						
	
	<script type="text/javascript">
	
	function pie(div,culpritTypeList){
		var colors=['#74c31f','#d35833','#00ccff','#ffcc00','#ffdc90','#CC00FF','#998F66','#1A1AE6'];
		var divChart = echarts.init(document.getElementById(div));
		var culpritTypes = eval("("+culpritTypeList+")");
		var datas=new Array();;
		var names=new Array();;
		colors.length=culpritTypes.length;
		for(var i=0;i<culpritTypes.length;i++){
			var obj= new Object();
			obj.name=culpritTypes[i]["typeName"];
			obj.value=culpritTypes[i]["count"];
			datas[i]=obj;
			names[i]=culpritTypes[i]["typeName"];
		}
		//alert(datas.length);
		option = {
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    color:colors,
			    legend: {
			        orient: 'vertical',
			        x: 'right',
			        y:48,
			        data: names,
			        formatter:function(name){
			        	var oa = option.series[0].data;
			        	var num = oa[0].value + oa[1].value + oa[2].value + oa[3].value;
			        	for(var i = 0; i < option.series[0].data.length; i++){
		                    if(name==oa[i].name){
		                    	return name + ' ' + oa[i].value + '人 ' + (oa[i].value/num * 100).toFixed(2) + '%';
		                    }
			        	}
			        }
			    },
			    series : [
			        {
			            type: 'pie',
			            radius : '55%',
			            center: ['25%', '50%'],
			            data:datas,
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                },
			                 normal: {
			                    label:{ 
		                            show: false, 
		                            formatter: '{b} : {c} ({d}%)' 
		                        }
			                },
		                    labelLine :{show:true}
			            }
			        }
			    ]
			};
		divChart.setOption(option);
	}
	
	</script>
</body>
</html>
