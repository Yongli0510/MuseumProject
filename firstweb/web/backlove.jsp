<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Exhibit" %>
<%@ page import="service.UserService" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="service.LoveService" %>
<%@ page import="dao.impl.LoveDaoImpl" %>
<%@ page import="entity.LoveItem" %>
<%@ page import="dao.impl.ExhibitDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/13
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="framework/layui/css/layui.css">
</head>
<body class="layui-layout-body">

<%
    User me = (User) session.getAttribute("me");
%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">我的信息</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <%=me.getName()%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree site-demo-nav">

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">账户管理</a>
                    <dl class="layui-nav-child">
                        <dd class="">
                            <a href="">个人信息</a>
                        </dd>
                        <dd class="">
                            <a href="">好友管理</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">收藏管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a href="">默认收藏</a>
                        </dd>
                        <dd class="">
                            <a href="">清代藏品</a>
                        </dd>
                    </dl>
                </li>


                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div style="padding: 20px; background-color: #F2F2F2;" id="loves_section">
                <div class="layui-row layui-col-space15">

                    <%

                        LoveService ls = new LoveService(new LoveDaoImpl(),new ExhibitDaoImpl());
                        List<LoveItem> loves = ls.getLoves(me);
                        for (LoveItem love : loves) {
                            Exhibit ex = ls.getLoveOne(love.getArtid());
                    %>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header"><%=ex.getName()%></div>
                            <div class="layui-card-body">
                                收藏展品的时间:<%=love.getTime()%><br>
                                馆藏地点:<%=ex.getPlace()%><br>
                                热度<%=ex.getHotDegree()%><br>
                                可见度：<%=love.getCanSee()==0?"不可见":"可见"%><br>
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm bt_love_level_1" >公开</button>
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm bt_love_level_0" id=""><i class="layui-icon">私有</i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>


                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="framework/layui/layui.js"></script>
<script src="js/hintShow.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });

    $(function () {

        var setPublic = function (level) {
            $.post("./updatelovelevel", {
                newLevel: level
            }, function (result) {
                var jsonObject = JSON.parse(result);
                if (jsonObject.success === true) {
                    show("修改成功");
                } else {
                    show("修改失败");
                }
            });
        };

        $(".bt_love_level_0").click(function () {
            setPublic(0);
        });
        $(".bt_love_level_1").click(function () {
            setPublic(1);
        });
    });









</script>
</body>
</html>
