<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
 <% //String categories="[ '狗', '猫', '兔子', '老虎', '大象']"; 
//String data="[10,13,15,17,19]"; 

%> 
<!DOCTYPE HTML> 
<html> 
<head> 
<meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<title>Highcharts Example</title> 
<script type="text/javascript" src="/js/jquery.min.js"></script> 
<script type="text/javascript"> 
//x轴值 
var time ; 

//y轴值 
var value; 

//创建图表 
var chart; 
$(document).ready(function() { 
chart = new Highcharts.Chart( { 
chart : { 
renderTo : 'container', 
type : 'bar', 
events : { 
load : st// 定时器 
} 
}, 
title : { 
text : '动物数量统计' 
}, 
xAxis : { 
categories : time, //定义变量
title : { 
text : 'name' 
} 

}, 
yAxis : { 
min : 0, 
title : { 
text : 'number'    
} 
}, 
        legend: { 
            enabled: false 
        }, 
tooltip : { 
formatter : function() { 
return '' + this.series.name + ': ' + this.y + ''; 
} 
}, 
        credits : { 
            enabled: false 
        }, 
plotOptions : { 
series : { 
stacking : 'normal' 
} 
}, 
series : [ { 
name : '个', 
data : data
} ] 
}); 

}); 
//10秒钟刷新一次数据 
function st() { 
setInterval("getData()", 10000); 
} 

//动态更新图表数据 
function getData() { 
var categories = []; 
$.ajax({ 
  type: "post", 
  url: "ajax/test2",	
  dataType: "json", 
  success : function(data){ 
	  var a = new Array();
        var b = new Array();
  	//alert(Object.keys(data).length - 1);//返回长度
  	var array = new Array();
      for(var i=0;i<Object.keys(data).length - 1;i++){
      var mytime = JSON.stringify(data[i].time);
      var myvalue = JSON.stringify(data[i].value);
      a.push(mytime);
      b.push(myvalue);
      }
   alert("ds");
chart.series[0].setData(b); 
chart.xAxis[0].setCategories(a); 
  } 
  }); 
} 

</script> 
</head> 
<body> 
<script type="text/javascript" src="js/highcharts/highcharts.js" charset="utf-8"></script> 
<script type="text/javascript" src="js/highcharts/funnel.js"></script> 
<script type="text/javascript" src="js/highcharts/highcharts-more.js"></script> 

<div id="container" ></div> 
</body> 
</html> 

       