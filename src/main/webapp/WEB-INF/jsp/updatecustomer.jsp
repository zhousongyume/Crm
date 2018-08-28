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
<title>修改客户</title>
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
          <li><a href="#">客户信息管理</a></li>
          <li class="active">修改客户</li>
        </ol>
    </div>
    <!-- 添加数据的表格 -->
    <div stlye="padding:20px;">
      <form role="form" method="post" action="doUpdateCst">
<table width="100%" border="0" align="center">
          <tr>
            <td width="50%" height="50" align="center">
             <div class="col-lg-3">
                <div class="input-group">
                  <span class="input-group-addon">客户名称</span>
                  <input type="hidden" class="form-control"  style="width:430px;" value="${cst_customer.cust_no }" name="cust_no">
                  <input type="text" class="form-control"  style="width:430px;" value="${cst_customer.cust_name }" name="cust_name">
                </div>
             </div>
            </td>
            <td width="50%" height="50" align="center">
                 <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">地区</span>
                      <input type="text" class="form-control" style="width:430px;" value="${cst_customer.cust_region }" name="cust_region">
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
                <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">客户等级</span>
                      <select style="width:430px;" class="form-control" name="cust_level_label">
                      	<option value="I" <c:if test="${cst_customer.cust_level==I}">selected</c:if>>普通用户</option>
                      	<option value="II" <c:if test="${cst_customer.cust_level==II}">selected</c:if>>长期用户</option>
                      	<option value="III" <c:if test="${cst_customer.cust_level==III}">selected</c:if>>VIP用户</option>
                      	<option value="VI" <c:if test="${cst_customer.cust_level==VI}">selected</c:if>>高级VIP</option>
                      	<option value="V" <c:if test="${cst_customer.cust_level==V}">selected</c:if>>超级VIP</option>
                      </select>
                    </div>
                </div>
            </td>
            <td height="50" align="center">
           	   <div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">满意度</span>
                      <select class="form-control" style="width:430px;" name="cust_satisfy">
                          <option value="1" <c:if test="${cst_customer.cust_satisfy==1}">selected="selected"</c:if>>较差</option>
                          <option value="2" <c:if test="${cst_customer.cust_satisfy==2}">selected="selected"</c:if>>一般</option>
                          <option value="3" <c:if test="${cst_customer.cust_satisfy==3}">selected="selected"</c:if>>较好</option>
                          <option value="4" <c:if test="${cst_customer.cust_satisfy==4}">selected="selected"</c:if>>良好</option>
                          <option value="5" <c:if test="${cst_customer.cust_satisfy==5}">selected="selected"</c:if>>相当满意</option>
                        </select>
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="left" colspan="2">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">信用度</span>
                       <select class="form-control" style="width:430px;" name="cust_credit">
                          <option value="1" <c:if test="${cst_customer.cust_credit==1}">selected</c:if>>较差</option>
                          <option value="2" <c:if test="${cst_customer.cust_credit==2}">selected</c:if>>一般</option>
                          <option value="3" <c:if test="${cst_customer.cust_credit==3}">selected</c:if>>较好</option>
                          <option value="4" <c:if test="${cst_customer.cust_credit==4}">selected</c:if>>良好</option>
                          <option value="5" <c:if test="${cst_customer.cust_credit==5}">selected</c:if>>高信誉</option>
                        </select>
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">地址&nbsp;</span>
                      <input type="text" class="form-control" style="width:430px;" value="${cst_customer.cust_addr }" name="cust_addr">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">邮政编码</span>
                      <input type="text" class="form-control" style="width:430px;" value="${cst_customer.cust_zip }" name="cust_zip">
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">电话</span>
                      <input type="text" class="form-control" style="width:430px;" value="${cst_customer.cust_tel }" name="cust_tel">
                    </div>
                </div>
            </td>
              <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">客户经理名&nbsp;</span>
                      <input type="hidden" name="cust_manager_id" value="${cst_customer.cust_manager_id }" >
                      <input type="text" class="form-control"  style="width:430px;" readonly="readonly" value="${cst_customer.cust_manager_name }" name="cust_manager_name">
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">传真&nbsp;</span>
                      <input type="text" class="form-control" placeholder="必填项" required style="width:430px;" value="${cst_customer.cust_fax }" name="cust_fax">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">网址</span>
                      <input type="text" class="form-control" required placeholder="必填项" style="width:430px;" value="${cst_customer.cust_website }" name="cust_website"/>
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">营业执照注册号&nbsp;</span>
                      <input type="text" class="form-control" placeholder="必填项" required style="width:430px;" value="${cst_customer.cust_licence_no }" name="cust_licence_no">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">法人</span>
                      <input type="text" class="form-control" required placeholder="必填项" style="width:430px;" value="${cst_customer.cust_chieftain }" name="cust_chieftain" />
                    </div>
                </div>
            </td>
          </tr>
          <tr>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">注册资金&nbsp;</span>
                      <input type="text" class="form-control"  style="width:430px;" readonly="readonly" value="${cst_customer.cust_bankroll }">
                    </div>
                </div>
            </td>
            <td height="50" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">年营业额</span>
                      <input type="text" class="form-control" required style="width:430px;" readonly="readonly" value="${cst_customer.cust_turnover }" />
                    </div>
                </div>
            </td>
          </tr>
          <tr style="border-top: #EEE solid 2px;">
            <td height="80" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">开户银行&nbsp;</span>
                      <input type="text" class="form-control" required style="width:430px;" readonly="readonly" value="${cst_customer.cust_bank }"/>
                    </div>
                </div>
            </td>
            <td height="80" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">银行账号</span>
                      <input type="text" class="form-control" style="width:430px;" readonly="readonly" value="${cst_customer.cust_bank_account }"/>
                    </div>
                </div>
            </td>
            </tr>
            <tr>
            <td height="80" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">地税登记号</span>
                      <input type="text" class="form-control" style="width:430px;" readonly="readonly" value="${cst_customer.cust_local_tax_no }"/>
                    </div>
                </div>
            </td>
            <td height="80" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">国税登记号</span>
                      <input type="text" class="form-control" style="width:430px;" readonly="readonly" value="${cst_customer.cust_national_tax_no }"/>
                    </div>
                </div>
            </td>
            </tr>
            <tr>
            <td height="80" align="center">
            	<div class="col-lg-3">
                    <div class="input-group">
                      <span class="input-group-addon">客户状态</span>
                      <select class="form-control" style="width:430px;" name="cust_status">
                          <option value="正常" <c:if test="${cst_customer.cust_status==正常}">selected</c:if>>正常</option>
                          <option value="流失" <c:if test="${cst_customer.cust_status==流失}">selected</c:if>>流失</option>
                          <option value="删除" <c:if test="${cst_customer.cust_status==删除}">selected</c:if>>删除</option>
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
    </div>
      <form>
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