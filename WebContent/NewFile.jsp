<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

	<head>
	<meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
      
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>锅炉外壁膨胀位移曲线</title>

		<style type="text/css">
		
#container {
    min-width: 310px;
    height: 400px;
    margin: 0 auto;
}
		</style>
	</head>
	<body>
<script src="js/jquery.min.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/export-data.js"></script>

<div id="container" ></div>

<form action="showline" method="post">
<div align="center">

<input type="submit" value="更新">
</div>
</form>
<script type="text/javascript">

Highcharts.chart('container', {
    chart: {
        type: 'spline',
        animation: Highcharts.svg, // don't animate in old IE
        marginRight: 10,
        events: {
            load: function () {
                // set up the updating of the chart each second
                var series = this.series[0];
                
              /*   setInterval(function () {
                $.ajax({ 
              	  type: "post", 
              	  url: "ajax/test2",	
              	  dataType: "json", 
              	  async: false,
              	  success : function(da){ 
              	  	for(var i=0;i<Object.keys(da).length - 1;i++){  
              	 // for (i = 0; i <= 10; i += 1) {
              		 //获取当前时间，getTime()获取时间戳，先从数据库获取字符串，要去掉双引号，并把"-"改成"/"
              		  var mytime = (JSON.stringify((da[i].time).substr(0,19))).replace(/\"/g, "");
              		  time = (new Date(mytime.replace(/-/g,"/"))).getTime();
              	    var myvalue = parseFloat(da[i].value);
                  var x = time, // current time
                      y = parseFloat(da[i].value);
                  var series = this.series[0];
                    series.addPoint([x, y], true, true);
               }
              	 alert("dsa");
              	 }
              	  });
                }, 5000);*/
                
                /*   setInterval(function () {
                	$.ajax({ 
                		  type: "post", 
                		  url: "ajax/test2",	
                		  dataType: "json", 
                		  success : function(da){ 
                		  	//alert(Object.keys(data).length - 1);//返回长度
                		      for(var i=0;i<Object.keys(da).length - 1;i++){
                		      var mytime = JSON.stringify(da[i].time),
                		          myvalue = JSON.stringify(da[i].value);
                		      series.addPoint([mytime,myvalue],true,true);      
                		      }}
                		  }); 
          
                   // var x = (new Date()).getTime(), // current time
                   //     y = Math.random();
                    //series.addPoint([x, y], true, true);
                }, 5000); */
            }
        }
    },

    time: {
        useUTC: false
    },

    title: {
        text: 'Live random data'
    },
    xAxis: {
        type: 'datetime',
        tickPixelInterval: 150
    },
    yAxis: {
        title: {
            text: '膨胀位移'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
        }]
    },
    tooltip: {
        headerFormat: '<b>{series.name}</b><br/>',
        pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
    },
    legend: {
        enabled: false
    },
    exporting: {
        enabled: false
    },
    series: [{
        name: '当前位移',
        data: (function () {
            var data = [],
            	time = new Date().getTime(),
                i;
            $.ajax({ 
            	  type: "post", 
            	  url: "ajax/test2",	
            	  dataType: "json", 
            	  async: false,
            	  success : function(da){ 
            	 // 	for(var i=0;i<Object.keys(da).length - 1;i++){  
            	  for (i = Object.keys(da).length -20; i <Object.keys(da).length; i ++) {
            		 //获取当前时间，getTime()获取时间戳，先从数据库获取字符串，要去掉双引号，并把"-"改成"/"
            		  var mytime = (JSON.stringify((da[i].time).substr(0,19))).replace(/\"/g, "");
            		  time = (new Date(mytime.replace(/-/g,"/"))).getTime();
            	    var myvalue = parseFloat(da[i].value);
            	            data.push({
                          x: time ,
                          y: parseFloat(da[i].value)
                      });       
            	      }     	   
            	  }
            	       }); 
            return data;
    
    
         /*  for (i = 0; i <= 15; i += 1) {
                data.push({
                    x: time - i * 1000,
                    y: Math.random()+10
                });
                  
            }*/ 
        }()) 
    }]
});
		</script>
	</body>

