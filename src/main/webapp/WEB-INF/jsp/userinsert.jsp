<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li><a href="#">用户管理</a></li>
			<li class="active">用户创建</li>
		</ol>
	</div>
	<!-- 添加数据的表格 -->
	
	<div stlye="padding:20px;">
		<form role="form" action="userinsert" method="post">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">用户编号</span> <input type="text"
									class="form-control" readonly style="width: 430px;">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">分配角色</span> <select
									class="form-control" style="width: 430px;" name="user_role_id">
									<option value="1">系统管理员</option>
									<option value="2"> 高管</option>
									<option value="3">主管</option>
									<option value="4">客户经历</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">用户名称</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="user_name">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">登录密码</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="user_password">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">用戶标识</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 430px;" name="user_flag">
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div style="text-align: right; padding-right: 20px;">
				<button type="submit" class="btn btn-primary" style="width: 80px;">保存</button>
				<button type="button" class="btn btn-primary" style="width: 80px;"
					onclick="history.back()">返回</button>
			</div>
			</form>
	</div>
	
</body>
</html>
