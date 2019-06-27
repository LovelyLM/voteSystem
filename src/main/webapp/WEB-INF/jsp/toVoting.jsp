<%--
  Created by IntelliJ IDEA.
  User: 10796
  Date: 2019/6/27
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--苹果手机全屏问题-->
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />

    <title>投票</title>
    <link href="<%=basePath%>/css/boilerplate.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/animate.css" rel="stylesheet" type="text/css">
    <link href="css/sweet-alert.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <style>


    </style>

</head>
<body style="background:deeppink; z-index: 1;"  >

<div id="audio_btn" class="video_exist off play_yinfu" style="display: block;">
    <div id="yinfu" class="rotate"></div>
    <audio  id="media" autoplay preload><source src="<%=basePath%>/music/bg.mp3" type="audio/mpeg"></audio>
</div>

<div id="title1" class="fluid fadeInLeft animated" style="display: block;">
    <div id="div1" class="">
    </div>

</div>

<div class="gridContainer clearfix">
    <div id="div2" class="fluid bounceInLeft animated">
        <img src="<%=basePath%>/images/log_1.png" style="width: 88%;">
    </div>
    <div id="div2_1" class="fluid bounceInRight animated">
        <img src="<%=basePath%>/images/log_2.png" style="width: 88%;">
    </div>
</div>


<div class="gridContainer clearfix">
    <div id="div3" class="fluid flipInX animated">
        <img src="<%=basePath%>/images/title_3.png" style="width:80%;">
    </div>
</div>

<div class="gridContainer clearfix" style="z-index:99;">
    <div id="div4" class="fluid bounceIn animated" style="z-index:999;">
        <select name="vplayer" lay-verify="required" lay-search lay-verify="required">
            <option value="" selected disabled style="display: none;">请选择比赛</option>
            <c:forEach items="${vote}" var="vote">
                <option value="${vote.vid}">${vote.vdescribe}</option>
            </c:forEach>
        </select>

    </div>
</div>

<div class="gridContainer clearfix" style="z-index:99;">
    <div id="div4" class="fluid bounceIn animated" style="z-index:999;animation-delay:4s;
	-webkit-animation-delay:4s;
	-moz-animation-delay:4s;
	margin-top: 2em;
	z-index:10;">
        <a  class="go btn" style="z-index:9999;" onClick="toVoting()">点击投票</a>
    </div>
</div>


<script src="<%=basePath%>/js/respond.min.js"></script>
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/respond.min.js"></script>
<script src="<%=basePath%>/js/sweet-alert.min.js"></script>
<script>
    toVoting=function(){
        var vote=$( "select option:selected" ).val();
        window.location.href="<%=basePath%>/voting?vid="+vote;
    }






    $("#audio_btn").click(function(){
        var music = document.getElementById("media");
        if(music.paused){
            music.play();
            $("#yinfu").addClass('rotate');
            $("#audio_btn").addClass('play_yinfu');
            $("#music_btn").attr("src","play.gif");
        }else{
            music.pause();
            $("#yinfu").removeClass('rotate');
            $("#audio_btn").removeClass('play_yinfu');
            $("#music_btn").attr("src","pause.gif");
        }
    });
</script>
</body>
</html>
