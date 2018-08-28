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
    </head>
    <body>
    <!-- 客户贡献分析 -->
        <div id="container" style="min-width:400px;height:400px"></div>
        <script>
        var chart = Highcharts.chart('container',{
            chart: {
                type: 'area'
            },
            title: {
                text: '客户贡献分析表'
            },
            subtitle: {
                text: '数据来源: 2018最新客户贡献表'
            },
            xAxis: {
                allowDecimals: false
            },
            yAxis: {
                title: {
                    text: '客户贡献资金'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000 + 'k';
                    }
                }
            },
            tooltip: {
                pointFormat: '{series.name} 总计 <b>{point.y:,.0f}</b>人民币'
            },
            plotOptions: {
                area: {
                    marker: {
                        enabled: false,
                        symbol: 'circle',
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                }
            },
            series: [{
                name: '电子产品',
                data: ${data1}
            }, {
                name: '生活用品',
                data: ${data2}
            }]
        });
        </script>
    </body>
</html>