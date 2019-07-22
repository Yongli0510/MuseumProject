var show = function(msg) {
    layui.use('layer', function() { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //配置一个透明的询问框
        layer.msg(msg, {
            time: 5000, //5s后自动关闭
            btn: ['明白了']
        });
    });
};