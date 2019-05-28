<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>nowtime_picture</title>
<meta name="keywords" content="javascript,时间插件">
<meta name="description" content="haorooms博客-日期插件演示，时间插件,demo演示">
</head>

<body>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
/* demo */
.demo{width:500px;margin:40px auto;}
.demo span{display:inline-block;width:240px;}
.demo span input{padding:3px;width:120px;font-size:12px;font-family:Arial, Helvetica, sans-serif;}
</style>


<div align="center">
	<form action="testtime" method= "post">
	<span>获取时分秒：</span>
	<input  class = "demo" type="text" value="" name="mytime" style="width:120px;" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')"/><br/>
	<input  type ="submit" value ="提交"/>
	</form>
	<span>获取日期：<input class = "demo" type="text" value="" style="width:120px;" id="" onclick="SelectDate(this,'yyyy-MM-dd')"/></span>
</div>	

<script type="text/javascript" src="js/adddate.js" ></script> 

</body>
</html>
