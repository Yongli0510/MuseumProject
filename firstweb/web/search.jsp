<%@ page import="entity.Exhibit" %>
<%@ page import="dao.impl.ExhibitDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="service.UserService" %>
<%@ page import="dao.impl.UserDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/22
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>搜索页</title>

    <link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
    <style type="text/css">
        h5,p{
            color: white;
            text-align: center;
        }
        .layui-bg-cyan{
            padding: 1em;
            text-align: center;
        }
    </style>

</head>
<body class="layui-layout-body" style="background: url('image/decoration/background.jpg') center top no-repeat;background-size: cover;-moz-background-size: cover;-webkit-background-size: cover;">

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


    <div class="layui-body">
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>快来搜索艺术品吧！</legend>
            </fieldset>

            <div class="demoTable">
                <div class="layui-inline" style="">
                    <label class="layui-form-label">展品名称</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="name" autocomplete="off">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">简介</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="detail" autocomplete="off">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">馆藏地点</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="place" autocomplete="off">
                    </div>
                </div>
                <button class="layui-btn" id="search">搜索</button>
            </div>
        </div>

        <div id="searchResult">

        </div>
        <div>
            <ul class="layui-inline" id="page_prev">

            </ul>
            <ul class="layui-inline" id="page_ul">

            </ul>
            <ul class="layui-inline" id="page_next">

            </ul>
        </div>
    </div>

</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs">查看详情</a>
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="framework/layui/layui.js"></script>
<script type="text/javascript" src="js/page.js"></script>

<script type="text/javascript">
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
