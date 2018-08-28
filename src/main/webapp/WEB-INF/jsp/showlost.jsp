<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<li class="active">客户流失信息管理</li>
		</ol>
	</div>
	<!-- 动态查询条件 -->
	<div style="padding: 0px 20px 0px 0px;">
		<form action="toShowLost" method="post">
			<table>
				<tr>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">流失客户名称</span>
								<input type="text" class="form-control" style="width: 180px;"
									name="lst_cust_name">
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">流失客户所属经理</span>
								<input type="text" class="form-control" style="width: 180px;"
									name="lst_cust_manager_name" />
							</div>
						</div>
					</td>
					<td>
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon" style="width: 100px;">流失客户状态</span>
								<select class="form-control" style="width: 180px;"
									name="lst_status">
									<option value="" selected="selected">无视状态</option>
									<option value="警告">警告</option>
									<option value="暂缓流失">暂缓流失</option>
									<option value="已经流失">已经流失</option>
								</select>
							</div>
						</div>
					</td>
					<td align="left" width="15%">
						<button type="submit" class="btn btn-info" style="width: 80px;">查询</button>
					</td>
					<td>
						<div class="filter-block pull-right" style="margin-left: 10px;">
							<a href="toAddLost" class="btn btn-primary pull-right"> <i
								class="fa fa-plus-circle fa-lg"></i> 添加流失客户
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
					<th><span>流失客户名称</span></th>
					<th><span>流失客户所属经理</span></th>
					<th class="text-center"><span>最后下单时间</span></th>
					<th class="text-center"><span>确认流失时间</span></th>
					<th class="text-center"><span>暂缓措施</span></th>
					<th class="text-center"><span>流失原因</span></th>
					<th class="text-center"><span>流失客户状态</span></th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list }" var="c">
					<tr>
						<td>#${c.lst_id }</td>
						<td>${c.lst_cust_name }</td>
						<td>${c.lst_cust_manager_name }</td>
						<td class="text-center"><fm:formatDate value="${c.lst_last_order_date }" pattern="yyyy-MM-dd"/></td>
						<td class="text-center"><fm:formatDate value="${c.lst_lost_date  }" pattern="yyyy-MM-dd"/></td>
						<td class="text-center">${c.lst_delay }</td>
						<td class="text-center">${c.lst_reason }</td>
						<td class="text-center">${c.lst_status }</td>
						<td style="width: 15%;">
							<p style="float: left;">
								<a href="toLostCustomerInfo?lst_id=${c.lst_id }"
									class="table-link"> <span class="fa-stack"> <i
										class="fa fa-square fa-stack-2x"></i> <i
										class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
								</span>
								</a>
							</p>
							<p style="float: left;">
								<a href="toUpdateLost?lst_id=${c.lst_id }" class="table-link">
									<span class="fa-stack"> <i
										class="fa fa-square fa-stack-2x"></i> <i
										class="fa fa-pencil fa-stack-1x fa-inverse"></i>
								</span>
								</a>
							</p>
							  <a href="doLostDelete?cust_no=${c.lst_id }"
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
		<!-- 此方法为删除流失客户 -->
		<script type="text/javascript">
			function deleteCus() {
				var lst_id = $("#lst_id").val();
				window.location.href = "doLostDelete?lst_id=" + lst_id;
			}
		</script>
		<script src="js/delete.js"></script>
		<ul class="pager">
			<li><c:if test="${page.pageNow==1}" var="s">
					<a href="javaScript:void(0)" style="color: #999">首页</a>
				</c:if> <c:if test="${page.pageNow!=1}">
					<a
						href="toShowLost?pageNow=1&lst_cust_name=${lst_cust_name }&lst_cust_manager_name=${lst_cust_manager_name}&lst_status=${lst_status}">首页</a>
				</c:if></li>
			<li><c:if test="${page.pageNow>1}">
					<a
						href="toShowLost?pageNow=${page.pageNow-1}&lst_cust_name=${lst_cust_name }&lst_cust_manager_name=${lst_cust_manager_name}&lst_status=${lst_status}">上一页</a>
				</c:if> <c:if test="${page.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if></li>
			<li><span>当前第${page.pageNow}/共${page.pageCount}页</span></li>
			<li><span>共${page.count }条数据</span></li>
			<li><c:if test="${page.pageNow<page.pageCount}">
					<a
						href="toShowLost?pageNow=${page.pageNow+1}&lst_cust_name=${lst_cust_name }&lst_cust_manager_name=${lst_cust_manager_name}&lst_status=${lst_status}">下一页</a>
				</c:if> <c:if test="${page.pageNow>=page.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if></li>
			<li><c:if test="${page.pageNow==page.pageCount}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if> <c:if test="${page.pageNow!=page.pageCount}">
					<a
						href="toShowLost?pageNow=${page.pageCount}&lst_cust_name=${lst_cust_name }&lst_cust_manager_name=${lst_cust_manager_name}&lst_status=${lst_status}">尾页</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>