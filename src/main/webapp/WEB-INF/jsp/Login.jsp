<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="font-size: 100px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="expires" content="0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link href="./static/CRM登录页面_files/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="./static/CRM登录页面_files/Login-interface.css" rel="stylesheet" type="text/css">
    <script src="../static/CRM登录页面_files/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="./static/CRM登录页面_files/auto-size.js" type="text/javascript" charset="utf-8"></script>
    <script src="./static/CRM登录页面_files/bootstrap.js" type="text/javascript"></script>
    <script src="./static/CRM登录页面_files/layer.js" type="text/javascript"></script>
    <link rel="../static/stylesheet" href="./static/CRM登录页面_files/layer.css" id="layui_layer_skinlayercss">
    <script src="../static/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="./static/CRM登录页面_files/art_layer.js" type="text/javascript"></script>
    <script src="../static/CRM登录页面_files/jquery.vegas.js" type="text/javascript" charset="utf-8"></script>
    <!-- 注意，验证码本身是不需要 jquery 库，此处使用 jquery 仅为了在 demo 使用，减少代码量 -->
	<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>

<!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
<script src="gt.js"></script>
    <title>CRM登录页面</title>
</head>
<body><img class="vegas-background" src="../static/CRM登录页面_files/Signin-bg2.jpg" style="position: fixed; left: 0px; top: -84.5px; width: 1600px; height: 900px; bottom: auto; right: auto;">



<!--登录页 start-->
<div class="Signin-bg">
    <div class="tile">
        <img class="logo" src="./CRM登录页面_files/logo.png" alt="logo">
        <form class="signin" id="formId" role="form" action="signin" method="post">
            <h3>客户商机管理系统</h3>
            <div class="btn-box">
                <i></i>
                <input type="text" placeholder="请输入账号" id="loginNameId" class="accountNumber" name="loginname" autofocus="">
            </div>
            <div class="btn-box">
                <i class="icon2"></i>
                <input type="password" id="passWordId" placeholder="请输入密码" class="passWord" name="password" required="">
            </div>
         <div>
        <label>完成验证：</label>
        <div id="captcha1">
            <p id="wait1" class="show">正在加载验证码......</p>
        </div>
    </div>
    <br>
    <p id="notice1" class="hide">请先完成验证</p>
    <input  id="submit1" type="submit" value="登陆"  class="button-submit btn btn-lg btn-warning btn-block">
</form>

<script>
    var handler1 = function (captchaObj) {
        $("#submit1").click(function (e) {
            var result = captchaObj.getValidate();
            if (!result) {
                $("#notice1").show();
                setTimeout(function () {
                    $("#notice1").hide();
                }, 2000);
                e.preventDefault();
            }
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha1");
        captchaObj.onReady(function () {
            $("#wait1").hide();
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    $.ajax({
        url: "gt/register1?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "float", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler1);
        }
    });
</script>
    </div>
    <h4 class="copyright">Copyright © 2015-2017.Company www.dgg.net All rights reserved. Created By: 顶呱呱集团-技术中心</h4>
</div>
<!--登录页 end-->

</body></html>