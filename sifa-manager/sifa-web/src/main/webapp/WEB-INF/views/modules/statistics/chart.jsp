<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>统计图表</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/echarts.js"></script>
<body>

	<div id="tt" class="easyui-tabs" style="width: 100%; height: 100%">
		<div title="性别统计">
			<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
			<div id="sex" data-options="fit:'true'"
				style="width: 90%; height: 90%;"></div>
		</div>
		<div title="年齡统计">
			<div id="age" data-options="fit:'true'"
				style="width: 90%; height: 90%;"></div>
		</div>
		<div title="刑罚类型统计">
			<div id="penalType" data-options="fit:'true'"
				style="width: 90%; height: 90%;"></div>
		</div>
			<div title="户口类型统计">
				<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				<div id="hklx" data-options="fit:'true'"
					style="width: 90%; height: 90%;"></div>
			</div>
			<div title="犯罪类型统计">
				<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				<div id="crimeInfo" data-options="fit:'true'"
					style="width: 90%; height: 90%;"></div>
			</div>
		</div>
		<script type="text/javascript">
	//鼠标经过选项卡显示选项卡内容
		$(function(){
			var tabs = $('#tt').tabs().tabs('tabs');
			for(var i=0; i<tabs.length; i++){
				tabs[i].panel('options').tab.unbind().bind('mouseenter',{index:i},function(e){
					$('#tt').tabs('select', e.data.index);
				});
			}
		});
	
		$.ajax({
            type: "post",
            url: "${ctx}/statistics/sex",
            dataType: "json",
            async: false,
            success: function(data){
          	  // 基于准备好的dom，初始化echarts实例
                var sexChart = echarts.init(document.getElementById('sex'));
                  // 指定图表的配置项和数据
                option = {
              title : {
                  text: '矫正对象性别比例分析',
                  x:'center'
              },
              tooltip : {
                  trigger: 'item',
                  formatter: "{a} <br/>{b} : {c} ({d}%)"
              },
              legend: {
                  orient: 'vertical',
                  left: 'left',
                  data: ['女性','男性']
              },
              series : [
                  {
                      name: '性别',
                      type: 'pie',
                      radius : '55%',
                      center: ['50%', '60%'],
                      data:[
                          {value:data[0], name:'女性'},
                          {value:data[1], name:'男性'}
                      ],
                      itemStyle: {
                          emphasis: {
                              shadowBlur: 10,
                              shadowOffsetX: 0,
                              shadowColor: 'rgba(0, 0, 0, 0.5)'
                          }
                      }
                  }
              ]
          };


                  // 使用刚指定的配置项和数据显示图表。
                  sexChart.setOption(option);
           	 }
        }); 
		$.ajax({
            type: "post",
            url: "${ctx}/statistics/age",
            dataType: "json",
            async: false,
            success: function(data){
          	  // 基于准备好的dom，初始化echarts实例
                var sexChart = echarts.init(document.getElementById('age'));
                  // 指定图表的配置项和数据
                option = {
              title : {
                  text: '矫正对象年龄比例分析',
                  x:'center'
              },
              tooltip : {
                  trigger: 'item',
                  formatter: "{a} <br/>{b} : {c} ({d}%)"
              },
              legend: {
                  orient: 'vertical',
                  left: 'left',
                  data: ['18岁以下','18岁-45岁','45岁-60岁','60岁以上']
              },
              series : [
                  {
                      name: '年龄',
                      type: 'pie',
                      radius : '55%',
                      center: ['50%', '60%'],
                      data:[
                          {value:data[0], name:'18岁以下'},
                          {value:data[1], name:'18岁-45岁'},
                          {value:data[2], name:'45岁-60岁'},
                          {value:data[3], name:'60岁以上'}
                      ],
                      itemStyle: {
                          emphasis: {
                              shadowBlur: 10,
                              shadowOffsetX: 0,
                              shadowColor: 'rgba(0, 0, 0, 0.5)'
                          }
                      }
                  }
              ]
          };


                  // 使用刚指定的配置项和数据显示图表。
                  sexChart.setOption(option);
           	 }
        }); 
		
		$.ajax({
            type: "post",
            url: "${ctx}/statistics/age",
            dataType: "json",
            async: false,
            success: function(data){
        	  // 基于准备好的dom，初始化echarts实例
              var sexChart = echarts.init(document.getElementById('penalType'));
                // 指定图表的配置项和数据
              option = {
            title : {
                text: '矫正对象刑罚类型比例分析',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['管制','缓刑','剥夺政治权利','暂予监外执行','假释']
            },
            series : [
                {
                    name: '刑罚类型',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:12, name:'管制'},
                        {value:543, name:'缓刑'},
                        {value:11, name:'剥夺政治权利'},
                        {value:234, name:'暂予监外执行'},
                        {value:112, name:'假释'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };


                // 使用刚指定的配置项和数据显示图表。
                sexChart.setOption(option);
         	 }
      }); 
		$.ajax({
          type: "post",
          url: "${ctx}/statistics/age",
          dataType: "json",
          async: false,
          success: function(data){
        	  // 基于准备好的dom，初始化echarts实例
              var sexChart = echarts.init(document.getElementById('hklx'));
                // 指定图表的配置项和数据
              option = {
            title : {
                text: '矫正对象户籍类型比例分析',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['城镇户籍','农村户籍','无国籍','外国籍','港澳台','其他']
            },
            series : [
                {
                    name: '户籍',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:567, name:'城镇户籍'},
                        {value:343, name:'农村户籍'},
                        {value:1, name:'无国籍'},
                        {value:4, name:'外国籍'},
                        {value:2, name:'港澳台'},
                        {value:1, name:'其他'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

                // 使用刚指定的配置项和数据显示图表。
                sexChart.setOption(option);
         	 }
		});
          $.ajax({
              type: "post",
              url: "${ctx}/statistics/age",
              dataType: "json",
              async: false,
              success: function(data){
            	  // 基于准备好的dom，初始化echarts实例
                  var sexChart = echarts.init(document.getElementById('crimeInfo'));
                    // 指定图表的配置项和数据
                  option = {
                title : {
                    text: '矫正对象犯罪类型比例分析',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['危害国家安全罪','危害公共安全罪','危害国防利益','破坏社会主义市场经济','侵犯公民人身权利、民主权利罪','侵犯财产罪','妨害社会管理秩序罪','贪污受贿罪','渎职罪','其他']
                },
                series : [
                    {
                        name: '犯罪类型',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:[
                            {value:12, name:'危害国家安全罪'},
                            {value:41, name:'危害公共安全罪'},
                            {value:34, name:'危害国防利益'},
                            {value:32, name:'破坏社会主义市场经济'},
                            {value:534, name:'侵犯公民人身权利、民主权利罪'},
                            {value:233, name:'侵犯财产罪'},
                            {value:14, name:'妨害社会管理秩序罪'},
                            {value:2, name:'贪污受贿罪'},
                            {value:43, name:'渎职罪'},
                            {value:443, name:'其他'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };


                    // 使用刚指定的配置项和数据显示图表。
                    sexChart.setOption(option);
             	 }
          });
             
		
	</script>
</body>
</html>