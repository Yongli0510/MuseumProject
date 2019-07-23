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
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">博物馆</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="homepage.jsp">首页</a></li>
            <li class="layui-nav-item"><a href="search.jsp">搜索</a></li>
            <%
                User user = null;
                UserService us = new UserService(new UserDaoImpl());
                if (session.getAttribute("me") != null) {
                    user = us.getUser(((User) session.getAttribute("me")).getId());
                    if (user.getPermission() == 0) {
                        session.setAttribute("permission", "true");
                    }

                    if ("true".equals(session.getAttribute("permission"))){
            %>
            <li class="layui-nav-item">
                <a>后台管理（需管理员权限）</a>
                <dl class="layui-nav-child">
                    <dd><a href="userManage.jsp">人员管理</a></dd>
                    <dd><a href="exhibitManager.jsp">作品管理</a></dd>
                </dl>
            </li>
            <%
                    }
                }
            %>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <%
                    if (user != null) {
                %>

                <a>
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <%= user.getName()%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="personalpage.jsp?id=<%=user.getId()%>">我的主页</a></dd>
                    <dd><a href="selfManage.jsp">信息管理</a></dd>
                    <dd><a href="friends.jsp">好友列表</a></dd>
                    <dd><a href="backlove.jsp">收藏夹</a></dd>
                    <dd><a href="logout">退出登录</a></dd>
                </dl>

                <%
                } else {
                %>

                <a>
                    未登录
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="log.jsp">登录</a></dd>
                    <dd><a href="sign.jsp">注册</a></dd>
                </dl>
                <%
                    }
                %>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="">用户相关</a>
                    <dl class="layui-nav-child">
                        <dd><a href="personalpage.jsp?id=<%=user.getId()%>">我的主页</a></dd>
                        <dd><a href="selfManage.jsp">信息管理</a></dd>
                        <dd><a href="friends.jsp">好友列表</a></dd>
                        <dd><a href="backlove.jsp">收藏夹</a></dd>
                    </dl>
                </li>

                <%
                    if ("true".equals(session.getAttribute("permission"))){
                %>
                <li class="layui-nav-item">
                    <a>管理界面</a>
                    <dl class="layui-nav-child">
                        <dd><a href="userManage.jsp">人员管理</a></dd>
                        <dd><a href="exhibitManager.jsp">展品管理</a></dd>
                    </dl>
                </li>
                <%
                    }
                %>
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
                        List<LoveItem> loves = ls.getLoves(user);
                        for (LoveItem love : loves) {
                            Exhibit ex = ls.getLoveOne(love.getArtid());
                    %>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header"><%=ex.getName()%></div>
                            <div class="layui-card-body">
                                收藏展品的时间:<%=love.getTime()%><br>
                                馆藏地点:<%=ex.getPlace()%><br>
                                热度:<%=ex.getHotDegree()%><br>
                                可见度：<%=love.getCanSee()==0?"不可见":"可见"%><br>
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="updataMyLove(<%=user.getId()%>,<%=ex.getId()%>,'setpublic',1)">公开</button>
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="updataMyLove(<%=user.getId()%>,<%=ex.getId()%>,'setpublic',0)">私有</button>
                                </div>
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="window.location.href='details.jsp?id=<%=ex.getId()%>'">
                                        <i class="layui-icon">&#xe602;</i>
                                    </button>
                                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="updataMyLove(<%=user.getId()%>,<%=ex.getId()%>,'del',0)">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
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

<script src="js/cookie.js"></script>
<script src="js/previouspage.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });

    var updataMyLove = function (userid,artid,func,level) {
        $.post("./updatelovelevel", {
            userId:userid,
            artId:artid,
            newLevel: level,
            func:func
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject.success === true) {
                show("修改成功");
                setTimeout(function () {
                    location.reload();
                },2000);

            } else {
                show("修改失败");
                setTimeout(function () {
                    location.reload();
                },2000);
            }
        });
    };

</script>
</body>
</html>
