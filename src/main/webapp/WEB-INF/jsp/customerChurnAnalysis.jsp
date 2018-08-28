<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            /* css 代码  */
        </style>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
        <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>
    </head>
<body>
<div id="container" style="min-width:600px;height:400px"></div>
<div style="width: 0%;margin: 0px auto;">
	<img src="https://static.jianshukeji.com/hcode/images/loader.gif"/>
</div>
<script type="text/javascript">
var chart = Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '客户流失数据分析视图'
    },
    subtitle: {
        text: '数据截止 2018-12，来源: 刘凯动态展示客户流失数据'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45  // 设置轴标签旋转角度
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: '流失人数(个)'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        //pointFormat: '人口总量: <b>{point.y:.1f} 百万</b>'
    },
    series: [{
        name: '总人数',
        data:${data},
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: 'red',
            align: 'right',
            //format: '{point.y:.1f}', // :.1f 为保留 1 位小数
            y: 10
        }
    }]
});

</script>
</body>
</html>