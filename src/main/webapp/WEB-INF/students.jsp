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
<table border="1">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>班级</th>
        <c:set value="${courseList }" var="course"/>
        <c:forEach items="${course}" var="course">
            <th>${course}</th>
        </c:forEach>
        <th>不及格门数</th>
        <th>平均分</th>
        <th>总分</th>
        <th>所得学分</th>
        <th>平均学分</th>
        <th>排名</th>
    </tr>
    <c:set value="${students }" var="students" />
    <c:forEach items="${students}" var="student" varStatus = "s">
        <tr>
            <td style="display: none">${student.id}</td>
            <td>${student.stuNo}</td>
            <td>${student.name}</td>
            <td>${student.className}</td>
            <c:set value="${student.gradeVoList }" var="gradeVoList"/>
            <c:forEach items="${gradeVoList}" var="gradeVo">
                <th>${gradeVo.grade}</th>
            </c:forEach>
            <td>${s.count}</td>
        </tr>
    </c:forEach>
    <%--    <tr>--%>
    <%--        <td>January</td>--%>
    <%--        <td>$100</td>--%>
    <%--    </tr>--%>
</table>


</body>


</html>
