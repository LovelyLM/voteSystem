<%--
  Created by IntelliJ IDEA.
  User: Lei Ming
  Date: 2019/6/21
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%=basePath%>/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>为必填项,且本系统暂时不支持录入同名选手</div>
            </div>
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red"></span>年龄</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="age" required="" lay-verify="" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="gender" class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-inline">
                    <input type="radio" id="gender" name="gender" value="男" title="男" checked="">
                    <input type="radio" name="gender" value="女" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label">
                    <span class="x-red">*</span>QQ号码</label>
                <div class="layui-input-inline">
                    <input type="text" id="" name="telephone" required="" lay-verify="phone" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer','jquery'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则

        //监听提交
        form.on('submit(add)',
            function(data) {
                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>/addPlayer",
                    data:$(".layui-form").serialize(),
                    success: function(response){
                        console.log(response);
                        if(response==1){
                            layer.alert("增加成功", {
                                icon: 6
                                },
                                function() {
                                    // 获得frame索引
                                    var index = parent.layer.getFrameIndex(window.name);
                                    //关闭当前frame
                                    parent.layer.close(index);
                                });
                        }else{
                            layer.msg("增加失败",{icon: 5},                     function() {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                    }
                });
                return false;
            });

    });</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>