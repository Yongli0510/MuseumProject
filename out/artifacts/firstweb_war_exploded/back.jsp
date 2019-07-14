<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/13
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人信息</title>
    <link rel="stylesheet" href="framework/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">我的信息</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <%=session.getAttribute("name")%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree site-demo-nav">

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">账户管理</a>
                    <dl class="layui-nav-child">
                        <dd class="">
                            <a href="">个人信息</a>
                        </dd>
                        <dd class="">
                            <a href="">好友管理</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">收藏管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a href="">默认收藏</a>
                        </dd>
                        <dd class="">
                            <a href="">清代藏品</a>
                        </dd>
                    </dl>
                </li>


                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div style="padding: 20px; background-color: #F2F2F2;" id="loves_section">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">收藏1</div>
                            <div class="layui-card-body">
                                收藏展品的时间<br>
                                馆藏地点<br>
                                热度<br>
                                收藏是否公开的属性
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">收藏2</div>
                            <div class="layui-card-body">
                                收藏展品的时间<br>
                                馆藏地点<br>
                                热度<br>
                                收藏是否公开的属性
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">收藏3</div>
                            <div class="layui-card-body">
                                收藏展品的时间<br>
                                馆藏地点<br>
                                热度<br>
                                收藏是否公开的属性
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script src="framework/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

</script>
</body>
</html>
