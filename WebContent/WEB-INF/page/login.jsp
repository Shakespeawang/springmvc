<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<form action="addPic" method="post">
<div align="center">

终点时间：<input type="text" name="time2" > <br/>
<input type="submit" value="提交">
</div>
</form>
 <script>
           function c(){
           var date1 = document.getElementById("date1").value;
           var date2 = document.getElementById("date2").value;
           var result = new Date(date1).getTime() - new Date(date2).getTime();
           document.getElementById("second").value = Math.abs(result);
            
           }
   </script>
    <body>
         
        开始时间:   <input id="date1" /><br />
        结束时间:   <input id="date2" /><button onclick="c()">确定</button><br />
        相差天数:   <input id="second" />
   </body>
   


