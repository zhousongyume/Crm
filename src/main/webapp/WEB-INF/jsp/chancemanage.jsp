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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM</title>
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
		$("#chc_due_date").click(function() {
			WdatePicker({
				highLineWeekDay : true //周末高亮
				,
				readOnly : true //只读，只可用控件input中 修改内容
				,
				dateFmt : 'yyyy-MM-dd'
			});
		});

		$("#chc_create_date").click(function() {
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
			url : "selectUserName",
			type : "post",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#chc_due_id").append(
							"<option value="+data[i].user_id+">"
									+ data[i].user_name + "</option>");
				}
			}
		})
	})
</script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "selectType",
			type : "post",
			dataType : "json",
			data : {
				"dict_type" : "机会来源"
			},
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#chc_source").append(
							"<option value="+data[i].dict_item+">"
									+ data[i].dict_item + "</option>");
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
			<li><a href="#">销售机会管理</a></li>
			<li class="active">新建销售机会</li>
		</ol>
	</div>
	<!-- 添加数据的表格 -->
	<div stlye="padding:20px;">
		<form role="form" action="chancemanageinsert" method="post">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">机会编号</span> <input type="text"
									class="form-control" readonly style="width: 430px;"
									name="chc_id">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">机会来源</span> <select
									class="form-control" style="width: 430px;" name="chc_source"
									id="chc_source">

								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户名称</span> <input type="text"
									placeholder="必填项" class="form-control" required
									style="width: 430px;" name="chc_cust_name">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">成功几率</span> <select
									class="form-control" style="width: 430px;" name="chc_rate">
									<option value="10">10%</option>
									<option value="20">20%</option>
									<option value="30">30%</option>
									<option value="40">40%</option>
									<option value="50">50%</option>
									<option value="60">60%</option>
									<option value="70">70%</option>
									<option value="80">80%</option>
									<option value="90">90%</option>
									<option value="100" selected>100%</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="left" colspan="2">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">机会概要</span> <input type="text"
									class="form-control" placeholder="必填项" required
									style="width: 900px;" name="chc_title">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">联系人&nbsp;</span> <input
									type="text" class="form-control" style="width: 430px;"
									name="chc_linkman">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">联系电话</span> <input type="text"
									class="form-control" style="width: 430px;" name="chc_tel">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="110" align="left" colspan="2">
						<div class="col-lg-3">
							<div class="input-group" style="height: 100px;">
								<span class="input-group-addon">机会描述</span>
								<textarea class="form-control" placeholder="必填项" required
									style="width: 900px; height: 100px;" name="chc_desc"></textarea>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">创建人&nbsp;</span> <input
									type="hidden" name="chc_create_id" value="${user.user_id}">
								<input type="text" class="form-control" placeholder="必填项"
									required style="width: 430px;" name="chc_create_by"
									value="${user.user_name}">
							</div>
						</div>
					</td>

					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">创建时间</span> <input type="text"
									class="form-control" required style="width: 430px;"
									id="chc_create_date" readonly="readonly" name="chc_create_date" />
							</div>
						</div>
					</td>
				</tr>
				<tr style="border-top: #EEE solid 2px;">
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">指派给&nbsp;</span> <select
									class="form-control" style="width: 430px;" name="chc_due_id"
									id="chc_due_id">

								</select>
							</div>
						</div>
					</td>
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">指派时间</span> <input type="text"
									class="form-control" style="width: 430px;" id="chc_due_date"
									readonly="readonly" name="chc_due_date"> <input
									type="hidden" name="chc_status" value="0">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="60" align="right" colspan="2"
						style="padding-right: 20px;">
						<button type="button" class="btn btn-primary" style="width: 80px;">返回</button>&nbsp;
						<input type="submit" class="btn btn-primary" style="width: 80px;"
						value="保存">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>
