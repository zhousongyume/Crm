<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
<style>
#developinfo td{ font-size:14px;}
#planinfo th{ font-size:14px;}
#planinfo td{ font-size:14px;}
</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	//保存计划执行结果
	function saveResult(id,obj){
		var pid = id;
		var content = $(obj).parent().parent().find("#result").val();
		alert("11111111111");
		//ajax保存修改结果
		$.ajax({
			url:"ZDplanXui",
			type:"post",
			data:{"pla_id":pid,"pla_result":content},
			dataType:"json",
			success:function(data){
				if(data == true){
					myAlert("保存成功！");
				}else{
					myAlert("保存失败！");
				}
				
			}
		})
	} 
</script>
</head>

<body>
	<!-- 导航 -->
    <div>
    	<ol class="breadcrumb" style="font-size:14px;">
          <li><a href="#">主页</a></li>
          <li><a href="#">客户开发计划</a></li>
          <li class="active">查看</li>
        </ol>
    </div>
    <!-- 数据表格展示 -->
    <div style="padding:0px 20px;">
    	<table width="100%" border="0" class="table table-bordered" id="developinfo">
          <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${chance.chc_id }</td>
            <td width="20%" height="40" align="center" class="active">机会来源</td>
            <td width="30%" height="40">${chance.chc_source }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${chance.chc_cust_name }</td>
            <td height="40" align="center" class="active">成功几率</td>
            <td height="40">${chance.chc_rate }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">概要</td>
            <td height="40">${chance.chc_title }</td>
            <td height="40" align="center" class="active">状态</td>
            <td height="40">${chance.chc_status ==0?"未开发":(chance.chc_status ==1?"开发中":(chance.chc_status ==2?"开发成功":(chance.chc_status ==3?"开发失败":""))) }
            </td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">联系人</td>
            <td height="40">${chance.chc_linkman }</td>
            <td height="40" align="center" class="active">联系人电话</td>
            <td height="40">${chance.chc_tel }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">机会描述</td>
            <td height="40" colspan="3">${chance.chc_desc }</td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${chance.chc_create_by }</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fmt:formatDate value="${chance.chc_create_date }" type="date" dateStyle="long"/></td>
          </tr>
          <tr>
            <td height="40" align="center" class="active">指派给</td>
            <td height="40">${chance.chc_due_to }</td>
            <td height="40" align="center" class="active">指派时间</td>
            <td height="40"><fmt:formatDate value="${chance.chc_due_date }" type="date" dateStyle="long"/></td>
          </tr>
        </table>
        <div style="padding:5px;"></div>
        <!-- 计划执行效果展示 -->
	        <table class="table table-hover" id="planinfo">
	          <thead>
	          	<tr>
	            	<th width="20%" class="text-center">日期</th>
	                <th width="50%" class="text-center">计划</th>
	                <th width="30%" class="text-center">执行效果</th>
	            </tr>
	          </thead>
	          <tbody id="planlist">
	          <c:forEach items="${list }" var="li">
		          	<tr>
		            	<td align="center" ><fmt:formatDate value="${li.pla_date }" type="date" dateStyle="long"/></td>
		                <td align="center"  class="plancontent">${li.pla_todo }</td>
		                
		                <td align="center">
		                	<div class="input-group">
		                      <input type="text" class="form-control" id="result" value="${li.pla_result }">
		                      <span class="input-group-btn">
		                        <button class="btn btn-primary insert" onclick="saveResult(${li.pla_id },this)" type="button">保存</button>
		                      </span>
		                    </div>
		                </td>
		            </tr>
		          </c:forEach>
	          </tbody>
	        </table>
        <div style="text-align:right; padding-right:20px;">
        	<a href="ZDplanCheng?chc_id=${chance.chc_id }"><button type="button" class="btn btn-primary" style="width:120px;">开发成功</button></a>
            <a href="ZDplan?chc_id=${chance.chc_id }&pla_chc_id=${chance.chc_create_id }"><button type="button" class="btn btn-primary" style="width:120px;">制定计划</button></a>
            <a href="ZDplanShi?chc_id=${chance.chc_id }"><button type="button" class="btn btn-primary" style="width:120px;">终止开发</button></a>
        	<button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
        </div>
    </div>
</body>
<script src="js/laydate.dev.js"></script>
<script>
	laydate({
		elem: '#date'
	});
</script>
</html>
