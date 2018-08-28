<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<!--<base href="<%=basePath%>">-->

<title>修改流失客户信息</title>
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
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li><a href="#">流失客户管理</a></li>
          <li class="active">修改流失客户信息</li>
        </ol>
    </div>
    <!-- 添加数据的表格 -->
    <div stlye="padding:20px;">
      <form role="form" method="post" action="doUpdateLost">
<table width="100%" border="0" align="center">
          <tr>
            <td width="50%" height="50" align="center">
             <div class="col-lg-3">
                <div class="input-group">
                  <span class="input-group-addon">客户姓名</span>
                  <!-- 修改需要传输的id隐藏 -->
                  <input type="hidden" class="form-control" readonly style="width:430px;" value="${cst_lost.lst_id }" name="lst_id">
                  <input type="text" class="form-control" readonly style="width:430px;" value="${cst_lost.lst_cust_name }">
                </div>
             </div>
            </td>
            <td width="50%" height="50" align="center">
                 <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">客户所属经理</span>
                      <input type="text" class="form-control" style="width:430px;" value="${cst_lost.lst_cust_manager_name }" readonly="readonly">
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">最后下单时间</span>
                      <input type="text" value="${cst_lost.lst_last_order_date }" class="form-control" readonly="readonly" style="width:430px;">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
           	   <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">确认流失时间</span>
                     <input type="text" class="form-control" readonly="readonly" style="width:430px;" value="${cst_lost.lst_lost_date }">
                    </div>
                </div>
            </td>
          </tr>
          <tr>
           <td height="110" align="left">
            	<div class="col-lg-3">
                    <div class="input-group" style="height:100px;">
                      <span class="input-group-addon">机会描述</span>
                      <textarea class="form-control"  required style="width:430px;height:100px;" name="lst_delay">${cst_lost.lst_delay }</textarea>
                    </div>
                </div>
            </td>
        
     <td height="100" align="left" >
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">流失原因&nbsp;</span>
                      	<textarea rows="5" cols="30" name="lst_reason"style="width:430px;">${cst_lost.lst_reason }</textarea>

                    </div>
                </div>
            </td>
          </tr>
          <tr>
          	<td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">状态</span>
                     <select class="form-control" style="width:430px;" name="lst_status">
                          <option value="警告" <c:if test="${cst_lost.lst_status eq '警告' }">selected</c:if>>警告</option>
                          <option value="暂缓流失" <c:if test="${cst_lost.lst_status eq '暂缓流失' }">selected</c:if>>暂缓流失</option>
                          <option value="已经流失" <c:if test="${cst_lost.lst_status eq '已经流失' }">selected</c:if>>已经流失</option>
                        </select>
                    </div>
                </div>
            </td>
          </tr>
          <tr>
          	<td height="60" align="right" colspan="2" style="padding-right:20px;">
            	<button type="button" class="btn btn-primary" style="width:80px;">返回</button>&nbsp;
                <button type="submit" class="btn btn-primary" style="width:80px;">保存</button>
            </td>
          </tr>
        </table>	
      <form>
    </div>
</body>
<script src="js/laydate.dev.js"></script>
<script>
	laydate({
		elem: '#createTime'
	});
	laydate({
		elem: '#toTime'
	});
</script>
</html>