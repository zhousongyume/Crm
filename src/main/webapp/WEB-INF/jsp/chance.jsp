<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li class="active">销售机会管理</li>
        </ol>
    </div>
    <!-- 动态查询条件 -->
    <div style="padding:0px 20px 0px 0px;">
    <form action="chanceShow?pageNum=1" method="post">
    	<table>
            <tr>
                <td>
                    <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon" style="width:100px;">客户名称</span>
                      <input type="text" class="form-control" style="width:180px;" name="chc_cust_name">
                    </div>
                    </div>
                </td>
                <td>
                    <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon" style="width:100px;">概要</span>
                      <input type="text" class="form-control" style="width:180px;" name="chc_title">
                    </div>
                    </div>
                </td>
                <td>
                    <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon" style="width:100px;">联系人</span>
                      <input type="text" class="form-control" style="width:180px;" name="chc_linkman">
                    </div>
                    </div>
                </td>
                <td align="left" width="15%">
                    <input type="submit" class="btn btn-info" style="width:80px;" value="查询">
                </td>
                <td>
                    <div class="filter-block pull-right" style="margin-left:10px;">
                        <a href="chancemanageadd" class="btn btn-primary pull-right"> 
                            <i	class="fa fa-plus-circle fa-lg"></i> 添加机会
                        </a>
                    </div>
                </td>
            </tr>
        </table>
        </form>
	</div>
    <!-- 展示表格数据 -->
    <div style="padding:10px 20px;">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th><span>编号</span></th>
                    <th><span>客户名称</span></th>
                    <th><span>概要</span></th>
                    <th class="text-center"><span>联系人</span></th>
                    <th class="text-center"><span>联系人电话</span></th>
                    <th class="text-center"><span>处理时间</span></th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${Sal_Chance_pages.list }" var="chance">
                <tr>
                    <td>${chance.chc_id }</td>
                    <td>${chance.chc_cust_name }</td>
                    <td>${chance.chc_title }</td>
                    <td class="text-center">${chance.chc_linkman }</td>
                    <td class="text-center">${chance.chc_tel } </td>
                    <td class="text-center"><fm:formatDate value="${chance.chc_due_date }" pattern="yyyy-MM-dd"/></td>
                    <td style="width: 15%;">
                        <a href="chanceAssign?id=${chance.chc_id }"	class="table-link"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="upChanceAssign?id=${chance.chc_id }" class="table-link"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="deleteChance?id=${chance.chc_id }" class="table-link danger"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    
      <ul class="pager">
			<li><c:if test="${Sal_Chance_pages.pageNow==1}" var="s">
					<a href="javaScript:void(0)" style="color: #999">首页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow!=1}">
					<a
						href="chanceShow?pageNow=1&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">首页</a>
				</c:if></li>
			<li><c:if test="${Sal_Chance_pages.pageNow>1}">
					<a
						href="chanceShow?pageNow=${Sal_Chance_pages.pageNow-1 }&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">上一页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if></li>
			<li><span>当前第${Sal_Chance_pages.pageNow}/共${Sal_Chance_pages.pageCount}页</span></li>
          <li><span>共${Sal_Chance_pages.count }条数据</span></li>
			<li><c:if
					test="${Sal_Chance_pages.pageNow<Sal_Chance_pages.pageCount}">
					<a
						href="chanceShow?pageNow=${Sal_Chance_pages.pageNow+1 }&chc_cust_name=${svr_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">下一页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow>=Sal_Chance_pages.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if></li>
			<li><c:if
					test="${Sal_Chance_pages.pageNow==Sal_Chance_pages.pageCount}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow!=Sal_Chance_pages.pageCount}">
					<a
						href="chanceShow?pageNow=${Sal_Chance_pages.pageCount }&chc_cust_name=${chc_cust_name}&chc_title=${chc_title} &chc_linkman=${chc_linkman}">尾页</a>
				</c:if></li>
		</ul>
    </div>
</body>
</html>
