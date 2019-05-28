<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>锅炉膨胀位移检测系统</title>
    <link rel="stylesheet" type="text/css" href="js/css/index.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<div class="box">
    <div class="change-type">
        <div class="type-left" :class="showType == true ? 'showListType':''">
            <ul>
                <li><a>当前用户</a><span></span></li>
                <li class="active"><a>摄像头</a><span></span></li>
                <li><a href="http://localhost:8080/springmvc/showline">历史数据</a><span></span></li>
                <li><a href="http://localhost:8080/springmvc/dateselect">实时图像</a><span></span></li>
                <li><a>设备管理</a><span></span></li>
                <li><a>添加用户</a><span></span></li>
                <li><a>修改用户</a><span></span></li>
            </ul>
        </div>
        <div class="type-right">
            <p>
                <i class="el-icon-menu"></i>
                菜单栏
            </p>
        </div>
    </div>
</div>
<script>
   
   
    $(function(){
        $('.type-right').click(function(){
            $(this).prev('.type-left').toggleClass('showListType')
        });
        $('.type-left ul li').click(function(){
            $(this).addClass('active').siblings('li').removeClass('active')
        })
    })


    
</script>
</body>

</html>