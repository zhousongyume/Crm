<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
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
          <li><a href="#">用户管理</a></li>
          <li class="active">分配角色</li>
        </ol>
    </div>
    <!-- 数据表格展示 -->
    <div style="padding:0px 20px;">
    	<table width="100%" border="0" class="table table-bordered" id="developinfo">
          <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${user.user_id }</td>
            <td width="20%" height="40" align="center" class="active">用户名称</td>
            <td width="30%" height="40">${user.user_name }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">角色名称</td>
            <td height="40" colspan="3">${user.role.role_name  }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">角色概要</td>
            <td height="40" colspan="3">${user.role.role_desc }</td>
          </tr>
        </table>
        <div style="padding:5px;"></div>
        <form action="SysUserUpdate" method="post">
        <table width="100%" border="0" align="right" class="table">
          <tr>
          	<td width="50%">
            
            </td>
            <td height="40" align="right">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">指派角色</span>
                      <input type="hidden" name="now" value="${now }"/>
                      <input type="hidden" value="${user.user_id }" name="user_id">
                      <select class="form-control" style="width:430px;" name="user_role_id">
                      	<!-- 做判断,自己的目前的角色名称不在下拉列表中 -->
                      	<option value="1" ${requestScope.user.user_role_id == 1?"selected":"" }>管理员</option>
                      	<option value="2" ${requestScope.user.user_role_id == 2?"selected":"" }>高管</option>
                      	<option value="3" ${requestScope.user.user_role_id == 3?"selected":"" }>主管</option>
                      	<option value="4" ${requestScope.user.user_role_id == 4?"selected":"" }>客户</option>
                        </select>
                    </div>
                </div>
            </td>
          </tr>
        </table>
        <div style="text-align:right; padding-right:20px;">
            <button type="submit" class="btn btn-primary" style="width:80px;">保存</button>
        	<button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
        </form>
</body>
</html>
