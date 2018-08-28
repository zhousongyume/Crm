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
$(function(){
	$(".update").click(function() {
		if($(this).html() == "修改"){
			var content = $(this).parents("tr").find(".plancontent").html();
			$(this).parents("tr").find(".plancontent")
				.html("<input type='text' value="+content+" class='updatecontent form-control'/>");
			$(this).html("保存");
		}else if($(this).html() == "保存"){
			/* 获得pid和要修改的内容,使用ajax修改*/
			var pid = $(this).parents("tr").find(".planid").val();
			var content = $(this).parents("tr").find(".updatecontent").val();
			if(pid != null && pid != ""){		//有id编号表示是修改计划项
				$.post(
					"updateSal_Plan",
					{"pla_id":pid,"pla_todo":content},
					function(data){
						alert("修改成功");
					},
					"json"
				)
				
			$(this).parents("tr").find(".plancontent")
				.html(content);
			$(this).html("修改");
			
			}
			//添加新的计划，并且要修改状态为开发中
		}
    });	
	$(".delete").click(function() {
		var pid = $(this).parents("tr").find(".planid").val();
		if(pid != ""){ // 不等于 "" 时传入id用ajax进行删除
			$.post(
				"deleteSal_Plan",
				{"id":pid},
				function(data){
				},
				"json"
			)
			$(this).parents("tr").remove();
		}
		
	});	
});
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
        <form action="addSal_Plan?chc_id=${chance.chc_id }&pla_chc_id=${chance.chc_create_id }" method="post">
	        <table class="table table-hover" id="planinfo">
	          <thead>
	          	<tr>
	            	<th width="20%" class="text-center">日期</th>
	                <th width="50%" class="text-center">计划项</th>
	                <th width="30%" class="text-center">&nbsp;</th>
	            </tr>
	          </thead>
	          <tbody id="planlist">
	          <c:if test="${list!=null }">
		          <c:forEach items="${list }" var="li">
			          	<tr>
			            	<input type="hidden" value="${li.pla_id }" class="planid"/>
			            	<td align="center" ><fmt:formatDate value="${li.pla_date }" type="date" dateStyle="long"/></td>
			                <td align="center" class="plancontent">${li.pla_todo }</td>
			                <td align="center">
			                	<button type="button" class="btn btn-primary update" style="width:80px;">修改</button>
			                    <button type="button" class="btn btn-primary delete" style="width:80px;">删除</button>
			                </td>
			            </tr>
		          </c:forEach>
	            <tr>
	            	<td align="center">
	            	<input type="text" class="form-control" name="pla_date" id="date" placeholder="请输入日期"/></td>
	                <td align="center" class="plancontent"><input type="text" name="pla_todo" class="form-control" placeholder="请输入计划项"/></td>
	                <td align="center">
	                	<button type="submit" class="btn btn-primary update" style="width:80px;">保存</button>
	                </td>
	            </tr>
	          </c:if>
	          <c:if test="${list==null }">
	         	 <tr>
	            	<td align="center">
	            	<input type="text" class="form-control" name="pla_date" id="date" placeholder="请输入日期" /></td>
	                <td align="center" class="plancontent"><input type="text" name="pla_todo" class="form-control" placeholder="请输入计划项"/></td>
	                <td align="center">
	                	<button type="submit" class="btn btn-primary update" style="width:80px;">保存</button>
	                </td>
	            </tr>
	          </c:if>
	          </tbody>
	        </table>
	     </form>
        <div style="text-align:right; padding-right:20px;">
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
