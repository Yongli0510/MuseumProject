<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="entity.User" %>
<%@ page import="service.FriendService" %>
<%@ page import="service.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Exhibit" %>
<%@ page import="service.LoveService" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/21
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/homePage.css">
    <link rel="stylesheet" href="css/details.css">

    <title>主页</title>
</head>
<body>
<div class="container">
    <div id="header" class="row">
        <form action="search.jsp" method="post" class="col-md-12">
            <span><input type="text" name="fullSearchText" value="" id="fullSearchText" class="text-field1"
                         style="width: 180px;" autocomplete="off"/><input type="image" src="image/search.gif"
                                                                          class="text-field1-addon"/></span>

            <span><a href="log.jsp">登录</a> | <a href="sign.jsp">注册</a></span>

        </form>
    </div>
</div>

<div id="menu-outer">
    <div class="container">
        <div id="menu" class="row">
            <div class="col-sm-4">
                <a href="homepage.jsp"><img id="logo" src="image/logo.gif" class="img-responsive center-block"/></a>
            </div>
            <ul class="col-sm-8">
                <li><a href="homepage.jsp">首页</a></li>
                <li>|</li>
                <li><a href="search.jsp">搜索</a></li>
                <li>|</li>
                <li><a href="backlove.jsp">个人信息</a></li>
            </ul>
        </div>
    </div>
</div>

<%
    UserService us = new UserService(new UserDaoImpl());
    FriendService fs = new FriendService(new UserDaoImpl());
    User friend = us.getUser(Integer.parseInt(request.getParameter("id")));

    User me = us.getUser(((User) session.getAttribute("me")).getName());


%>

<div class="container">
    <div class="row">
        <div class="card text-white bg-dark text-center" style="width: 400px;height: 700px">
            <div class="card-body">
                <h5 class="card-title cp-info-name"><%=friend.getName()%>
                </h5>
                <p class="card-text cp-info-description">邮箱：<%=friend.getEmail()%>
                </p>
                <p class="card-text cp-info-description">个性签名：<%=friend.getSignature()%>
                </p>

                <%
                    if (me.getId() != friend.getId()) {
                        if (fs.isFriend(me, friend.getId())) {
                            %>
                            <a href="#" class="btn btn-primary">删除ta</a>
                            <%
                            } else {
                            %>
                            <a href="#" class="btn btn-primary">添加ta为好友</a>
                            <%
                        }
                    } else {
                        //如果这个是该用户的个人页面
                        %>
                        <a href="#" class="btn btn-primary">修改信息</a>
                        <%
                    }
                %>
            </div>
        </div>
        <div class="card text-white bg-dark text-center" style="width: 400px;height: 700px">
            <div class="card-body">
                <h5 class="card-title cp-info-name">收藏的文物</h5>
                <hr>
                <%
                    List<Exhibit> loves = us.getLoves(friend);
                    for (Exhibit love : loves) {
                %>
                <a href="details.jsp?id=<%=love.getId()%>" class="card-text cp-info-description"><%=love.getName()%></a>
                <hr>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
