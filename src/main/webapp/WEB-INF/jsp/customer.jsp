<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--<base href="<%=basePath%>">-->

<title>CRM</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/delete.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<script src="js/jquery-1.8.3.min.js"></script>
</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li class="active">客户信息管理</li>
		</ol>
	</div>
	<!-- 动态查询条件 -->
	<div style="padding: 0px 20px 0px 0px;">
		<form action="toCustomer" method="post">
			<table>
				<tr>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户名称</span>
								<input type="text" class="form-control" style="width: 180px;"
									name="cust_name">
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户等级</span>
								<select class="form-control" style="width: 180px;"
									name="cust_level_label">
									<option value="">无视等级</option>
									<option value="I">普通用户</option>
									<option value="II">长期用户</option>
									<option value="III">VIP用户</option>
									<option value="VI">高VIP用户</option>
									<option value="V">超级VIP用户</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户状态</span>
								<select class="form-control" style="width: 180px;"
									name="cust_status">
									<option value="正常">正常</option>
									<option value="流失">流失</option>
									<option value="删除">删除</option>
								</select>
							</div>
						</div>
					</td>
					<td align="left" width="15%">
						<button type="submit" class="btn btn-info" style="width: 80px;">查询</button>
					</td>
					<td>
						<div class="filter-block pull-right" style="margin-left: 10px;">
							<a href="toAddCst" class="btn btn-primary pull-right"> <i
								class="fa fa-plus-circle fa-lg"></i> 添加客户
							</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 展示表格数据 -->
	<div style="padding: 10px 20px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th><span>编号</span></th>
					<th><span>客户名称</span></th>
					<th><span>地区</span></th>
					<th class="text-center"><span>客户等级</span></th>
					<th class="text-center"><span>满意度</span></th>
					<th class="text-center"><span>地址</span></th>
					<th class="text-center"><span>开户银行</span></th>
					<th class="text-center"><span>客户状态</span></th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list }" var="c">
					<tr>
						<td>${c.cust_no }</td>
						<td>${c.cust_name }</td>
						<td>${c.cust_region }</td>
						<td class="text-center">${c.cust_level_label }</td>
						<td class="text-center">${c.cust_satisfy }</td>
						<td class="text-center">${c.cust_addr }</td>
						<td class="text-center">${c.cust_bank }</td>
						<td class="text-center">${c.cust_status }</td>
						<td style="width: 15%;">
							<p style="float: left;">
								<a href="toCustomerInfo?cust_no=${c.cust_no }"
									class="table-link"> <span class="fa-stack"> <i
										class="fa fa-square fa-stack-2x"></i> <i
										class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
								</span>
								</a>
							</p>
							<p style="float: left;">
								<a href="toUpdateCst?cust_no=${c.cust_no }" class="table-link">
									<span class="fa-stack"> <i
										class="fa fa-square fa-stack-2x"></i> <i
										class="fa fa-pencil fa-stack-1x fa-inverse"></i>
								</span>
								</a>
							</p> <a href="doDelete?cust_no=${c.cust_no }"
							class="table-link danger"> <span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
							</span>
						</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			function deleteCus() {
				var cust_no = $("#cust_no").val();
				window.location.href = "doDelete?cust_no=" + cust_no;
			}
		</script>
		<script src="js/delete.js"></script>
		<ul class="pager">
			<li><c:if test="${page.pageNow==1}" var="s">
					<a href="javaScript:void(0)" style="color: #999">首页</a>
				</c:if> <c:if test="${page.pageNow!=1}">
					<a
						href="toCustomer?pageNow=1&cust_name=${cust_name }&cust_level_label=${cust_level_label}&cust_status=${cust_status}">首页</a>
				</c:if></li>
			<li><c:if test="${page.pageNow>1}">
					<a
						href="toCustomer?pageNow=${page.pageNow-1}&cust_name=${cust_name }&cust_level_label=${cust_level_label}&cust_status=${cust_status}">上一页</a>
				</c:if> <c:if test="${page.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if></li>
			<li><span>当前第${page.pageNow}/共${page.pageCount}页</span></li>
			<li><span>共${page.count }条数据</span></li>
			<li><c:if test="${page.pageNow<page.pageCount}">
					<a
						href="toCustomer?pageNow=${page.pageNow+1}&cust_name=${cust_name }&cust_level_label=${cust_level_label}&cust_status=${cust_status}">下一页</a>
				</c:if> <c:if test="${page.pageNow>=page.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if></li>
			<li><c:if test="${page.pageNow==page.pageCount}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if> <c:if test="${page.pageNow!=page.pageCount}">
					<a
						href="toCustomer?pageNow=${page.pageCount}&cust_name=${cust_name }&cust_level_label=${cust_level_label}&cust_status=${cust_status}">尾页</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>