<script src="../js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
function getlinebar(params) {
    option = {
        tooltip : {
            trigger : 'axis',
        },
        legend : {
            data : [ '最大占比', '最小占比' ]
        },
        toolbox : {
            show : true,
            orient : 'vertical',
            y : 'center',
            feature : {
                mark : {
                    show : true
                },
                magicType : {
                    show : true,
                    type : [ 'line', 'bar' ]
                },
                dataView : {
                    show : true,
                    readOnly : false
                },
                restore : {
                    show : true
                },
                saveAsImage : {
                    show : true
                }
            }
        },
        calculable : true,
        xAxis : [ {
            type : 'category',
            data : (function() {
                var data = [];
                $.ajax({
                    url : 'http://localhost:8080/Demo01/hello.do',
                    type : 'get',
                    async : false,
                    dataType : "json",
                    success : function(json) {
                        if (json) {
                            for (var i = 0; i < json.length; i++) {
                                console.log(json[i].name);
                                data.push(json[i].name);
                            }
                        }
                    }
                })
                return data;
            })()
        } ],
        yAxis : [ {
            type : 'value',
            axisLabel : {
                formatter : '{value} %'
            }
        } ],

        series : [ {
            name : '最小占比',
            type : 'bar',
            data : (function() {
                var arr = [];
                $.ajax({
                    url : 'http://localhost:8080/Demo01/hello.do',
                    type : 'get',
                    dataType : "json",
                    async : false,
                    success : function(data) {
                        if (data) {
                            for (var i = 0; i < data.length; i++) {
                                console.log(data[i].drilldown);
                                arr.push(data[i].drilldown);
                            }
                        }
                    }
                })
                return arr;
            })()
        }, {
            name : '最大占比',
            type : 'bar',
            data : (function() {
                var arr = [];
                $.ajax({
                    url : 'http://localhost:8080/Demo01/hello.do',
                    type : 'get',
                    dataType : "json",
                    async : false,
                    success : function(data) {
                        if (data) {
                            for (var i = 0; i < data.length; i++) {
                                console.log(data[i].value);
                                arr.push(data[i].value);
                            }
                        }
                    }
                })
                return arr;
            })()
        } ]
    };
    return option;
}
</script>