<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Lei Ming
  Date: 2019/6/21
  Time: 15:01
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
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <script src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">选手管理</a>
            <a>
              <cite>选手列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">

                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick=addVote()><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>序号</th>
                            <th>投票描述</th>

                            <th>开始时间</th>

                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                    <c:forEach items="${voteList}" var="vote" varStatus = "s">

                        <c:set value="${fn:substring(vote.vstart,0,19) }" var="vstart"></c:set>

                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="1"   lay-skin="primary">
                            </td>
                            <td style="display: none">${vote.vid}</td>
                            <td style="display: none">${vote.ltime}</td>
                            <td>${s.count}</td>
                            <td>${vote.vdescribe}</td>

                            <td>${vstart}</td>

                            <c:if test="${vote.status==1}">
                            <td class="td-status">
                                <span class="layui-btn layui-btn-normal layui-btn-mini" onclick="xadmin.open('投票详情','<%=basePath%>/voteResult?vid='+'${vote.vid}',1200,800)">投票进行中,点击查看投票详情</span>
                                <button type="button" class="layui-btn" onclick="closeVote('${vote.vid}')">点击关闭投票</button>
                            </td>
                            <td class="td-manage">
                            </c:if>
                            <c:if test="${vote.status==0}">
                            <td class="td-status">
                                <span class="layui-btn layui-btn-danger layui-btn-mini" onclick="xadmin.open('投票详情','<%=basePath%>/voteResult?vid='+'${vote.vid}',1200,800)">投票已结束,点击查看投票结果</span>
                            <button type="button" class="layui-btn" onclick="closeVote('${vote.vid}')">点击关闭投票</button>
                        </td>
                            <td class="td-manage">
                            </c:if>


                                <a title="显示投票地址" onclick="xadmin.open('扫一扫以投票！','http://qr.liantu.com/api.php?text=<%=basePath%>/voting?vid=${vote.vid}','300','360')" href="javascript:;">
                                    <i class="layui-icon">&#xe63c;</i></a>
                                <a title="删除" onclick="voteDelete('${vote.vid}')" href="javascript:;">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="prev" href="">&lt;&lt;</a>
                            <a class="num" href="">1</a>
                            <span class="current">2</span>
                            <a class="num" href="">3</a>
                            <a class="num" href="">...</a>
                            <a class="num" href="">12</a>
                            <a class="next" href="">&gt;&gt;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate','form','layer'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
        addVote = function () {
            layer.open({
                type:2,
                title:"添加投票",
                content:'<%=basePath%>/voteAdd',
                area: ['1200px', '800px'],
                end:function () {
                    location.reload()
                }
            })
        };
        closeVote=  function(vid){
            $.ajax({
                url:'<%=basePath%>/closeVote?vid='+vid,
                success:function (data) {


                        layer.alert('关闭成功!',{icon:1,time:3000},function () {
                            location.reload()
                        });
                    $(this).html("已关闭！");

                }
            })
        };
        voteDelete=function (vid){
            layer.confirm('确认要删除吗？',{
                btn: ["确定","取消"] //按钮
            },function(index){
                //发异步删除数据
                $.ajax({
                    url:"<%=basePath%>/deleteVote",
                    data:{'vid':vid},
                    success:function (data) {
                        layer.close(index);
                        if (data==1){
                            layer.alert('删除成功!',{icon:1,time:3000},function () {
                                location.reload()
                            });
                        }else if (data==2){
                            layer.alert('删除失败,该投票正在进行中！！',{icon:2,time:3000},function () {
                                location.reload()
                            });
                        }
                        else {
                            layer.alert('删除失败!',{icon:2,time:3000},function () {
                                location.reload()
                            });
                        }

                    }
                });


            });
        }


    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }




    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>
