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
        <meta charset="utf-8">	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="icon" href="https://static.jianshukeji.com/hcode/images/favicon.ico">
        <style>
            /* css 代码  */
        </style>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/variable-pie.js"></script>
    </head>
    <body>
        <div id="container"></div>
        <!-- 客户分布分析customerDistributionAnalysis -->
        <script>
        Highcharts.chart('container', {
            chart: {
                type: 'variablepie'
            },
            title: {
                text: '客户分布数据分析视图'
            },
            subtitle: {
                text: '扇区长度（圆周方法）表示人数，宽度（纵向）表示人口密度'  
            },
            tooltip: {
                headerFormat: '',
                pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
                '人员分布 (人数个): <b>{point.y}</b><br/>'
            },
            series: [{
                minPointSize: 10,
                innerSize: '20%',
                zMin: 0,
                name: 'countries',
                data: ${data},
            }]
        });
        </script>
        
    </body>
</html>