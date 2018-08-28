<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<meta charset="utf-8">
</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li class="active">客户开发计划</li>
        </ol>
    </div>
    <!-- 动态查询条件 -->
    <div style="padding:0px 20px 0px 0px;">
     <form action="planShow" method="post">
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
                    <button type="submit" class="btn btn-info" style="width:80px;">查询</button>
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
                    <th class="text-center"><span>创建时间</span></th>
                    <th class="text-center"><span>状态</span></th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <c:forEach items="${Sal_Chance_pages.list }" var="chance">
                <tr>
                    <td>${chance.chc_id }</td>
                    <td>${chance.chc_cust_name }</td>
                    <td>${chance.chc_title }</td>
                    <td class="text-center">${chance.chc_linkman }</td>
                    <td class="text-center">${chance.chc_tel } </td>
                    <td class="text-center">${chance.chc_create_date }</td>
                    <td class="text-center">
                      <c:if test="${chance.chc_status==0}">
                    		未分配
	                </c:if>
	                <c:if test="${chance.chc_status==1}">
	                    		开发中 
	                </c:if>
	                <c:if test="${chance.chc_status==2}">
	                   		 开发成功
	                </c:if>
	                <c:if test="${chance.chc_status==3}">
	                  		 开发失败
	                </c:if>
	                </td>
                    <td style="width: 15%;">
                    <c:if test="${chance.chc_status ==0 ||chance.chc_status ==1 }">
                        <a href="SelectSal_PlanById?chc_id=${chance.chc_id }&pla_chc_id=${chance.chc_create_id }" class="table-link" title="制定计划"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-pencil-square-o fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="SelectSal_PlanBy?chc_id=${chance.chc_id }&pla_chc_id=${chance.chc_create_id }" class="table-link" title="执行计划"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-external-link fa-stack-1x fa-inverse"></i>
                            </span>
                        </a> 
                        <a href="getjson?id=${chance.chc_id }&pageNum=${page.pageNum }" class="table-link danger" title="开发成功"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                         </c:if>
                         <c:if test="${chance.chc_status ==2 ||chance.chc_status ==3}">
                        <a href="SelectSal_Plan?chc_id=${chance.chc_id }&pla_chc_id=${chance.chc_create_id }" class="table-link" title="查看"> 
                            <span class="fa-stack"> 
                                <i class="fa fa-square fa-stack-2x"></i> 
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                        </c:if>
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
						href="planShow?pageNow=1&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">首页</a>
				</c:if></li>
			<li><c:if test="${Sal_Chance_pages.pageNow>1}">
					<a
						href="planShow?pageNow=${Sal_Chance_pages.pageNow-1 }&chc_cust_name=${chc_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">上一页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow<=1 }">
					<a href="javaScript:void(0)" style="color: #999">上一页</a>
				</c:if></li>
			<li><span>当前第${Sal_Chance_pages.pageNow}/共${Sal_Chance_pages.pageCount}页</span></li>
          <li><span>共${Sal_Chance_pages.count }条数据</span></li>
			<li><c:if
					test="${Sal_Chance_pages.pageNow<Sal_Chance_pages.pageCount}">
					<a
						href="planShow?pageNow=${Sal_Chance_pages.pageNow+1 }&chc_cust_name=${svr_cust_name}&chc_title=${chc_title}&chc_linkman=${chc_linkman}">下一页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow>=Sal_Chance_pages.pageCount }">
					<a href="javaScript:void(0)" style="color: #999">下一页</a>
				</c:if></li>
			<li><c:if
					test="${Sal_Chance_pages.pageNow==Sal_Chance_pages.pageCount}">
					<a href="javaScript:void(0)" style="color: #999">尾页</a>
				</c:if> <c:if test="${Sal_Chance_pages.pageNow!=Sal_Chance_pages.pageCount}">
					<a
						href="planShow?pageNow=${Sal_Chance_pages.pageCount }&chc_cust_name=${chc_cust_name}&chc_title=${chc_title} &chc_linkman=${chc_linkman}">尾页</a>
				</c:if></li>
		</ul>
    </div>
</body>
</html>
