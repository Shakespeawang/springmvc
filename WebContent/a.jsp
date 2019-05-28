<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            /* css 代码  */
        </style>
        <script src="js/jquery.min.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts/modules/exporting.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts/modules/data.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts/modules/series-label.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts/modules/oldie.js"></script>
        <script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    </head>
    <body>
    <input type = "button" value="da" id = "choose">
        <div id="container" style="min-width:400px;height:400px"></div>
        <div class="message"></div>
        <script>
        var chart = null;
        $("#choose").click(function(){
        	// var mydata={"name":"zhou","age":"23"};    
        	$.ajax({
        		type:'post',
        		url:'ajax/test2',
        		dataType: 'json',
        		//data:mydata,
                success: function(da) {
                //	var json =data;
                //	var b = JSON.stringify(data[0].time);
                    var a = new Array();
                    var b = new Array();
                	//alert(Object.keys(data).length - 1);//返回长度
                	var array = new Array();
                    for(var i=0;i<Object.keys(da).length - 1;i++){
                    var mytime = JSON.stringify(da[i].time.substr(0,19));
                    //time =new Date(mytime);
                    var myvalue = JSON.stringify(da[i].value);
                    a.push(mytime);
                    b.push(myvalue);
                }
                    alert(a[1]);                    
                },
        	  error:function(){alert("sfd");}
        	});
        })
        	</script>