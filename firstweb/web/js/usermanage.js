layui.use('element', function(){
    var element = layui.element;

});

layui.use('upload', function() {
    var $ = layui.jquery
        , upload = layui.upload;
    //选完文件后不自动上传
    upload.render({
        elem: '#chooseUser'
        , url: ''
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