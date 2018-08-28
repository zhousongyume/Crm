<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />

</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li class="active">用户管理</li>
		</ol>
	</div>
	<!-- 动态查询条件 -->
	<div style="padding: 0px 20px 0px 0px;">
		<form action="orderShow?pageNum=1" method="post">

			<table>
				<tr>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">客户名称</span>
								<input type="text" class="form-control" style="width: 200px;"
									name="odr_customer">
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">订单类型</span>
								<select class="form-control" style="width: 200px;"
									name="odr_type">
									<!-- 使用ajax读取 -->
									<option value="0">全部</option>
									<option value="刘">刘</option>
									<option value="渣">渣</option>
								</select>
							</div>
						</div>
					</td>
					<td align="left" width="15%"><input type="submit"
						class="btn btn-info" style="width: 80px" value="查询"></td>
					<td>
						<div class="filter-block pull-right" style="margin-left: 10px;">
							<a href="orderinsert" class="btn btn-primary pull-right"> <i
								class="fa fa-plus-circle fa-lg"></i> 添加用户
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
					<th><span>下单日期</span></th>
					<th class="text-center"><span>订单类型</span></th>
					<th class="text-center"><span>订单总金额</span></th>

					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Orders_pages.list }" var="orders">
					<tr>
						<td>${orders.odr_id }</td>
						<td>${orders.odr_customer }</td>
						<td><fm:formatDate value="${orders.odr_date}"
								pattern="yyyy-MM-dd" /></td>
						<td class="text-center">${orders.odr_type }</td>
						<td class="text-center">${orders.odr_cost }</td>
						<td style="width: 15%;"><a
							href="orderchakan?id=${orders.odr_id }" class="table-link"> <span
								class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
									<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
							</span>
						</a> <a href="orderupdatechaxun?id=${orders.odr_id }"
							class="table-link"> <span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-pencil fa-stack-1x fa-inverse"></i>
							</span>
						</a> <a href="orderdelete?id=${orders.odr_id }"
							class="table-link danger"> <span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
							</span>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<ul class="pager">
			<li><c:if test="${Orders_pages.pageNow==1}" var="s">
					<a href="javaScript:void(0)" style="color: #999">首页</a>
				</c:if> <c:if test="${Orders_pages.pageNow!=1}">
					<a
						href="orderShow?pageNow=1&odr_customer=${odr_customer}&odr_type=${odr_type}">首页</a>
				</c:if></li>
			<li><c:if test="${Orders_pages.pageNow>1}">
					<a
						href="orderShow?pageNow=${Orders_pages.pageNow-1 }&odr_customer=${odr_customer}&odr_type=${odr_type}">上一页</a>
				</c:if> <c:if test="${Orders_pages.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if></li>
			<li><span>当前第${Orders_pages.pageNow}/共${Orders_pages.pageCount}页</span></li>
			<li><span>共${Orders_pages.count }条数据</span></li>
			<li><c:if test="${Orders_pages.pageNow<Orders_pages.pageCount}">
					<a
						href="orderShow?pageNow=${Orders_pages.pageNow+1 }&odr_customer=${odr_customer}&odr_type=${odr_type}">下一页</a>
				</c:if><c:if test="${Orders_pages.pageNow>=Orders_pages.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if></li>
			<li><c:if test="${Orders_pages.pageNow==Orders_pages.pageCount}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if> <c:if test="${Orders_pages.pageNow!=Orders_pages.pageCount}">
					<a
						href="orderShow?pageNow=${Orders_pages.pageCount }&odr_customer=${odr_customer}&odr_type=${odr_type} ">尾页</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>
