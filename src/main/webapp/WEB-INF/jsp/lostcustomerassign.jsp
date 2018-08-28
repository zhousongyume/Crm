<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看流失客户信息详情</title>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<style>
#developinfo td{ font-size:14px;}
#planinfo th{ font-size:14px;}
#planinfo td{ font-size:14px;}
</style>
</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li><a href="#">流失客户信息</a></li>
          <li class="active">查看</li>
        </ol>
    </div>
    <!-- 数据表格展示 -->
    <div style="padding:0px 20px;">
    	<table width="100%" border="0" class="table table-bordered" id="developinfo">
          <tr>
            <td width="20%" height="40" align="center" class="active">流失客户编号</td>
            <td width="30%" height="40">#${cst_lost.lst_id }</td>
            <td width="20%" height="40" align="center" class="active">流失客户名称</td>
            <td width="30%" height="40">${cst_lost.lst_cust_name }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">流失客户所属经理</td>
            <td height="40">${cst_lost.lst_cust_manager_name }</td>
            <td height="40" align="center" class="active">最后下单时间</td>
            <td height="40">${cst_lost.lst_last_order_date }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">确认流失时间</td>
            <td height="40" colspan="3">${cst_lost.lst_lost_date }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">暂缓措施</td>
            <td height="40">${cst_lost.lst_delay }</td>
            <td height="40" align="center" class="active">流失原因</td>
            <td height="40">${cst_lost.lst_reason }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">状态</td>
            <td height="40" colspan="3">${cst_lost.lst_status }</td>
          </tr>
        </table>
        </div>
        <div style="padding:5px;"></div>
        <div style="text-align:right; padding-right:20px;">
        <input onclick="history.go(-1)" type="button" value="返回" class="btn btn-primary" style="width:80px;">
        </div>
</body>
</html>