<%@ page import="entity.User" %>
<%@ page import="service.UserService" %>
<%@ page import="dao.impl.UserDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/13
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>展品管理</title>

    <link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
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
                    <dd><a href="email.jsp">私信</a></dd>
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
                        <dd><a href="email.jsp">私信</a></dd>
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
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>在已有展品中搜索：</legend>
        </fieldset>

        <div class="demoTable">
            <div class="layui-inline">
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
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>添加新展品：</legend>
        </fieldset>
        <button class="layui-btn" id="addExhibit" style="margin-left: 30px">添加新展品</button>

        <table class="layui-hide" id="test" lay-filter="demo"></table>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<form class="layui-form" id="information" method="post" style="display: none" lay-filter="informationForm">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-inline">
            <input name="type"  id="type" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input name="id"  id="id" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作品名称</label>
        <div class="layui-input-inline">
            <input name="name" id="nam" lay-verify="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-inline">
            <input name="detail" id="det" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">馆藏地点</label>
        <div class="layui-input-inline">
            <input name="place" id="pla" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">作品完成年代</label>
        <div class="layui-input-inline">
            <input name="age"  id="age" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出土时间</label>
        <div class="layui-input-inline">
            <input name="year" id="year" type="number" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">图片文件名</label>
        <div class="layui-input-inline">
            <input name="pic" id="pic" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">上传图片(如果需要修改图片)</label>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="chooseImage">上传图片</button>
            <div class="layui-upload-list" style="">
                <img class="layui-upload-img" id="imageShow">
            </div>
            <p id="demoText"></p>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="save" class="layui-btn">保存修改</button>
        </div>
    </div>
</form>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="framework/layui/layui.js"></script>
<script type="text/javascript" src="js/exhibitManage.js"></script>
</body>
</html>