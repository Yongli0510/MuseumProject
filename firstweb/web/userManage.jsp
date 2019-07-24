<%@ page import="entity.User" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="service.UserService" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/18
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人员管理</title>

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
                <li class="layui-nav-item">
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
                <li class="layui-nav-item layui-nav-itemed">
                    <a>管理界面</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="userManage.jsp">人员管理</a></dd>
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
            <legend>用户列表：</legend>
        </fieldset>

            <%--这里是添加新的--%>
        <button class="layui-btn" id="umAddUser" style="margin-left: 30px">添加新用户</button>

        <table class="layui-hide" id="umTable" lay-filter="demo"></table>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>


<%--用于添加新用户的表单--%>
<form class="layui-form" id="newUserForm" method="post" style="display: none" lay-filter="newUserForm">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-inline">
            <input name="um_type"  id="um_type" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input name="um_id"  id="um_id" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input name="um_name" id="um_name" lay-verify="um_name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮 箱</label>
        <div class="layui-input-inline">
            <input name="um_mail" id="um_mail" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密 码</label>
        <div class="layui-input-inline">
            <input name="um_password" id="um_password" type="password" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">权限设置</label>
        <div class="layui-input-inline">
            <input name="um_per"  id="um_per" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">个性签名</label>
        <div class="layui-input-inline">
            <input name="um_sig" id="um_sig" autocomplete="off" class="layui-input">
        </div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="um_save" class="layui-btn">保存修改</button>
        </div>
    </div>
</form>

<script type="text/html" id="um_bar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="um_permission">
    <a class="layui-btn layui-btn-xs" lay-event="to_admin">升级</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="to_normal">降级</a>
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="framework/layui/layui.js"></script>
<script src="js/md5.js"></script>
<script src="js/hintShow.js"></script>
<script type="text/javascript" src="js/usermanage.js"></script>


<script src="js/cookie.js"></script>
<script src="js/previouspage.js"></script>

</body>
</html>
