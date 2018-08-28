<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<!--<base href="<%=basePath%>">-->
<title>添加流失客户</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<script type="text/javascript"
	src="static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>


<script type="text/javascript">
	$(function() {
		//日历
		$("#lst_last_order_date").click(function() {
			WdatePicker({
				highLineWeekDay : true //周末高亮
				,
				readOnly : true //只读，只可用控件input中 修改内容
				,
				dateFmt : 'yyyy-MM-dd'
			});
		});

		$("#lst_lost_date").click(function() {
			WdatePicker({
				highLineWeekDay : true //周末高亮
				,
				readOnly : true //只读，只可用控件input中 修改内容
				,
				dateFmt : 'yyyy-MM-dd'
			});
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "selectCst",
			type : "post",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#lst_cust_no").append(
							"<option value="+data[i].cust_no+">"
									+ data[i].cust_name + "</option>");
				}
			}
		})
	})
</script>
</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li><a href="#">流失客户管理</a></li>
			<li class="active">添加流失客户</li>
		</ol>
	</div>
	<!-- 添加数据的表格 -->
	<div stlye="padding:20px;">
		<form role="form" method="post" action="doAddLost">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户名称&nbsp;</span> <select
									class="form-control" style="width: 430px;" name="lst_cust_no"
									id="lst_cust_no">

								</select>
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户经理姓名</span> <input type="text"
									class="form-control" style="width: 430px;"
									name="lst_cust_manager_name" placeholder="必填项" required>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">最后下单时间</span> <input type="date"
									class="form-control" style="width: 430px;"
									name="lst_last_order_date" id="lst_last_order_date" required>
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">确认流失时间</span> <input type="date"
									class="form-control" style="width: 430px;" name="lst_lost_date"
									id="lst_lost_date" required>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="left" colspan="2">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">暂缓措施</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 900px;" name="lst_delay">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">流失原因</span> <input type="text"
									class="form-control" style="width: 430px;" name="lst_reason"
									placeholder="必填项" required>
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">状态</span> <select
									class="form-control" style="width: 430px;" name="lst_status">
									<option value="警告" selected="selected">警告</option>
									<option value="暂缓流失">暂缓流失</option>
									<option value="已经流失">已经流失</option>
								</select>
							</div>
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="60" align="right" colspan="2"
						style="padding-right: 20px;">
						<button type="button" class="btn btn-primary" style="width: 80px;">返回</button>&nbsp;
						<button type="submit" class="btn btn-primary" style="width: 80px;">保存</button>
					</td>
				</tr>
			</table>
	</div>
	<form>
</body>
<script src="js/laydate.dev.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "selectUserName",
			type : "post",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#cust_manager_id").append(
							"<option value="+data[i].user_id+">"
									+ data[i].user_name + "</option>");
				}
			}
		})
	})
</script>
</html>