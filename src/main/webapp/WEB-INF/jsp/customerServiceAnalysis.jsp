<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script src="https://img.hcharts.cn/highcharts/themes/grid-light.js"></script>
    </head>
    <body>
        <div id="container" style="min-width:400px;height:400px"></div>
        <script type="text/javascript">
        var chart = Highcharts.chart('container', {
            chart: {
                type: 'bar'
            },
            title: {
                text: '客户服务分析报表'
            },
            xAxis: {
                categories: ['第一季度', '第二季度', '第三季度', '第四季度']
            },
            yAxis: {
                min: 0,
                title: {
                    text: '季度客户服务'
                }
            },
            tooltip: {
                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b>' +
                		'({point.percentage:.0f}%)<br/>', 
                		//:.0f 表示保留 0 位小数，详见教程：https://www.hcharts.cn/docs/basic-labels-string-formatting
                shared: true
            },
            plotOptions: {
                column: {
                    stacking: 'percent'
                }
            },
            series:[{
                name: '咨询',
                data: ${data1}
            }, {
                name: '投诉',
                data: ${data2}
            }, {
                name: '建议',
                data: ${data3}
            }]
        });
        </script>
    </body>
</html>