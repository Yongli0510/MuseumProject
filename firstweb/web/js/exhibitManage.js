//JavaScript代码区域
layui.use('element', function(){
    var element = layui.element;

});

layui.use('upload', function() {
    var $ = layui.jquery
        , upload = layui.upload;
    //选完文件后不自动上传
    upload.render({
        elem: '#chooseImage'
        , url: 'fileUploadServlet'
        , method: 'post'
        , accept: 'images'
        , acceptMime: 'image/jpg'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#imageShow').attr('src', result); //图片链接（base64）
                $('#imageShow').css({"width":"100px","height" : "100px","display" : "block"})
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res.code > 0) {
                return layer.msg('上传失败');
            } else {
                return layer.msg('上传成功');
            }
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
            });
        }
    });
});

layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#test'
        ,url:'searchServlet'
        ,limit:6
        ,method:'post'
        ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        ,cols: [[
            {field:'id', title: 'ID', sort: true,fixed:true}
            ,{field:'name', title: '名称'}
            ,{field:'year', title: '出土时间', sort: true}
            ,{field:'age', title: '作品完成年代'}
            ,{field:'place', title: '馆藏地点'}
            ,{field:'detail', title: '详情'}
            ,{field:'hotDegree', title: '热度', sort: true}
            ,{field:'pic', title: '图片名称'}
            ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
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
            layer.confirm('真的删除该展品吗？', function(index){
                $.ajax({
                    url:'exhibitManageServlet',
                    type:'post',
                    data:{
                        "type":'delete',
                        "id":data.id
                    },
                    success:function (data) {
                        alert("删除成功！");
                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        }, 'data');
                    }
                });
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            var form = layui.form;
            form.val('informationForm', {
                "type":'modify'
                ,"id":data.id
                ,"name": data.name
                ,"detail": data.detail
                ,"place": data.place
                ,"year": data.year
                ,"age": data.age
                ,"pic": data.pic
            });
            layer.open({
                type: 1
                ,title: '修改展品信息'
                ,content: $("#information")
                ,area: '600px'
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

    $("#save").click(function () {
        $.ajax({
            url:'exhibitManageServlet',
            type:'post',
            data:{
                "type":$("#type").val(),
                "id":$("#id").val(),
                "name":$("#nam").val(),
                "detail":$("#det").val(),
                "place":$("#pla").val(),
                "year":$("#year").val(),
                "age":$("#age").val(),
                "pic":$("#pic").val()
            },
            success:function (data) {
                alert("操作成功！");
            }
        })
    });

    $("#addExhibit").click(function () {
        var form = layui.form;
        form.val('informationForm', {
            "type":'add',
            'id':0
            ,"name": ''
            ,"detail": ''
            ,"place": ''
            ,"year": ''
            ,"age": ''
            ,"pic": ''
        });
        layer.open({
            type: 1
            ,title: '添加新展品'
            ,content: $("#information")
            ,area: '600px'
        });
    })
});