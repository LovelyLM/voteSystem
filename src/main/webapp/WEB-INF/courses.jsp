<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lei Ming
  Date: 2019/6/21
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
</head>
<body class="index">
<div class="courses">
    <c:set value="${courses}" var="courses"/>
    <c:forEach items="${courses}" var="course">
        <div>
            科目：<input type="text" value="${course.courseName}">
            学分：<input type="text" value="${course.credit}">
            <button type="button">修改</button>
            <button type="button">删除</button>
        </div>
    </c:forEach>

</div>
<div style="margin-top: 5cm">
    <button type="button">添加</button>
</div>

</body>


</html>
