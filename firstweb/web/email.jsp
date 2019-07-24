<%@ page import="entity.User" %>
<%@ page import="service.UserService" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="dao.impl.EmailDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Email" %><%--
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
                        <dd class="layui-this"><a href="email.jsp">私信</a></dd>
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
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">收件箱</li>
                <li>发件箱</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <table id="testReload" lay-filter="parse-table-demo">
                        <thead>
                        <tr>
                            <th style="display: none" lay-data="{field:'id', width:200}">id</th>
                            <th lay-data="{field:'read', width:200,sort:true}">是否已读</th>
                            <th lay-data="{field:'time', width:200,sort:true}">时间</th>
                            <th lay-data="{field:'sendUser', width:200}">发件人</th>
                            <th lay-data="{field:'content', width:200}">内容</th>
                            <th lay-data="{fixed: 'right', width:200, align:'center', toolbar: '#barDemo'}"></th>
                        </tr>
                        </thead>
                        <tbody style="display: none">
                        <%
                            EmailDaoImpl emailDao = new EmailDaoImpl();
                            List<Email> receivedEmail = emailDao.getReceivedEmail(user.getId());
                            for (Email email : receivedEmail){
                                int id = email.getId();
                                String read = email.getIsRead() == 0 ? "未读" : "已读";
                                String sendUser = new UserDaoImpl().getUser(email.getSendId()).getName();
                        %>

                        <tr>
                            <td style="display: none"><%= id %></td>
                            <td><%= read %></td>
                            <td><%= email.getTime() %></td>
                            <td><%= sendUser %></td>
                            <td><%= email.getContent() %></td>
                        </tr>

                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>

                <div class="layui-tab-item">
                    <table lay-filter="parse-table-demo">
                        <thead>
                        <tr>
                            <th lay-data="{field:'time', width:200,sort:true}">时间</th>
                            <th lay-data="{field:'sendUser', width:200}">收件人</th>
                            <th lay-data="{field:'content', width:200}">内容</th>
                            <th lay-data="{field:'status', width:200}">状态</th>
                        </tr>
                        </thead>
                        <tbody style="display: none">
                        <%
                            List<Email> sentEmail = emailDao.getSentEmail(user.getId());
                            for (Email email : sentEmail){
                                String read = email.getIsRead() == 0 ? "对方未读" : "对方已读";
                                String receiveUser = new UserDaoImpl().getUser(email.getResId()).getName();
                        %>

                        <tr>
                            <td><%= email.getTime() %></td>
                            <td><%= receiveUser %></td>
                            <td><%= email.getContent() %></td>
                            <td><%= read %></td>
                        </tr>

                        <%
                            }
                        %>

                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改已读/未读状态</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="framework/layui/layui.js"></script>
<script type="text/javascript" src="js/email.js"></script>

</body>
</html>