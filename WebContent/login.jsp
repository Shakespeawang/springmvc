<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <title>锅炉膨胀监测系统</title>

    <link rel="stylesheet" type="text/css" href="js/css/base.css">
    <link rel="stylesheet" type="text/css" href="js/css/login.css">
    <script type="text/javascript" src="framework/jquery-1.11.3.min.js"></script>
</head>
<body>
<form>
    <div class="login_main">
        <div class="login_title">
			锅炉膨胀监测系统
        </div>
        <div class="login_account">
            <input type="text" placeholder="登录帐号"/>
        </div>
        <div class="login_password">
            <input type="password" placeholder="密码（6-20位，区分大小写）"/>
        </div>
        <div class="login_dis">
            <input type="checkbox"/>
            <p>下次自动登录</p><a href="#" target="_blank">忘记密码?</a>
        </div>
        <div class="login_submit">
            <a href="http://localhost:8080/springmvc/navigator.jsp">登&nbsp;录</a>
        </div>
        <div class="login_register">
            <a href="" target="_blank">没有账号，免费注册</a>
        </div>
    </div>
</form>
</body>
</html>

  
   


