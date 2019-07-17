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

<div class="container" id="reg_content">

            <form>
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

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>


</div>


</body>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
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


        $("#sign_name").blur(function () {
            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#name_message").html("");
            } else if (checkNameValid(this)) {
                $(this).css("background-color", "#FFFFFF");
                $("#name_message").html("<label>" + "valid" + "</label>");
            } else {
                $("#name_message").html("<label>" + "inValid" + "</label>");
            }
        });

        $("#sign_mail").blur(function () {
            if (checkEmpty(this)) {
                $(this).css("background-color", "#FFFFCC");
                $("#email_message").html("");
            } else {
                var email = $.trim($('#sign_mail').val());
                if (!(isEmail.test(email))) {
                    $("#email_message").html("<label>" + "不合法邮箱" + "</label>");
                } else {
                    $("#email_message").html("<label>" + "valid" + "</label>");
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
                $("#pwd_fir_message").html("<label>" + "valid" + "</label>");
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
            }else if(pwd1 === pwd2){
                $("#pwd_sec_message").html("<label>" + "valid" + "</label>");
                $(this).css("background-color", "#FFFFFF");
            }else {
                $("#pwd_sec_message").html("<label>" + "两次密码不一致" + "</label>");
            }
        })

    })
</script>
</html>
