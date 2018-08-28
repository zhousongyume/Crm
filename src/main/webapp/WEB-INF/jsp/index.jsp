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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>crm客户关系管理系统</title>

<link rel="stylesheet" type="text/css" href="../static/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../static/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../static/css/compiled/theme_styles.css" />
<script src="../static/CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<link type="image/x-icon" href="img/favicon.png" rel="shortcut icon" />

<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<div id="theme-wrapper">
		<header class="navbar" id="header-navbar">
			<div class="container">      
				<a href="index.html" id="logo" class="navbar-brand">
                <img src="img/logo.png" class="normal-logo logo-white" />
                <img src="img/logo-black.png" class="normal-logo logo-black" />
                <img src="img/logo-small.png" class="small-logo hidden-xs hidden-sm hidden" /> </a>
				<div class="clearfix">
					<button class="navbar-toggle" data-target=".navbar-ex1-collapse"
						data-toggle="collapse" type="button">
						<span class="sr-only"></span> <span
							class="fa fa-bars"></span>
					</button>
					<div
						class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
						<ul class="nav navbar-nav pull-left">
							<li><a class="btn" id="make-small-nav"> <i
									class="fa fa-bars"></i> </a></li>
						</ul>
					</div>
					<div class="nav-no-collapse pull-right" id="header-nav">
						<ul class="nav navbar-nav pull-right">
							<li class="mobile-search"><a class="btn"> <i
									class="fa fa-search"></i> </a>
								<div class="drowdown-search">
									<form role="search">
										<div class="form-group">
											<input type="text" class="form-control"
												placeholder="Search..."> <i
												class="fa fa-search nav-search-icon"></i>
										</div>
									</form>
								</div></li>
							
							<li class="hidden-xs"><a class="btn"> <i
									class="fa fa-cog"></i> </a></li>
							<li class="dropdown profile-dropdown"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <img
									src="img/samples/scarlet-159.png" alt="" /> <span
									class="hidden-xs">Scarlett Johansson</span> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
                                    <li><a href="user-profile.html"><i class="fa fa-user"></i>个人信息</a></li>
                                    <li><a href="#"><i class="fa fa-cog"></i>设置</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>系统消息</a></li>
                                    <li><a href="login"><i class="fa fa-power-off"></i>注销</a></li>
                                </ul></li>
							<li class="hidden-xxs"><a class="btn"> <i
									class="fa fa-power-off"></i> </a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div id="nav-col">
					<section id="col-left" class="col-left-nano">
						<div id="col-left-inner" class="col-left-nano-content">
							<div id="user-left-box" class="clearfix hidden-sm hidden-xs">
								<img alt="" src="img/samples/scarlet-159.png" />
								<div class="user-box">
									<span class="name"> 欢迎您 <br /> ${user.user_name } </span> <span
										class="status"> <i class="fa fa-circle"></i> 在线 </span>
								</div>
							</div>
							<div class="collapse navbar-collapse navbar-ex1-collapse"
							id="sidebar-nav">
							<ul class="nav nav-pills nav-stacked">
								<li class="active">
									<a href="index.jsp"> 
										<i 	class="fa fa-dashboard"></i> <span>控制面板</span> 
									</a>
								</li>
								<li>
									<a href="#" class="dropdown-toggle"> <i
										class="fa fa-usd"></i> <span>营销管理</span> <i
										class="fa fa-chevron-circle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<li><a href="chanceShow" target="rightContent"> 销售机会管理 </a></li>
										<li><a href="planShow" target="rightContent"> 客户开发计划 </a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle"> <i
										class="fa fa-user"></i> <span>客户管理</span> <i
										class="fa fa-chevron-circle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<li><a href="toCustomer" target="rightContent"> 客户信息管理 </a></li>
										<li><a href="toShowLost" target="rightContent"> 客户流失管理 </a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle"> <i
										class="fa fa-cube"></i> <span>服务管理</span> <i
										class="fa fa-chevron-circle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<li><a href="serviceCreate" target="rightContent"> 服务创建 </a></li>
										<li><a href="serviceAssign" target="rightContent"> 服务分配 </a></li>
										<li><a href="serviceManage" target="rightContent"> 服务反馈 </a></li>
										<li><a href="serviceDate" target="rightContent"> 服务归档 </a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle"> <i
										class="fa fa-bar-chart-o"></i> <span>统计报表</span> <i
										class="fa fa-chevron-circle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<li><a href="toCustomerContributionAnalysis" target="rightContent"> 客户贡献分析 </a></li>
										<li><a href="toCustomerDistributionAnalysis" target="rightContent"> 客户分布分析 </a></li>
										<li><a href="toCustomerServiceAnalysis" target="rightContent"> 客户服务分析 </a></li>
										<li><a href="toCustomerChurnAnalysis" target="rightContent"> 客户流失分析 </a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle"> <i
										class="fa fa-book"></i> <span>基础数据</span> <i
										class="fa fa-chevron-circle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<li><a href="dictServer"target="rightContent"> 数据字典管理 </a></li>
										<li><a href="userSelectTo" target="rightContent"> 用户管理</a></li>
										<li><a href="orderShow?pageNum=1" target="rightContent"> 订单管理</a></li>
									</ul>
								</li>
							</ul>
						</div>
						</div>
					</section>
				</div>
				<div id="content-wrapper">
					
                    <iframe src="userSelectTo" frameborder="0" name="rightContent" scrolling="no" style="width:100%;height:1000px;" ></iframe>
					<footer id="footer-bar" class="row">
						<p id="footer-copyright" class="col-xs-12">
							&copy; 2016 Y2J28第一组CRM项目.
						</p>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<div id="config-tool" class="closed">
		<a id="config-tool-cog"> <i class="fa fa-cog"></i> </a>
		<div id="config-tool-options">
			<h4>布局设置</h4>
			<ul>
				<li>
					<div class="checkbox-nice">
						<input type="checkbox" id="config-fixed-header" /> <label
							for="config-fixed-header"> 固定顶部栏 </label>
					</div></li>
				<li>
					<div class="checkbox-nice">
						<input type="checkbox" id="config-fixed-sidebar" /> <label
							for="config-fixed-sidebar"> 固定左菜单 </label>
					</div></li>
				<li>
					<div class="checkbox-nice">
						<input type="checkbox" id="config-fixed-footer" /> <label
							for="config-fixed-footer"> 固定底部栏 </label>
					</div></li>
				<li>
					<div class="checkbox-nice">
						<input type="checkbox" id="config-boxed-layout" /> <label
							for="config-boxed-layout"> 变窄! </label>
					</div></li>
				<!--<li>
					<div class="checkbox-nice">
						<input type="checkbox" id="config-rtl-layout" /> <label
							for="config-rtl-layout"> Right-to-Left </label>
					</div></li>-->
			</ul>
			<br />
			<h4>颜色选项</h4>
			<ul id="skin-colors" class="clearfix">
				<li><a class="skin-changer" data-skin="" data-toggle="tooltip"
					title="默认" style="background-color: #34495e;"> </a></li>
				<li><a class="skin-changer" data-skin="theme-white"
					data-toggle="tooltip" style="background-color: #2ecc71;"> </a></li>
				<li><a class="skin-changer blue-gradient"
					data-skin="theme-blue-gradient" data-toggle="tooltip"> </a></li>
				<li><a class="skin-changer" data-skin="theme-turquoise"
					data-toggle="tooltip"
					style="background-color: #1abc9c;"> </a></li>
				<li><a class="skin-changer" data-skin="theme-amethyst"
					data-toggle="tooltip" 
					style="background-color: #9b59b6;"> </a></li>
				<li><a class="skin-changer" data-skin="theme-blue"
					data-toggle="tooltip" 
					style="background-color: #2980b9;"> </a></li>
				<li><a class="skin-changer" data-skin="theme-red"
					data-toggle="tooltip"
					style="background-color: #e74c3c;"> </a></li>
				<li><a class="skin-changer" data-skin="theme-whbl"
					data-toggle="tooltip" 
					style="background-color: #3498db;"> </a></li>
			</ul>
		</div>
	</div>

	<script src="js/demo-skin-changer.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/demo.js"></script>


	<script src="js/scripts.js"></script>

</body>
</html>