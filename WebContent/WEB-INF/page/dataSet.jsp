<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<style type="text/css">
.img{
width:800px;
height:600px;
border: 0;
color: gray;
} 
</style>
<div  style="text-align:center">  
                    柱状图 <br><br>  
                     点击生成柱状图<a href="getColumnChart.do">getMajorChart</a>  
     <br><br>  
     <img src="${chartColumnURL}" >  
  </div>
  <div  style="text-align:center">  
                饼状图 <br><br>  
                     点击生成饼状图<a href="getPieChart.do">getMajorChart</a>  
     <br><br>  
     <img src="${chartPieURL}" >  
  </div>  
   <div  style="text-align:center">  
               折线图 <br><br>  
                     点击生成折线图<a href="getLineChart.do">getMajorChart</a>  
     <br><br>  
     <img src="${chartLineURL}" >  
  </div>  

