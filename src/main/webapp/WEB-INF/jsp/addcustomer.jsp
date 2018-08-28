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
<title>添加客户</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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
</head>

<body>
	<!-- 导航 -->
	<div>
		<ol class="breadcrumb" style="font-size: 14px;">
			<li><a href="#">主页</a></li>
			<li><a href="#">客户信息管理</a></li>
			<li class="active">添加客户</li>
		</ol>
	</div>
	<!-- 添加数据的表格 -->
	<div stlye="padding:20px;">
		<form role="form" method="post" action="doAddCst">
			<table width="100%" border="0" align="center">
				<tr>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户名称</span> <input type="text"
									class="form-control" style="width: 430px;" name="cust_name">
							</div>
						</div>
					</td>
					<td width="50%" height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">地区</span> <input type="text"
									class="form-control" style="width: 430px;" name="cust_region">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户等级</span> <select
									name="cust_level_label" style="width: 430px;"
									class="form-control">
									<option value="I">普通用户</option>
									<option value="II">长期用户</option>
									<option value="III">VIP用户</option>
									<option value="VI">高级VIP</option>
									<option value="V">超级VIP</option>
								</select>
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">满意度</span> <select
									class="form-control" style="width: 430px;" name="cust_satisfy">
									<option value="1">较差</option>
									<option value="2">一般</option>
									<option value="3">较好</option>
									<option value="4">良好</option>
									<option value="5">相当满意</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="left" colspan="2">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">信用度</span> <select
									class="form-control" style="width: 430px;" name="cust_credit">
									<option value="1">较差</option>
									<option value="2">一般</option>
									<option value="3">较好</option>
									<option value="4">良好</option>
									<option value="5">高信誉</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">地址&nbsp;</span> <input
									type="text" class="form-control" style="width: 430px;"
									name="cust_addr">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">邮政编码</span> <input type="text"
									class="form-control" style="width: 430px;" name="cust_zip">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">电话</span> <input type="text"
									class="form-control" style="width: 430px;" name="cust_tel">
							</div>
						</div>
					</td>
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户经理名&nbsp;</span> 
								<select
									class="form-control" style="width: 430px;"
									name="cust_manager_id" id="cust_manager_id">

								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">传真&nbsp;</span> <input
									type="text" class="form-control" placeholder="必填项" required
									style="width: 430px;" name="cust_fax">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">网址</span> <input type="text"
									class="form-control" required style="width: 430px;"
									name="cust_website" />
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">营业执照注册号&nbsp;</span> <input
									type="text" class="form-control" placeholder="必填项" required
									style="width: 430px;" name="cust_licence_no">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">法人</span> <input type="text"
									class="form-control" required style="width: 430px;"
									name="cust_chieftain" />
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">注册资金&nbsp;</span> <input
									type="text" class="form-control" placeholder="必填项"
									id="cust_bankroll" required style="width: 430px;"
									name="cust_bankroll">
							</div>
						</div>
					</td>
					<td height="50" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">年营业额</span> <input type="text"
									class="form-control" required style="width: 430px;"
									id="cust_turnover" name="cust_turnover" />
							</div>
						</div>
					</td>
				</tr>
				<tr style="border-top: #EEE solid 2px;">
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">开户银行&nbsp;</span> <input
									type="text" class="form-control" required style="width: 430px;"
									id="cust_bank" name="cust_bank" />
							</div>
						</div>
					</td>
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">银行账号</span> <input type="text"
									class="form-control" style="width: 430px;"
									id="cust_bank_account" name="cust_bank_account">
							</div>
						</div>
					</td>
				</tr>
				<tr>

					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">地税登记号</span> <input type="text"
									class="form-control" style="width: 430px;"
									id="cust_local_tax_no" name="cust_local_tax_no">
							</div>
						</div>
					</td>
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">国税登记号</span> <input type="text"
									class="form-control" style="width: 430px;"
									id="cust_national_tax_no" name="cust_national_tax_no">
							</div>
						</div>
					</td>
					<script>
						$("#cust_turnover").blur(function() {
							var value = $("#cust_turnover").val();
							if ((/^(\+|-)?\d+$/.test(value)) && value > 0) {
								return true;
							} else {
								alert("年营业额必须为正整数！");
								jQuery("#cust_turnover").val("1000");
								return false;
							}
						});

						$("#cust_bankroll").blur(function() {
							var value = $("#cust_bankroll").val();
							if ((/^(\+|-)?\d+$/.test(value)) && value > 0) {
								return true;
							} else {
								alert("注册资金必须为整数！");
								jQuery("#cust_bankroll").val("1000");
								return false;
							}
						});
					</script>
				</tr>
				<tr>
					<td height="80" align="center">
						<div class="col-lg-3">
							<div class="input-group">
								<span class="input-group-addon">客户状态</span> <select
									class="form-control" style="width: 430px;" name="cust_status">
									<option value="正常" selected="selected">正常</option>
									<option value="流失">流失</option>
									<option value="删除">删除</option>
								</select>
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
<script>
	laydate({
		elem : '#createTime'
	});
	laydate({
		elem : '#toTime'
	});
</script>
</html>