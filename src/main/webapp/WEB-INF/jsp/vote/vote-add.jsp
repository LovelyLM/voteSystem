
<%--
  Created by IntelliJ IDEA.
  User: Lei Ming
  Date: 2019/6/21
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>投票后台管理系统(尼米工作室出品)</title>
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
                <label for="" class="layui-form-label">
                    <span class="x-red">*</span>投票主题</label>
                <div class="layui-input-inline">
                    <input type="text" id="" name="vdescribe" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>为必填项
                </div>
            </div>
            <div class="layui-form-item" id="players">
                <label for="" class="layui-form-label">
                    <span class="x-red">*</span>选择选手</label>
                <div class="layui-input-inline" style="width: 100px">
                    <select name="vplayer" lay-verify="required" lay-search lay-verify="required">
                        <option value="" selected disabled style="display: none;">请选择选手</option>
                        <c:forEach items="${players}" var="players" varStatus = "s">
                            <option value="${players.name}">${players.name}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="layui-input-inline" style="width: 100px">
                    <select name="vplayer" lay-verify="required" lay-search lay-verify="required">
                        <option value="" selected disabled style="display: none;">请选择选手</option>
                        <c:forEach items="${players}" var="players" varStatus = "s">
                            <option value="${players.name}">${players.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <a href="#" id="addPlayer" class="layui-btn"><i class="layui-icon layui-icon-add-1"></i></a>
                <a href="#" id="deletePlayer" class="layui-btn"><i class="layui-icon layui-icon-delete"></i></a>


            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label">
                    <span class="x-red">*</span>投票时间限制</label>

                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test4" placeholder="HH:mm:ss" autocomplete="off" lay-verify="required">
                </div>
                <div class="layui-form-mid layui-word-aux"><span class="x-red">*</span>0表示无时间限制</div>
            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">添加投票</button></div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer','jquery','laydate','element'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;
        var laydate = layui.laydate;
        var element = layui.element;
        laydate.render({
            elem: '#test4',
            type: 'time'
        });

        //自定义验证规则
        form.verify({
            limit: function(value) {
                if (!isNaN(value)==false) {
                    return '请输入数字';
                }else if (value<0) {
                    return '请输入正整数';
                }
            },
        });
        $("#addPlayer").click(function(){
            var mydiv = $("#players").children("div").eq(-1);
            var div =mydiv[0].outerHTML;
            mydiv.after(div);
            form.render();
            layer.msg("ok")
        });
        $("#deletePlayer").click(function(){
            var mydiv = $("#players").children("div");
            if (mydiv.length==2) {
                layer.msg("不能删除了哦！")
            }else{
                mydiv.eq(-1).remove();
            }



            form.render();
        })



            //监听提交
        form.on('submit(add)',
            function(data) {
            var ltime=$("#test4").val();
            var h=parseInt(ltime.substring(0,2))*60*60;
            var m = parseInt(ltime.substring(3,5))*60;
            var s = parseInt(ltime.substring(6,8));
            var palyers=new Array();
                $( "select option:selected" ).each(function() {
                    palyers.push($(this).val());

                });
                palyers =palyers.join();
            ltime = h+m+s;
                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>/addVote",
                    data:{'vdescribe':$("input[name='vdescribe']").val(),
                    'ltime':ltime,'vplayer':palyers
                    },
                    success: function(response){
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
                        }else if (response==2){
                            layer.msg("请输入正确的选手名！！",{icon: 5});

                        }
                        else{
                            layer.msg("增加失败",{icon: 5},
                                function() {
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
