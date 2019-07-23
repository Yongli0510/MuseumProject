var showSearchUser = function (uid) {
    $.post("./showFriendSearch", {
        name:$("#friend_search").val(),
        id:uid
    }, function (result) {
        var jsonObject = JSON.parse(result);
        if (jsonObject.list.length > 0) {
            var content = '';
            for (var i = 0; i < jsonObject.list.length; i++) {
                content += '<div class="layui-col-md6">';
                content += '<div class="layui-card">';

                content += '<div class="layui-card-header" data-toggle="popover">' + "名称：" +jsonObject.list[i].name+"</div>";
                content += '<div class="layui-card-body">' + "个性签名："+jsonObject.list[i].signature + '</div>';

                content += '<div class="layui-btn-group">';
                content += '<button type="button" class="layui-btn layui-btn-primary layui-btn-sm" ' +
                    ' onclick="window.location.href=\'personalpage.jsp?id='+ jsonObject.list[i].id +'\'">' +
                    '<i class="layui-icon">&#xe612;</i>' +
                    '</button>';
                if (jsonObject.bolList[i] === true){
                    content +='<button type="button" class="layui-btn layui-btn-primary layui-btn-sm" ' +
                        'onclick="updateMyFriend('+ jsonObject.uid +',' + jsonObject.list[i].id + ',\'del\'' +')">' +
                        '<i class="layui-icon">&#xe640;</i>' +
                        '</button>';
                }else if (jsonObject.uid !== jsonObject.list[i].id) {
                    content +='<button type="button" class="layui-btn layui-btn-primary layui-btn-sm" ' +
                        'onclick="inviteHandle('+ jsonObject.uid +',' + jsonObject.list[i].id + ',\'new\'' +')">' +
                        '<i class="layui-icon">&#xe654;</i>' +
                        '</button>';
                }
                content += '</div>';

                content += '</div>';
                content += '</div>';
            }
            $("#find_friend_result").html(content);
        }else {
            show("查询失败");
        }
    });
};