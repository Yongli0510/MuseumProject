layui.use('layer', function(){
    var layer = layui.layer;
    layer.open({
        type: 2
        ,title: false //不显示标题栏
        ,closeBtn: false
        ,area: ['500px', '400px']
        ,shade: 0.8
        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        ,btn: ['火速围观', '残忍拒绝']
        ,btnAlign: 'c'
        ,moveType: 1 //拖拽模式，0或者1
        ,content: ['log.jsp','no']
        ,success: function(layero){
            var btn = layero.find('.layui-layer-btn');
            btn.find('.layui-layer-btn0').attr({
                href: 'http://www.layui.com/'
                ,target: '_blank'
            });
        }
    });
});