layui.use('element', function(){
    var element = layui.element;
});

layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#umTable'
        ,url:'./friendsearch'
        ,limit:10
        ,method:'post'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,cols: [[
            {field:'id', title: 'ID', sort: true,fixed:true}
            ,{field:'name', title: '用户名', sort: true}
            ,{field:'email', title: '邮箱'}
            ,{field:'permission', title: '权限'}
            ,{field:'lastlogin', title: '最近登录'}
            ,{field:'signature', title: '个性签名'}
            ,{field:'per',title: '权限管理', align:'center', toolbar: '#um_permission'}
            ,{fixed: 'right', width:178, align:'center', toolbar: '#um_bar'}
        ]]
        ,parseData: function(res){ //res 即为原始返回的数据
            return {
                "code": 0, //解析接口状态
                "msg": "", //解析提示文本
                "count": res.totalNum, //解析数据长度
                "data": res.list //解析数据列表
            };
        }
        ,id:'testReload'
        ,page:true
    });

    table.on('tool(demo)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除该用户吗？', function(index){
                $.ajax({
                    url:'updateuser',
                    type:'post',
                    data:{
                        "func":'del',
                        "id":data.id
                    },
                    success:function (data) {
                        var jsonObject = JSON.parse(data);
                        if (jsonObject.success === true) {
                            show("删除成功");
                            table.reload('testReload', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            }, 'data');
                        } else {
                            show("失败");
                        }
                    }
                });
                layer.close(index);
            });
        }else if (obj.event === 'to_admin') {
            $.ajax({
                url:'updateuser',
                type:'post',
                data:{
                    "func":'changePer',
                    "id":data.id,
                    "permission":0
                },
                success:function (data) {
                    var jsonObject = JSON.parse(data);
                    if (jsonObject.success === true) {
                        show("修改成功");
                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                    } else {
                        show("失败");
                    }
                }
            });
        }else if (obj.event === 'to_normal') {
            $.ajax({
                url:'updateuser',
                type:'post',
                data:{
                    "func":'changePer',
                    "id":data.id,
                    "permission":1
                },
                success:function (data) {
                    var jsonObject = JSON.parse(data);
                    if (jsonObject.success === true) {
                        show("修改成功");
                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                    } else {
                        show("失败");
                    }
                }
            });
        }
    });


    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    name: $("#name").val()
                    ,detail: $("#detail").val()
                    ,place: $("#place").val()
                }
            }, 'data');
        }
    };

    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    $("#um_save").click(function () {
        $.ajax({
            url:'adduser',
            type:'post',
            data:{
                "func":$("#um_type").val(),
                'id':$("#um_id").val(),
                "password":$.md5($("#um_password").val()),
                "name": $("#um_name").val(),
                "email": $("#um_mail").val(),
                "permission": $("#um_per").val(),
                "sig": $("#um_sig").val(),
                "operator":"admin"
            },
            success:function (data) {
                var jsonObject = JSON.parse(data);
                if (jsonObject.success === true && jsonObject.admin === true) {
                    show("添加成功");
                } else {
                    show("添加失败");
                }
            }
        })
    });

    $("#umAddUser").click(function () {
        var form = layui.form;
        form.val('newUserForm', {
            "func":'add',
            'id':0,
            "password":'',
            "name": '',
            "mail": '',
            "permission": '',
            "sig": ''
        });
        layer.open({
            type: 1
            ,title: '添加新用户'
            ,content: $("#newUserForm")
            ,area: '600px'
        });
    })
});