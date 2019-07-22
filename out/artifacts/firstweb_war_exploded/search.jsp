<%--
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

    <title>搜索艺术品</title>

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

<div class="container">
    <h1 style="color: #bb9b68;">快来搜索艺术品吧！</h1>
    <form>
        <p>按名称搜索：<input type="text" id="name" name="searchItems"></p>
        <p>按简介搜索：<input type="text" id="detail" name="searchItems"></p>
        <p>按馆藏地点搜索：<input type="text" id="place" name="searchItems" ></p>
        <button id = "search" type="button" class="btn btn-primary">搜索</button>
    </form>
</div>

<div class="container">
    <div id="searchResult">

    </div>
    <nav aria-label="Page navigation example" class="row justify-content-center">
        <ul class="pagination" id="page_prev" >

        </ul>
        <ul class="pagination" id="page_ul">

        </ul>
        <ul class="pagination" id="page_next">

        </ul>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script type="text/javascript" src="js/page.js"></script>
</body>
</html>
