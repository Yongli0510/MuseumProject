<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/13
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="framework/layui/css/layui.css">
<link rel="stylesheet" href="css/home2.css">
<link href="css/signin.css" rel="stylesheet">


<head>
    <title>Sign</title>
    <style>
        .row-center{
            text-align:center;
            margin-top: 120px;
        }
        .col-center {
            display:inline-block;
            float:none;
            text-align:left;
        }
    </style>
</head>
<body class="text-center">
<a class="h2 mb-3 font-weight-normal" href="homepage.jsp"><i class="layui-icon">&#xe68e;</i></a>
<div class="container" id="reg_content">

            <form>
                <h1 class="h3 mb-3 font-weight-normal">请注册</h1>
                <div class="form-group row">
                    <label for="sign_name" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="sign_name" placeholder="Enter name">
                    </div>

                    <div id="name_message" class="col-sm-4"></div>
                </div>

                <div class="form-group row">
                    <label for="sign_mail" class="col-sm-2 col-form-label">Email address</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="sign_mail" placeholder="Enter email">
                    </div>
                    <div id="email_message" class="col-sm-4"></div>
                </div>

                <div class="form-group row">
                    <label for="sign_pwd_fir" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="sign_pwd_fir" placeholder="Enter Password">
                    </div>
                    <div id="pwd_fir_message" class="col-sm-4"></div>
                </div>

                <div class="form-group row">
                    <label for="sign_pwd_sec" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="sign_pwd_sec" placeholder="Enter your password again">
                    </div>
                    <div id="pwd_sec_message" class="col-sm-4"></div>
                </div>

                <div class="form-group row">
                    <label for="sign_captcha" class="col-sm-2 col-form-label">Email address</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="sign_captcha" placeholder="Enter email">
                    </div>
                    <div id="email_captcha" class="col-sm-4"><a class="layui-form-label layui-btn" id="to_send">校验码</a></div>
                </div>



                <a class="btn btn-primary" id="to_sign">注册</a>
            </form>


</div>


</body>
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

<script src="js/cookie.js"></script>
<script>
    var cName,cPassword,cMail;
    var number;

    var final_check = function(){
        return cName === true && cPassword === true && cMail === true;
    };


    $(function () {
        var isEmail = /^([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/;
        var isPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,10}$/;

        /*Check whether the element is empty*/
        var checkEmpty = function (id) {
            return $(id).val() == null || $(id).val().length <= 0;
        };
        /*Check whether the name exist*/
        var checkNameValid = function (id) {
            var str = $.trim($(id).val());
            if (str.length >= 4 && str.length <= 15)
                return true;//TODO:link to database to judge
            return false;
        };

        $("#to_send").click(function () {
           if (cMail !== true) {
               show("您还未正确填写邮箱");
           }else {
               var email = $("#sign_mail").val();
               $.post("./mailsend", {
                   email:email
               }, function (result) {
                   var jsonObject = JSON.parse(result);
                   if (jsonObject.success === true) {
                       show("验证码已发送，请注意查收");
                       number = jsonObject.captcha;
                   } else {
                       show("验证码发送失败，请检查你的邮箱是否正确");
                   }
               });
           }
        });


        $("#sign_name").blur(function () {
            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#name_message").html("");
                cName = false;
            } else if (checkNameValid(this)) {
                $(this).css("background-color", "#FFFFFF");
                $("#name_message").html("<label>" + "合法" + "</label>");
                cName = true;
            } else {
                $("#name_message").html("<label>" + "不合法" + "</label>");
                cName = false;
            }
        });

        $("#sign_mail").blur(function () {
            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#email_message").html("");
                cMail = false;
            } else {
                var email = $.trim($('#sign_mail').val());
                if (!(isEmail.test(email))) {
                    $("#email_message").html("<label>" + "不合法邮箱" + "</label>");
                    cMail = false;
                } else {
                    $("#email_message").html("<label>" + "合法" + "</label>");
                    cMail = true;
                }
                $(this).css("background-color", "#FFFFFF");

            }
        });

        $("#sign_pwd_fir").blur(function () {
            var pwd = $(this).val();

            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#pwd_fir_message").html("");
            }else if (isPwd.test(pwd)) {
                $("#pwd_fir_message").html("<label>" + "合法" + "</label>");
                $(this).css("background-color", "#FFFFFF");
            }else {
                $("#pwd_fir_message").html("<label>" + "密码不合法" + "</label>");
            }
        });

        $("#sign_pwd_sec").blur(function () {
            var pwd1 = $("#sign_pwd_fir").val();
            var pwd2 = $(this).val();

            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#pwd_sec_message").html("");
                cPassword = false;
            }else if(pwd1 === pwd2){
                $("#pwd_sec_message").html("<label>" + "合法" + "</label>");
                cPassword = true;
                $(this).css("background-color", "#FFFFFF");
            }else {
                $("#pwd_sec_message").html("<label>" + "两次密码不一致" + "</label>");
                cPassword = false;
            }
        });

        var checkCaptcha = function(data){
            return data === number;
        };

        $("#to_sign").click(function () {
            if (final_check()) {
                if (!checkCaptcha($("#sign_captcha").val())){
                    show("验证码输入错误");
                }else {
                    $.post("./adduser", {
                        "password":$.md5($("#sign_pwd_sec").val()),
                        "name": $("#sign_name").val(),
                        "email": $("#sign_mail").val(),
                        "permission": 1,
                        "operator":"sign"
                    }, function (result) {
                        var jsonObject = JSON.parse(result);
                        if (jsonObject.success === false) {
                            if (jsonObject.exist === true) {
                                show("用户名重复，请重新输入");
                            }else {
                                show("注册出错");
                            }
                        } else {
                            show("登录成功！<br>2秒后将自动跳转...");
                            setTimeout(function () {
                                window.location.href=getCookie("currentPage");
                            },2000);
                        }
                    });
                }
            }else {
                show("您还有信息未正确填写！");
            }
        });

    })
</script>
</html>
