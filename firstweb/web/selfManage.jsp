<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/23
  Time: 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员管理</title>
    <link rel="stylesheet" href="framework/layui/css/layui.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
                if (session.getAttribute("me") != null) {
                    user = (User) session.getAttribute("me");
                    if (user.getPermission() == 0) {
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
                    <dd><a href="personalpage.jsp">个人信息</a></dd>
                    <dd><a href="friends.jsp">好友列表</a></dd>
                    <dd><a href="backlove.jsp">收藏夹</a></dd>
                    <dd><a href="">退出登录</a></dd>
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
                        <dd><a href="personalpage.jsp">个人信息</a></dd>
                        <dd><a href="friends.jsp">好友列表</a></dd>
                        <dd><a href="backlove.jsp">收藏夹</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a>管理界面</a>
                    <dl class="layui-nav-child">
                        <dd><a href="userManage.jsp">人员管理</a></dd>
                        <dd><a href="exhibitManager.jsp">展品管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="modify_name" class="layui-form-label">用户名*</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="modify_name" placeholder="Enter name"
                           value="<%=user.getName()%>">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="modify_mail" class="layui-form-label">邮箱*</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="modify_mail" placeholder="Enter email"
                           value="<%=user.getEmail()%>">
                </div>
            </div>


            <div class="layui-form-item">
                <label for="modify_sig" class="layui-form-label">签名</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="modify_sig" placeholder="Enter email"
                           value="<%=user.getSignature()%>">
                </div>
            </div>

            <div class="layui-form-item">

                <label for="modify_pwd" class="layui-form-label">密码*</label>
                <div class="layui-input-block">
                    <input type="password" class="layui-input" id="modify_pwd" placeholder="Enter email">
                </div>
            </div>

            <button type="button" class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">
                <a onclick="check()">确认修改</a>
            </button>
        </form>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="framework/layui/layui.js"></script>
<script src="js/hintShow.js"></script>
<script src="js/formcheck.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });


    var check = function () {
        var name = $("#modify_name").val();
        var email = $("#modify_mail").val();
        var sig = $("#modify_sig").val();
        var pwd = $("#modify_pwd").val();

        if (checkEmpty(name) || checkEmpty(email) || checkEmpty(pwd)) {
            show("您还有必填的项目未进行填写");
        } else {
            if (!checkNameValid(name)) {
                show("您的用户名输入不合法");
            } else if (!checkEmailValid(email)) {
                show("您的邮箱输入不合法");
            } else {
                submit(name,email,sig,pwd);
            }
        }
    };

    var submit = function (name, email, sig, pwd) {
        $.post("./", {
            name: name,
            email: email,
            sig: sig,
            pwd: pwd
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject.success === true) {
                if (jsonObject.pwdCorrect === false) {
                    show("密码输入不正确");
                } else if (jsonObject.nameValid === false) {
                    show("用户名重复");
                } else {
                    show("修改成功");
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                }

            } else {
                show("修改失败");
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        });
    };


</script>
</body>
</html>

