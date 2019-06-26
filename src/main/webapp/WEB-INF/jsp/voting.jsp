<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: 10796
  Date: 2019/6/25
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${vote.vdescribe}投票！！</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="http://pv.sohu.com/cityjson"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>请选择选手投票！！（只能投一次）</h1>
    </div>
    <c:set value="${ fn:split(vote.vplayer, ',') }" var="players" />
    <c:forEach items="${players}" var="players">
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="http://api.laolibab.cn/king/dm_tupian.php" class="img-circle"
                 alt="">
            <div class="caption">
                <h3>${players}</h3>
                <p>我是${players},请为我投票吧！</p>
                <p>
                    <a class="btn btn-primary" role="button" onclick="vote('${players}')">
                        <span class="glyphicon glyphicon-thumbs-up"></span>
                        投票！
                    </a>
                    <span class="alert alert-success" style="display: none"></span>
                    <span class="alert alert-danger" style="display: none"></span>

                </p>
            </div>
        </div>
    </div>
    </c:forEach>

    <div class="row">
        <iframe class="embed-responsive-item" src="<%=basePath%>/voteResult?vid=${vote.vid}" width="100%" height="700px">
        </iframe>
    </div>

</div>

</body>
<script>
    vote = function (players) {
        $.ajax({
            url:"<%=basePath%>/findStatus?vid=${vote.vid}",
            success:function (data) {
                if (data==1){
                    $.ajax({
                        url:"<%=basePath%>/vote",
                        data:{vid:${vote.vid},name:players,newi:returnCitySN['cip']},
                        success:function (data) {
                            if (data==1){
                                alert("投票成功！")
                                $(this).nextAll(".alert-success").css("display","")
                                $(this).nextAll(".alert-success").html("投票成功！")
                            }else {
                                alert("请勿重复投票！");
                                $(this).nextAll(".alert-danger").css("display","")
                                $(this).nextAll(".alert-danger").html("重复投票！")
                            }

                        }
                    })

                }else if (data==0){
                    alert("该投票已结束！")
                }else {
                    alert("服务器错误，请联系管理员！");
                }
            }
        })




    }
</script>

</html>