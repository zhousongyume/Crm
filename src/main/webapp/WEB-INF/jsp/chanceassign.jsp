<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <style>
        #developinfo td{ font-size:14px;}
        #planinfo th{ font-size:14px;}
        #planinfo td{ font-size:14px;}
    </style>
      <script type="text/javascript">
                                    $(function () {
                                        $.ajax({
                                            url:"selectUserName",
                                            type:"post",
                                            dataType:"json",
                                            success:function (data) {
                                                for (var i=0;i<data.length;i++){
                                                	$("#chc_due_id").append("<option value="+data[i].user_id+">"+data[i].user_name+"</option>");
                                                }
                                            }
                                        })
                                    })
                          </script>
</head>

<body>
<!-- 导航 -->
<div>
    <ol class="breadcrumb" style="font-size:14px;">
        <li><a href="#">主页</a></li>
        <li><a href="#">客户开发计划</a></li>
        <c:if test="${chaxun == 'select'}">
        <li class="active">查看</li>
        </c:if>
        <c:if test="${chaxun =='update'}">
            <li class="active">修改</li>
        </c:if>
    </ol>
</div>
<!-- 数据表格展示 -->
<div style="padding:0px 20px;">
    <table width="100%" border="0" class="table table-bordered" id="developinfo">
        <tr>
            <td width="20%" height="40" align="center" class="active">编号</td>
            <td width="30%" height="40">${sal_chance.chc_id}</td>
            <td width="20%" height="40" align="center" class="active">机会来源</td>
            <td width="30%" height="40">${sal_chance.chc_source}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">客户名称</td>
            <td height="40">${sal_chance.chc_cust_name}</td>
            <td height="40" align="center" class="active">成功几率</td>
            <td height="40">${sal_chance.chc_rate}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">概要</td>
            <td height="40" colspan="3">${sal_chance.chc_title}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">联系人</td>
            <td height="40">${sal_chance.chc_linkman}</td>
            <td height="40" align="center" class="active">联系人电话</td>
            <td height="40">${sal_chance.chc_tel}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">机会描述</td>
            <td height="40" colspan="3">${sal_chance.chc_desc}</td>
        </tr>
        <tr>
            <td height="40" align="center" class="active">创建人</td>
            <td height="40">${sal_chance.chc_create_by}</td>
            <td height="40" align="center" class="active">创建时间</td>
            <td height="40"><fm:formatDate value="${sal_chance.chc_create_date}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>
    <div style="padding:5px;"></div>
    <c:if test="${chaxun != 'select'}">
    <form method="post" action="planupdatess">
        <table width="100%" border="0" align="center">
            <tr>
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                            <span class="input-group-addon">指派给&nbsp;</span>
                            <select class="form-control" id="chc_due_id" name="chc_due_id" style="width:430px;">
                                
                          
                            </select>
                        </div>
                    </div>
                </td>
                <td height="80" align="center">
                    <div class="col-lg-3">
                        <div class="input-group">
                        <input type="hidden" value="${sal_chance.chc_id}" name="id">
                            <span class="input-group-addon">指派时间</span>
                            <input type="date"  class="form-control" style="width:430px;"  name="chc_due_date">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="text-align:right; padding-right:20px;">

            <input type="submit" class="btn btn-primary" style="width:80px;" value="保存">
            <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>

        </div>
    </form>
    </c:if>
    <c:if test="${chaxun=='select'}">
    <div style="text-align:right; padding-right:20px;">
        <button type="button" class="btn btn-primary" style="width:80px;" onclick="history.back()">返回</button>
    </div>
        </c:if>
</div>
</body>
</html>
