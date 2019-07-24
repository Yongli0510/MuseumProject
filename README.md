# MuseumProject
经过两个多星期的奋战，我们的上海张江皇家艺术博物馆（手动狗头）终于上线啦！
<br><br>
项目主页：<a href="http://47.102.158.139:8080/firstweb/homepage.jsp">http://47.102.158.139:8080/firstweb/homepage.jsp</a>
<br><br>
本项目前后端完全分离，前端页面为jsp页面，UI主要使用比较流行的一款前端框架layui（个人感觉比bootstrap好用很多）,
加上一些其他比较好用的组件，比如font-awesome图标组件等。后端采用MVC设计模式:<br><br>
servlet层作为控制器只负责接收前端请求，并返回相应信息；<br><br>
entity层里面存放javabean对象，作为后台逻辑操作的基本单元，即模型；<br><br>
dao（Data Access Object）层处理数据库增删改查的操作，其中主要分为两类，UserDao处理和用户相关的数据库操作，ExhibitDao处理和展品相关的数据库操作。<br><br>
jdbc层封装连接、断开数据库的方法。<br><br>
Filter层作为过滤器，检查用户是否有权限访问该网页。具体有两种情况：
如果未登录，不能访问和用户相关的界面，比如好友列表、收藏夹，强行输入url访问会跳转到登录界面；
如果登录了但是没有管理员权限，则不能访问人员管理和展品管理界面，强行输入url访问会跳转到主页。
