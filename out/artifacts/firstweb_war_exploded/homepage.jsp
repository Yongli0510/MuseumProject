<%@ page import="entity.Exhibit" %>
<%@ page import="dao.impl.ExhibitDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="service.UserService" %><%--
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
    <title>首页</title>

    <link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/homepage.css">

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


    <div class="layui-body">
        <%
            //TODO:获得热度前三的展品的id
            ExhibitDaoImpl exhibitDaoImpl = new ExhibitDaoImpl();
            List<Exhibit> hottestExhibits = exhibitDaoImpl.getHottestExhibits(3);

        %>

        <div class="layui-carousel" id="carousel" lay-filter="carousel">
            <div carousel-item="">
                <div>
                    <a href="details.jsp?id=<%= hottestExhibits.get(0).getId()%>">
                        <img src="image/exhibit/<%=hottestExhibits.get(0).getPic()%>.jpg">
                        <div class="words">
                            <h3><%=hottestExhibits.get(0).getName()%></h3>
                            <p><%=hottestExhibits.get(0).getDetail()%></p>
                        </div>
                    </a>
                </div>

                <div>
                    <a href="details.jsp?id=<%= hottestExhibits.get(1).getId()%>">
                        <img src="image/exhibit/<%=hottestExhibits.get(1).getPic()%>.jpg">
                        <div class="words">
                            <h3><%=hottestExhibits.get(1).getName()%></h3>
                            <p><%=hottestExhibits.get(1).getDetail()%></p>
                        </div>
                    </a>
                </div>

                <div>
                    <a href="details.jsp?id=<%= hottestExhibits.get(2).getId()%>">
                        <img src="image/exhibit/<%=hottestExhibits.get(2).getPic()%>.jpg">
                        <div class="words">
                            <h3><%=hottestExhibits.get(2).getName()%></h3>
                            <p><%=hottestExhibits.get(2).getDetail()%></p>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <%

            //TODO:获得另外三种展品的id
            List<Exhibit> latestExhibits = exhibitDaoImpl.getLatestExhibits(3);
        %>

        <div class="layui-main">
            <div class="layui-inline">
                <img src="image/exhibit/<%=latestExhibits.get(0).getPic()%>.jpg">
                <div class="layui-bg-cyan">
                    <h3><%=latestExhibits.get(0).getName()%></h3>
                    <p><%=latestExhibits.get(0).getDetail()%></p>
                    <a href="details.jsp?id=<%=latestExhibits.get(0).getId()%>" name="a1" class="layui-btn">查看详情</a>
                </div>
            </div>
            <div class="layui-inline">
                <img src="image/exhibit/<%=latestExhibits.get(1).getPic()%>.jpg">
                <div class="layui-bg-cyan">
                    <h3><%=latestExhibits.get(1).getName()%></h3>
                    <p><%=latestExhibits.get(1).getDetail()%></p>
                    <a href="details.jsp?id=<%=latestExhibits.get(1).getId()%>" name="a1" class="layui-btn">查看详情</a>
                </div>
            </div>
            <div class="layui-inline" >
                <img src="image/exhibit/<%=latestExhibits.get(2).getPic()%>.jpg">
                <div class="layui-bg-cyan">
                    <h3><%=latestExhibits.get(2).getName()%></h3>
                    <p><%=latestExhibits.get(2).getDetail()%></p>
                    <a href="details.jsp?id=<%=latestExhibits.get(2).getId()%>" name="a1" class="layui-btn">查看详情</a>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="framework/layui/layui.js"></script>

<script type="text/javascript">
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#carousel'
            ,width: '1140px'
            ,height: '500px'
            ,interval: 5000
        });
    });
</script>
</body>
</html>
