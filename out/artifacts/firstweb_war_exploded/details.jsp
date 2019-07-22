<%@ page import="entity.Exhibit" %>
<%@ page import="dao.impl.ExhibitDaoImpl" %><%--
Created by IntelliJ IDEA.
User: lenovo
Date: 2019/7/14
Time: 16:15
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/homePage.css">
    <link rel="stylesheet" href="css/details.css">
    <title>艺术品详情</title>
</head>
<body>

<div class="container">
    <div id="header" class="row">
        <form action="search.jsp" method="post" class="col-md-12">
            <span><input type="text" name="fullSearchText" value="" id="fullSearchText" class="text-field1" style="width: 180px;" autocomplete="off"/><input type="image" src="image/search.gif" class="text-field1-addon" /></span>

            <span><a href="log.jsp">登录</a> | <a href="sign.jsp">注册</a></span>

        </form>
    </div>
</div>

<div id="menu-outer">
    <div class="container">
        <div id="menu" class="row">
            <div class="col-sm-4">
                <a href="homepage.jsp"><img id="logo" src="image/logo.gif" class="img-responsive center-block" /></a>
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
    ExhibitDaoImpl exhibitDaoImpl = new ExhibitDaoImpl();
    Exhibit exhibit = exhibitDaoImpl.getExhibit(Integer.parseInt(request.getParameter("id")));
    if(exhibit!=null){
        //热度加一
        exhibitDaoImpl.updateHotDegree(exhibit.getId());
%>

<div class="container">
    <div class="row">
        <div class="picture-preview">
            <img src="image/<%=exhibit.getPic()%>.jpg" class="img-fluid">
        </div>
        <div class="card text-white bg-dark text-center" style="width: 400px;height: 700px">
            <div class="card-body">
                <h5 class="card-title cp-info-name"><%=exhibit.getName()%></h5>
                <p class="card-text cp-info-description">年代：<%=exhibit.getAge()%></p>
                <p class="card-text cp-info-description">馆藏地点：<%=exhibit.getPlace()%></p>
                <p class="card-text cp-info-description">出土时间：<%=exhibit.getYear()%>年</p>
                <p class="card-text cp-info-description">简介：<%=exhibit.getDetail()%></p>
                <p class="card-text cp-info-description">热度：<%=exhibit.getHotDegree() + 1%></p>
                <a href="#" class="btn btn-primary">收藏</a>
                <a href="#" class="btn btn-primary">管理该展品</a>
            </div>
        </div>
    </div>
</div>

<%
    }
%>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
