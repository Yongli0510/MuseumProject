//JavaScript代码区域
layui.use('element', function(){
    var $ = layui.jquery;
    var element = layui.element;

});

layui.use('table', function(){
    var $ = layui.jquery;
    var table = layui.table;

    table.init('parse-table-demo', { //转化静态表格
        //height: 'full-500'
    });

    table.on('tool(parse-table-demo)', function(obj){
        var data = obj.data;

        if(obj.event === 'del'){
            layer.confirm('真的删除该条私信吗？', function(index){
                $.ajax({
                    url:'emailServlet',
                    type:'post',
                    data:{
                        type:'delete'
                        ,id:data.id
                    },
                    success:function (data) {
                        layer.msg("删除成功！");
                        location.reload();
                    }
                });
                layer.close(index);
            });
        }

        else if(obj.event === 'edit'){
            $.ajax({
                url:'emailServlet',
                type:'post',
                data:{
                    type:'change'
                    ,id:data.id
                },
                success:function (data) {
                    layer.msg("修改成功！");
                    location.reload();
                }
            });
        }

    });

});