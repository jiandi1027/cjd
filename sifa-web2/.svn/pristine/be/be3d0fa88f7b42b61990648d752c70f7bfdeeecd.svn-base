<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
     <div class="easyui-panel" title="犯罪类型分析" style="width:100%;padding:5px;height:100%;">
		<div id="crimeInfo" data-options="fit:'true'" style="width: 90%; height: 90%;"></div>
    </div>
    <script type="text/javascript"> 
    $.ajax({
        type: "post",
        url: "${ctx}/statistics/chart/getCrimeInfo?groupId=${groupId}&dicStatusKey=${dicStatusKey}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}",
        dataType: "json",
        async: false,
        success: function(result){
        	var seriesdata=[];
        	 for(var i=0;i<result.length;i++) 
         	{ var obj=new Object(); 
         		seriesdata.push({
                	'value':result[i].COUNT,
                	'name':result[i].TYPENAME
                }); 
         	}
      	  // 基于准备好的dom，初始化echarts实例
            var criChart = echarts.init(document.getElementById('crimeInfo'));
              // 指定图表的配置项和数据
            option = {
          title : {
              text: '矫正对象犯罪类型比例分析图',//主标题
              x:'center',
              textStyle: {
                  // 用 itemStyle.normal.label.textStyle.fontSize 來更改餅圖上項目字體大小
                  fontSize:30
               },
               subtext:'部门：${groupName}       统计时间：${searchStartDate}至${searchEndDate}    矫正状态：${status}',//副标题
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
             data: ['危害国家安全罪','危害公共安全罪','危害国防利益','破坏社会主义市场经济秩序罪','侵犯公民人身权利、民主权利罪','侵犯财产罪','妨害社会管理秩序罪','贪污受贿罪','渎职罪','其他']
          },
          series : [
              {
                  name: '犯罪类型',
                  type: 'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                  /* data:[
                	  {value:result[0].COUNT, name:result[0].TYPENAME},
                      {value:result[1].COUNT, name:result[1].TYPENAME},
                      {value:result[2].COUNT, name:result[2].TYPENAME},
                      {value:result[3].COUNT, name:result[3].TYPENAME},
                      {value:result[4].COUNT, name:result[4].TYPENAME},
                      {value:result[5].COUNT, name:result[5].TYPENAME},
                      {value:result[6].COUNT, name:result[6].TYPENAME},
                      {value:result[7].COUNT, name:result[7].TYPENAME},
                      {value:result[8].COUNT, name:result[8].TYPENAME},
                      {value:result[8].COUNT, name:result[9].TYPENAME}
                  ], */
                  data : seriesdata ,
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