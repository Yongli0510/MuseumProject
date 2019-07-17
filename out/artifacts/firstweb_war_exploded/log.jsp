<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="entity.User" %><%--
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
<form METHOD="POST" class="form-signin" id="log_form" action="log.jsp">
    <h1 class="h3 mb-3 font-weight-normal">请登录</h1>

    <label for="log_name" class="sr-only">账户</label>
    <input type="text" id="log_name" name="log_name" class="form-control" placeholder="Name" required autofocus>


    <label for="log_pwd" class="sr-only">密码</label>
    <input type="password" id="log_pwd" name="log_pwd" class="form-control" placeholder="Password" required>

    <div class="alert alert-warning" role="alert" id="error_msg">
        用户名或密码错误
    </div>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> 记住密码
        </label>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
</form>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script src="js/md5.js"></script>
<script>
    $(function () {
        $("#error_msg").hide();

        /*前端md5加密*/
        var modifyPwd = function (pwd) {
            return $.md5(pwd);
        };

        <%
    String name = request.getParameter("log_name");
    String pwd = request.getParameter("log_pwd");
    if (name!=null && pwd!=null){
        User u = (new UserDaoImpl()).getUser(new User(name,pwd));
        if(u!=null && pwd.equals(u.getPassword()))
            session.setAttribute("name",request.getParameter("log_name"));
        else {
            %>
        $("#error_msg").show();
        <%
    }
}
if (session.getAttribute("name")!=null){
    response.sendRedirect("back.jsp");
    //TODO:直接跳转至原界面
}
%>

    });

</script>

</body>
</html>
<%--function test(){--%>
<%--var form ={--%>
<%--"name":$("#log_name").val(),--%>
<%--"pwd":modifyPwd($("#log_pwd"))--%>
<%--};--%>
<%--//             var req = new XMLHttpRequest();--%>
<%--//             req.open("post", "${pageContext.request.contextPath}/public/testupload", false);--%>
<%--//             req.send(form);--%>
<%--$.ajax({--%>
<%--url:"${pageContext.request.contextPath}",--%>
<%--type:"post",--%>
<%--data:form,--%>
<%--processData:false,--%>
<%--contentType:false,--%>
<%--success:function(data){--%>

<%--},--%>
<%--error:function(e){--%>
<%--$("#error_msg").show();--%>
<%--}--%>
<%--});--%>
<%--}--%>