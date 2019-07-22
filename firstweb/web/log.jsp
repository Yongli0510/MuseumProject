<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/13
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Signin Template for Bootstrap</title>
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<form class="form-signin" id="log_form">
    <h1 class="h3 mb-3 font-weight-normal">请登录</h1>

    <label for="log_name" class="sr-only">账户</label>
    <input type="text" id="log_name" name="log_name" class="form-control" placeholder="Name" required autofocus>


    <label for="log_pwd" class="sr-only">密码</label>
    <input type="password" id="log_pwd" name="log_pwd" class="form-control" placeholder="Password" required>

    <div class="alert alert-warning" role="alert" id="error_msg">
        用户名或密码错误
    </div>

    <a class="btn btn-lg btn-primary btn-block" id="to_log">登录</a>
</form>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="framework/layui/layui.js"></script>
<script src="js/md5.js"></script>
<script src="js/hintShow.js"></script>
<script>


    $(function () {
        $("#error_msg").hide();

    });
    /*前端md5加密*/
    var modifyPwd = function (pwd) {
        return $.md5(pwd);
    };



    $("#to_log").click(function () {
        $.post("./slog", {
            log_name: $("#log_name").val(),
            log_pwd: modifyPwd($("#log_pwd").val())
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject === null) {
                $("#error_msg").show();
            } else {
                show("登录成功！<br>5秒后将自动跳转...");
                setTimeout(function () {
                    window.location.href="backlove.jsp";
                },5000);

            }
        });

    });


</script>

</body>
</html>
<%--$.ajax({--%>
<%--type: 'post',--%>
<%--url: "slog",--%>
<%--data: {--%>
<%--"log_name": $("#log_name").val(),--%>
<%--"log_pwd": $("#log_pwd").val()--%>
<%--},--%>
<%--success: function (data) {--%>
<%--var jsonObject = JSON.parse(data);--%>
<%--if (jsonObject === null) {--%>
<%--layer.msg('用户名或密码输入错误', {--%>
<%--time: 5000, //5s后自动关闭--%>
<%--btn: ['明白了']--%>
<%--});--%>
<%--} else {--%>
<%--alert("xxxx");--%>
<%--}--%>
<%--},--%>
<%--error: function (msg) {--%>
<%--alert("zzzzzz");--%>
<%--}--%>
<%--});--%>