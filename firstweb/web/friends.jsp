<%@ page import="dao.impl.FriendDaoImpl" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="entity.User" %>
<%@ page import="service.FriendService" %>
<%@ page import="java.util.List" %>
<%@ page import="service.InviteService" %>
<%@ page import="dao.impl.InviteDaoImpl" %>
<%@ page import="entity.Invite" %>
<%@ page import="service.UserService" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/18
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>好友管理</title>
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
                UserService us = new UserService(new UserDaoImpl());
                if (session.getAttribute("me") != null) {
                    user = us.getUser(((User) session.getAttribute("me")).getId());
                    if (user.getPermission() == 0) {
                        session.setAttribute("permission", "true");
                    }

                    if ("true".equals(session.getAttribute("permission"))){
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
                    <dd><a href="personalpage.jsp?id=<%=user.getId()%>">我的主页</a></dd>
                    <dd><a href="selfManage.jsp">信息管理</a></dd>
                    <dd><a href="friends.jsp">好友列表</a></dd>
                    <dd><a href="backlove.jsp">收藏夹</a></dd>
                    <dd><a href="email.jsp">私信</a></dd>
                    <dd><a href="logout">退出登录</a></dd>
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
                        <dd><a href="personalpage.jsp?id=<%=user.getId()%>">我的主页</a></dd>
                        <dd><a href="selfManage.jsp">信息管理</a></dd>
                        <dd><a href="friends.jsp">好友列表</a></dd>
                        <dd><a href="backlove.jsp">收藏夹</a></dd>
                        <dd><a href="email.jsp">私信</a></dd>
                    </dl>
                </li>

                <%
                    if ("true".equals(session.getAttribute("permission"))){
                %>
                <li class="layui-nav-item">
                    <a>管理界面</a>
                    <dl class="layui-nav-child">
                        <dd><a href="userManage.jsp">人员管理</a></dd>
                        <dd><a href="exhibitManager.jsp">展品管理</a></dd>
                    </dl>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">


            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                    <li class="layui-this">我的好友</li>
                    <li>好友查询</li>
                    <li>收到的邀请</li>
                    <li>好友申请记录</li>
                    <li>好友推荐</li>
                </ul>

                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--我的好友栏目--%>
                        <div class="layui-row layui-col-space15">
                            <%

                                FriendService fs = new FriendService(new UserDaoImpl(), new FriendDaoImpl());
                                User me = (User) session.getAttribute("me");
                                List<User> myFriends = fs.getFriend(me.getId());

                                if (myFriends.isEmpty()) {
                            %>
                            你暂时还没有好友
                            <%
                            } else {
                                for (User myFriend : myFriends) {
                            %>
                            <div class="layui-col-md6">
                                <div class="layui-card">
                                    <div class="layui-card-header" data-toggle="popover">名称：<%=myFriend.getName()%>
                                    </div>
                                    <div class="layui-card-body">
                                        个性签名：<%=myFriend.getSignature()%>
                                    </div>
                                    <div class="layui-btn-group">
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                onclick="window.location.href='personalpage.jsp?id=<%=myFriend.getId()%>'">
                                            <i class="layui-icon">&#xe612;</i>
                                        </button>
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                onclick="updateMyFriend(<%=me.getId()%>,<%=myFriend.getId()%>,'del')">
                                            <i class="layui-icon">&#xe640;</i>
                                        </button>
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                onclick="sendMessage(<%=me.getId()%>,<%=myFriend.getId()%>)">
                                            <i class="layui-icon">&#xe63a;</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>


                    <div class="layui-tab-item">
                        <%--好友查询栏目--%>
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <button type="button" class="layui-form-label layui-btn"><a class="layui-icon" onclick="showSearchUser(<%=me.getId()%>)">GO
                                    &#xe609;</a></button>
                                <div class="layui-input-block">
                                    <input type="text" id="friend_search" autocomplete="off" placeholder="请输入" class="layui-input">
                                </div>
                            </div>
                        </form>
                        <hr>
                        <div id="find_friend_result" class="layui-row layui-col-space15">
                            <%--展示查询的结果--%>
                        </div>
                    </div>


                    <%--展示所有的好友申请记录--%>
                    <div class="layui-tab-item">

                        <div class="layui-row layui-col-space15">
                            <%
                                InviteService is = new InviteService(new InviteDaoImpl());
                                List<Invite> list = is.getInvite(me.getId());

                                if (list.isEmpty()){
                                }else {
                                    for (Invite invite : list) {
                                        User myInvite = us.getUser(invite.getSendId());
                                    %>
                                    <div class="layui-col-md6">
                                        <div class="layui-card">
                                            <div class="layui-card-header" data-toggle="popover">来源：<%=myInvite.getName()%>
                                            </div>
                                            <div class="layui-card-body">
                                                ta的签名：<%=myInvite.getSignature()%>
                                            </div>

                                            <div class="layui-btn-group">
                                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                        onclick="location.href='personalpage.jsp?id=<%=myInvite.getId()%>'">
                                                    <i class="layui-icon">&#xe612;</i>
                                                </button>
                                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                        onclick="inviteHandle(<%=myInvite.getId()%>,<%=me.getId()%>,'agree')">
                                                    <i class="layui-icon">&#xe654;</i>
                                                </button>
                                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                                        onclick="inviteHandle(<%=myInvite.getId()%>,<%=me.getId()%>,'refuse')">
                                                    <i class="layui-icon">&#xe640;</i>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                    <%
                                    }
                                }
                            %>
                        </div>

                    </div>


                    <div class="layui-tab-item">
                        <%--展示所有的好友申请记录--%>
                        <div class="layui-row layui-col-space15">
                            <%

                                List<Invite> allInvites = is.getALLInvites(me.getId());

                                if (allInvites.isEmpty()){
                                    System.out.println("empty");
                                }else {
                                    for (Invite invite : allInvites) {
                                        User sender = us.getUser(invite.getSendId());
                                        User resver = us.getUser(invite.getResId());
                            %>
                            <div class="layui-col-md6">
                                <div class="layui-card">
                                    <div class="layui-card-header" data-toggle="popover"
                                         onclick="window.location.href='personalpage.jsp?id=<%=sender.getId()%>'">
                                        发送方：<%=sender.getName()%>
                                    </div>
                                    <div class="layui-card-body" data-toggle="popover"
                                         onclick="window.location.href='personalpage.jsp?id=<%=sender.getId()%>'">
                                        接收方：<%=resver.getName()%>
                                    </div>

                                    <div class="layui-btn-group">
                                        <%
                                            if (invite.getAgree()==0){
                                                %>
                                                <button type="button" class="layui-btn layui-btn-xs layui-btn-disabled"><i class="layui-icon"></i>未处理</button>
                                                <%
                                            }else if (invite.getAgree() == 1){
                                                %>
                                                <button type="button" class="layui-btn layui-btn-xs layui-btn-disabled"><i class="layui-icon"></i>已同意</button>
                                                <%
                                            }else{
                                                %>
                                                <button type="button" class="layui-btn layui-btn-xs layui-btn-disabled"><i class="layui-icon"></i>已拒绝</button>
                                                <%
                                            }
                                        %>
                                    </div>

                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>

                    </div>

                </div>


            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
        </div>
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
<script src="js/sendinvite.js"></script>
<script src="js/showSearchFriendResult.js"></script>

<script src="js/cookie.js"></script>
<script src="js/previouspage.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });

    var updateMyFriend = function (UID, FID, FUNC) {
        $.post("./updatefriend", {
            uid: UID,
            fid: FID,
            func: FUNC
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject.success === true) {
                show(jsonObject.success);
                setTimeout(function () {
                    location.reload();
                }, 2000);

            } else {
                show("失败");
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        });
    };

    var inviteHandle = function (sendId, resId, FUNC) {
        $.post("./invitehandle", {
            sendId: sendId,
            resId: resId,
            func: FUNC
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject.success === true) {
                show("好友申请发生成功");
                setTimeout(function () {
                    location.reload();
                }, 2000);

            } else {
                show("出错");
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        });
    };

    var sendMessage = function (sendId,resId) {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.open({
                type: 1,
                title:'发送私信',
                content: '<div class="layui-input-block" style="width: 400px;height: 200px;margin: auto">' +
                    '<textarea name="desc" placeholder="请输入私信内容" class="layui-textarea"></textarea></div>' +
                    '<p style="text-align: center"><button class="layui-btn" id="send">发送</button></p> ',
                area: ['400px', '300px']
            });
            
            $("#send").click(function () {
                var content = $("textarea").val();
                $.ajax({
                    url:'emailServlet',
                    type:'post',
                    data:{
                        type:'add',
                        sendId:sendId,
                        resId:resId,
                        content:content
                    },
                    success:function () {
                        layer.msg("发送成功！");
                    }
                })
            })
        });
    }

</script>


</body>
</html>

