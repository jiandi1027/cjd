<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
     <div class="easyui-panel" title="年龄分析" style="width:100%;padding:5px;height:100%;">
		<div id="ageInfo" data-options="fit:'true'" style="width: 90%; height: 90%;"></div>
    </div>
    <script type="text/javascript"> 
    $.ajax({
        type: "post",
        url: "${ctx}/statistics/chart/getAge?groupId=${groupId}&dicStatusKey=${dicStatusKey}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}",
        dataType: "json",
        async: false,
        success: function(result){
      	  // 基于准备好的dom，初始化echarts实例
            var criChart = echarts.init(document.getElementById('ageInfo'));
              // 指定图表的配置项和数据
            option = {
          title : {
              text: '矫正对象年龄比例分析图',//主标题
              x:'center',
              textStyle: {
                  // 用 itemStyle.normal.label.textStyle.fontSize 來更改餅圖上項目字體大小
                  fontSize:30
               },
               subtext:'部门：${groupName}      统计时间：${searchStartDate}至${searchEndDate}    矫正状态：${status}',//副标题
               subtextStyle: {
                   color: 'black',          // 副标题文字颜色,
                   fontSize:20
               }
               
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
                  name: '年龄分析',
                  type: 'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                  data:[
                	  {value:result[0].AGE18, name:'18岁以下'},
                      {value:result[0].AGE45, name:'18岁-45岁'},
                      {value:result[0].AGE60, name:'45岁-60岁'},
                      {value:result[0].AGEUP, name:'60岁以上'}
                  ], 
                  itemStyle: {
                      emphasis: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                      },
                      normal:{ 
                          label:{ 
                            show: true, 
                            formatter: '{b} : {c}人 ({d}%)',
                            textStyle: {
                                // 用 itemStyle.normal.label.textStyle.fontSize 來更改餅圖上項目字體大小
                                fontSize: 16
                             }
                          }, 
                          labelLine :{show:true} 
                        } 
                  }
              }
          ]
      };

           
              // 使用刚指定的配置项和数据显示图表。
              criChart.setOption(option);
       	 }
    });
    </script>