<%--
  Created by IntelliJ IDEA.
  User: 10796
  Date: 2019/6/24
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>
<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;


     var myColor = ['#eb2100', '#eb3600', '#d0570e', '#d0a00e', '#34da62', '#00e9db', '#00c0e9', '#0096f3', '#33CCFF', '#33FFCC'];
    option = {
        backgroundColor: '#0e2147',
        grid: {
            left: '25%',
            top: '12%',
            right: '25%',
            bottom: '8%',
            containLabel: true
        },
        xAxis: [{
            show: false,
        }],
        yAxis: [{
            axisTick: 'none',
            axisLine: 'none',
            offset: '27',
            axisLabel: {
                textStyle: {
                    color: '#ffffff',
                    fontSize: '16',
                }
            },
            data: []
        }, {
            axisTick: 'none',
            axisLine: 'none',
            axisLabel: {
                textStyle: {
                    color: '#ffffff',
                    fontSize: '0',
                }
            },
            data:[]
        }, {
            name: [],
            nameGap: '30',
            nameTextStyle: {
                color: '#ffffff',
                fontSize: '30',
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(0,0,0,0)'
                }
            },
            data: [],
        }],
        series: [{
            name: '条',
            type: 'bar',
            yAxisIndex: 0,
            data: [],
            label: {
                normal: {
                    show: true,
                    position: 'right',
                    textStyle: {
                        color: '#ffffff',
                        fontSize: '16',
                    }
                }
            },
            barWidth: 12,
            itemStyle: {
                normal: {
                    color: function(params) {
                        var num = myColor.length;
                        return myColor[params.dataIndex % num]
                    },
                }
            },
            z: 2
        },
            {
                name: '外圆',
                type: 'scatter',
                hoverAnimation: false,
                data: [],
                yAxisIndex: 2,
                symbolSize: 35,
                itemStyle: {
                    normal: {
                        color: function(params) {
                            var num = myColor.length;
                            return myColor[params.dataIndex % num]
                        },
                        opacity: 1,
                    }
                },
                z: 2
            }
        ]
    };;


    setInterval(function () {
        $.ajax({
            url:'<%=basePath%>/findAllVotePlayer?vid='+'${vid}',
            success:function (data) {
                $.ajax({
                    url:'<%=basePath%>/findPoll?vid='+'${vid}',
                    success:function (date) {
                        $.ajax({
                            url:'<%=basePath%>/findDescribe?vid='+'${vid}',
                            success:function (describe) {
                                date=date.split(',');
                                data=data.split(',');

                                var data1 = new Array();
                                var data2 = new Array();
                                var data3 = new Array();
                                var data4 = new Array();
                                for (var i = 0; i <data.length ; i++) {
                                    data1.push('0');
                                }
                                for (var i = 0; i <data.length ; i++) {
                                    data2.push('100');
                                }
                                for (var i = 0; i <data.length ; i++) {
                                    data3.push('99.5');
                                }
                                for (var i = data.length+1; i >1 ; i--) {
                                    data4.push(''+i);
                                }
                                myChart.setOption({
                                    backgroundColor: '#0e2147',
                                    grid: {
                                        left: '25%',
                                        top: '12%',
                                        right: '25%',
                                        bottom: '8%',
                                        containLabel: true
                                    },
                                    xAxis: [{
                                        show: false,
                                    }],
                                    yAxis: [{
                                        axisTick: 'none',
                                        axisLine: 'none',
                                        offset: '27',
                                        axisLabel: {
                                            textStyle: {
                                                color: '#ffffff',
                                                fontSize: '16',
                                            }
                                        },
                                        data: data
                                    }, {
                                        axisTick: 'none',
                                        axisLine: 'none',
                                        axisLabel: {
                                            textStyle: {
                                                color: '#ffffff',
                                                fontSize: '0',
                                            }
                                        },
                                        data:data4
                                    }, {
                                        name: describe,
                                        nameGap: '30',
                                        nameTextStyle: {
                                            color: '#ffffff',
                                            fontSize: '30',
                                        },
                                        axisLine: {
                                            lineStyle: {
                                                color: 'rgba(0,0,0,0)'
                                            }
                                        },
                                        data: [],
                                    }],
                                    series: [{
                                        name: '条',
                                        type: 'bar',
                                        yAxisIndex: 0,
                                        data: date,
                                        label: {
                                            normal: {
                                                show: true,
                                                position: 'right',
                                                textStyle: {
                                                    color: '#ffffff',
                                                    fontSize: '16',
                                                }
                                            }
                                        },
                                        barWidth: 12,
                                        itemStyle: {
                                            normal: {
                                                color: function(params) {
                                                    var num = myColor.length;
                                                    return myColor[params.dataIndex % num]
                                                },
                                            }
                                        },
                                        z: 2
                                    },
                                        {
                                            name: '外圆',
                                            type: 'scatter',
                                            hoverAnimation: false,
                                            data: data1,
                                            yAxisIndex: 2,
                                            symbolSize: 35,
                                            itemStyle: {
                                                normal: {
                                                    color: function(params) {
                                                        var num = myColor.length;
                                                        return myColor[params.dataIndex % num]
                                                    },
                                                    opacity: 1,
                                                }
                                            },
                                            z: 2
                                        }
                                    ]
                                });
                            }
                        })


                    }

                })



            }
        });


    }, 1500);

</script>
</body>
</html>