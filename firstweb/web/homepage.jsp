<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/7/14
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/homePage.css" />

    <title>主页</title>
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
                <li><a href="back.jsp">个人信息</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="container-fluid">
    <div id="banner" class="carousel slide row" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#banner" data-slide-to="0" class="active">1</li>
            <li data-target="#banner" data-slide-to="1">2</li>
            <li data-target="#banner" data-slide-to="2">3</li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active text-center">
                <img class="img-fluid" src="image/缂丝花鸟图.jpg" >
                <div class="carousel-caption">
                    <h5>缂丝花鸟图</h5>
                    <p>图轴以宋徽宗赵佶的画稿为粉本进行摹缂。采用平缂、搭缂、盘梭、长短戗、木梳戗、合色线等繁复的技法将花叶的晕色、鸟羽的纹理表现得惟妙惟肖，行梭运丝的细巧使得所缂物象线条柔美，色泽鲜丽，较好地表现了原画细腻柔婉、高雅华贵的艺术风格。</p>
                </div>
            </div>
            <div class="carousel-item text-center">
                <img class="img-fluid" src="image/安喜宫绣佛像.jpg">
                <div class="carousel-caption">
                    <h5>缂丝花鸟图</h5>
                    <p>图轴以宋徽宗赵佶的画稿为粉本进行摹缂。采用平缂、搭缂、盘梭、长短戗、木梳戗、合色线等繁复的技法将花叶的晕色、鸟羽的纹理表现得惟妙惟肖，行梭运丝的细巧使得所缂物象线条柔美，色泽鲜丽，较好地表现了原画细腻柔婉、高雅华贵的艺术风格。</p>
                </div>
            </div>
            <div class="carousel-item text-center">
                <img class="img-fluid" src="image/鲍天成透雕浮槎犀角杯.jpg">
                <div class="carousel-caption">
                    <h5>缂丝花鸟图</h5>
                    <p>图轴以宋徽宗赵佶的画稿为粉本进行摹缂。采用平缂、搭缂、盘梭、长短戗、木梳戗、合色线等繁复的技法将花叶的晕色、鸟羽的纹理表现得惟妙惟肖，行梭运丝的细巧使得所缂物象线条柔美，色泽鲜丽，较好地表现了原画细腻柔婉、高雅华贵的艺术风格。</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#banner" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#banner" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class="container">
    <div class="card-deck">
        <div class="card text-center text-white bg-dark" style="width: 400px">
            <img class="card-img-top" src="image/缂丝花鸟图.jpg">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
        <div class="card text-center text-white bg-dark" style="width: 18rem;">
            <img class="card-img-top" src="image/安喜宫绣佛像.jpg">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
        <div class="card text-center text-white bg-dark" style="width: 18rem;">
            <img class="card-img-top" src="image/鲍天成透雕浮槎犀角杯.jpg">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
