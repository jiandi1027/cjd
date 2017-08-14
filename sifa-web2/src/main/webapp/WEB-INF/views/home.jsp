<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${ctxStatic }/style/css/global.css">
<link rel="stylesheet" href="${ctxStatic }/style/css/default.css">
<link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome.min.css">
<!--[if IE 7]>
<link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="https://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/echarts.js" ></script>
</head>

<body>

	<div class="home-main">
		<ul>
			<li>
				<div class="home-sb">
					<div class="home-title">
						<h3 id="title1"></h3>
						<div class="home-set">
							<i class="icon-cog"></i>
							<div id="itemDiv1">
								<ul>
								<c:forEach var="item" items="${statisticsList}" varStatus="status">
									<li><input name="statistcsType1" type="radio" value="${item.key}" <c:if test="${item.key==sysAccountStatistics.statistics1}">  checked </c:if>><label id="statistcsType1_${item.key}">${item.value}</label></li>
								</c:forEach>
								</ul>
                                <button onclick="getPieStatistics('1')">确定</button>
							</div>
						</div>
					</div>
					<div class="home-cb" id="container1">
						
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title">
						<h3 id="title2">社区矫正人员刑罚执行类别统计</h3>
						<div class="home-set">
							<i class="icon-cog"></i>
							<div id="itemDiv2">
								<ul>
								<c:forEach var="item" items="${statisticsList}" varStatus="status">
									<li><input name="statistcsType2" type="radio" value="${item.key}" <c:if test="${item.key==sysAccountStatistics.statistics2}">  checked </c:if>><label id="statistcsType2_${item.key}">${item.value}</label></li>
								</c:forEach>
								</ul>
                                <button onclick="getPieStatistics('2')">确定</button>
							</div>
						</div>
					</div>
					<div class="home-cb" id="container2">
						
					</div>
				</div>
			</li>
						<li>
				<div class="home-sb">
					<div class="home-title">
						<h3 id="title3"></h3>
						<div class="home-set">
							<i class="icon-cog"></i>
							<div id="itemDiv3">
								<ul>
								<c:forEach var="item" items="${statisticsList}" varStatus="status">
									<li><input name="statistcsType3" type="radio" value="${item.key}" <c:if test="${item.key==sysAccountStatistics.statistics3}">  checked </c:if>><label id="statistcsType3_${item.key}">${item.value}</label></li>
								</c:forEach>
								</ul>
                                <button onclick="getPieStatistics('3')">确定</button>
							</div>
						</div>
					</div>
					<div class="home-cb" id="container3">
						
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title">
						<h3 id="title4"></h3>
						<div class="home-set">
							<i class="icon-cog"></i>
							<div id="itemDiv4">
								<ul>
								<c:forEach var="item" items="${statisticsList}" varStatus="status">
									<li><input name="statistcsType4" type="radio" value="${item.key}" <c:if test="${item.key==sysAccountStatistics.statistics4}">  checked </c:if>><label id="statistcsType4_${item.key}">${item.value}</label></li>
								</c:forEach>
								</ul>
                                <button onclick="getPieStatistics('4')">确定</button>
							</div>
						</div>
					</div>
					<div class="home-cb" id="container4">
						
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title">
                    	<h3 id="">社区矫正人员历年年底在矫人数变化图</h3>
                    </div>
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
						    color: ['#0099ff'],
						    tooltip : {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
						            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						        }
						    },
						    grid: {
						    	top:"20px",
						        left: '3%',
						        right: '4%',
						        bottom: '3%',
						        containLabel: true
						    },
						    xAxis : [
						        {
						            type : 'category',
						            data :years,
						            axisTick: {
						                alignWithLabel: true
						            }
						        }
						    ],
						    yAxis : [
						        {
						            // type : 'category',
						            // data : ['10','20','30','40'],
						            axisTick: {
						                alignWithLabel: true
						            }
						        }
						    ],
						    series : [
						        {
						            name:'矫正人员统计',
						            type:'bar',
						            barWidth: '60%',
						            data:datas
						        }
						        
						    ],
						    label: {
						            normal: {
						                show: true,
						                position: 'top',
						                formatter: '{c}'
						            }
						        },
						    itemStyle: {
						                normal: {
						                 
						                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
						                        offset: 0,
						                        color: 'rgba(0, 153, 255, 1)'
						                    }, {
						                        offset: 1,
						                        color: 'rgba(0, 153, 255, 0.1)'
						                    }]),
						                    shadowColor: 'rgba(0, 0, 0, 0.1)',
						                    shadowBlur: 10
						                }
						            }
						};
						divYearChart.setOption(option);
						</script>
					</div>
				</div>
			</li>
			<li>
				<div class="home-sb">
					<div class="home-title">
                    	<h3>最近六个月社区矫正人员变化统计</h3>
                    </div>
					<div class="home-cb" id="containerByMonth">
						<script type="text/javascript">
						/* var culpritByMonthList='${culpritByMonthJson}';
						var culpritByMonths = eval("("+culpritByMonthList+")");
						var monnths=new Array();
						var datas=new Array();
						for(var i=0;i<culpritByMonths.length;i++){
							var obj= new Object();
							monnths[i]=culpritByMonths[i]["month"].replace('-','年')+"月";
							datas[i]=culpritByMonths[i]["count"];
						} */
						var divMonthChart = echarts.init(document.getElementById("containerByMonth"));
						divMonthChart.showLoading({text: '正在努力的读取数据中...'});  
						$.ajax({
				            type: "post",
				            url: "${ctx}/statistics/culprit/statisticsCulpritByMonth",
				            dataType: "json",
				            async: true,
				            success: function(data){
				          	  // 基于准备好的dom，初始化echarts实例
				          	  /* console.log(eval(data.data));
				          	  console.log(JSON.stringify(data.categories)); */
				                  // 指定图表的配置项和数据
				                  
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
							        data: eval(data.categories)
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
							        data: eval(data.data0)
							    }]
							};

				                  // 使用刚指定的配置项和数据显示图表。
				                  divMonthChart.setOption(option);
				                  divMonthChart.hideLoading();  
				                  divMonthChart.resize(); 
				           	 }
				        }); 
						
						
						</script>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
	  $(".home-set i").click(function(){
		  $(this).next().toggleClass("on");
	  });
	});
	</script>
	
		<script type="text/javascript">
	
	function pie(div,culpritTypes,count){
		var colors=['#74c31f','#d35833','#00ccff','#ffcc00','#ffdc90','#CC00FF','#998F66','#1A1AE6','#ff1100'];
		var divChart = echarts.init(document.getElementById(div));
		//var culpritTypes = eval("("+culpritTypeList+")");
		var datas=new Array();
		var names=new Array();
		colors.length=culpritTypes.length;
		var allCount=0;
		for(var i=0;i<culpritTypes.length;i++){
			var obj= new Object();
			obj.name=culpritTypes[i]["typeName"];
			obj.value=culpritTypes[i]["count"];
			datas[i]=obj;
			names[i]=culpritTypes[i]["typeName"];
			allCount=allCount+culpritTypes[i]["count"];
			//alert(datas[i]);
		}
		var allCountStr="总共"+allCount+"人";
		if(count==1){
		option1 = {
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
			        	var oa = option1.series[0].data;
			        	/*var num;
			        	for(var i=0;i<culpritTypes.length;i++){
			        		num=num+oa[i].value;
			        	}*/
			        	for(var i = 0; i < option1.series[0].data.length; i++){
		                    if(name==oa[i].name){
		                    	return name + '：' + oa[i].value + '人 '; //+ (oa[i].value/num * 100).toFixed(2) + '%';
		                    }
			        	}
			        }
			    },
			    series : [
			        {
			        	name: allCountStr,
			            type: 'pie',
			            radius : '75%',
			            center: ['35%', '50%'],
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
		divChart.setOption(option1);
		}
		if(count==2){
			option2 = {
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
				        	var oa = option2.series[0].data;
				        	/*var num;
				        	for(var i=0;i<culpritTypes.length;i++){
				        		num=num+oa[i].value;
				        	}*/
				        	for(var i = 0; i < option2.series[0].data.length; i++){
			                    if(name==oa[i].name){
			                    	return name + '：' + oa[i].value + '人 '; //+ (oa[i].value/num * 100).toFixed(2) + '%';
			                    }
				        	}
				        }
				    },
				    series : [
				        {
				        	name: allCountStr,
				            type: 'pie',
				            radius : '75%',
				            center: ['35%', '50%'],
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
			divChart.setOption(option2);
			}
		if(count==3){
			option3 = {
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
				        	var oa = option3.series[0].data;
				        	/*var num;
				        	for(var i=0;i<culpritTypes.length;i++){
				        		num=num+oa[i].value;
				        	}*/
				        	for(var i = 0; i < option3.series[0].data.length; i++){
			                    if(name==oa[i].name){
			                    	return name + '：' + oa[i].value + '人 '; //+ (oa[i].value/num * 100).toFixed(2) + '%';
			                    }
				        	}
				        }
				    },
				    series : [
				        {
				        	name: allCountStr,
				            type: 'pie',
				            radius : '75%',
				            center: ['35%', '50%'],
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
			divChart.setOption(option3);
			}
		if(count==4){
			option4 = {
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
				        	var oa = option4.series[0].data;
				        	/*var num;
				        	for(var i=0;i<culpritTypes.length;i++){
				        		num=num+oa[i].value;
				        	}*/
				        	for(var i = 0; i < option4.series[0].data.length; i++){
			                    if(name==oa[i].name){
			                    	return name + '：' + oa[i].value + '人 '; //+ (oa[i].value/num * 100).toFixed(2) + '%';
			                    }
				        	}
				        }
				    },
				    series : [
				        {
				        	name: allCountStr,
				            type: 'pie',
				            radius : '75%',
				            center: ['35%', '50%'],
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
			divChart.setOption(option4);
			}
	}
	
	//getPieStatistics('${sysAccountStatistics.statistics1}',1);
	$("#itemDiv1").toggleClass("on");
	$("#itemDiv2").toggleClass("on");
	$("#itemDiv3").toggleClass("on");
	$("#itemDiv4").toggleClass("on");
	getPieStatistics('1');
	getPieStatistics('2');
	getPieStatistics('3');
	getPieStatistics('4');
	function getPieStatistics(count){
		var divName="container"+count;
		var radioName="statistcsType"+count;
		var titleName="title"+count;
		var	statisticsType=$("input[name='"+radioName+"']:checked").val();
		var labelName=radioName+"_"+statisticsType;
		var itemDiv="itemDiv"+count;
		$("#"+itemDiv+"").toggleClass("on");
		$("#"+titleName+"").text($("#"+labelName+"").text());
		$.ajax({
			type:"post",
			dataType : "json",
			url : "${ctx}/getPieStatistics?statisticsType="+statisticsType+"&count="+count,
			error:function(){
				//alert('Error');
			},
			success:function(data){
				pie(divName,data,count);
			}
		})
		
	}
	
	function changePie(count){
		var divName="container"+count;
		var radioName="statistcsType"+count;
		var titleName="title"+count;
		var labelName=radioName+"_"+$("input[name='"+radioName+"']:checked").val();
		//var itemDiv="itemDiv"+count;
		//$("#"+itemDiv+"").hide();
		$("#"+titleName+"").text($("#"+labelName+"").text());
		getPieStatistics(+$("input[name='"+radioName+"']:checked").val(),count);
		//alert($("input[name='"+radioName+"']:checked").val());
		//alert($("#statistcsType1_1").text());
	}
	</script>
</body>
</html>
