var sendInvitation = function (sendId, resId) {
    $.post("./invitehandle", {
        sendId: sendId,
        resId: resId,
        func: "new"
    }, function (result) {
        var jsonObject = JSON.parse(result);
        if (jsonObject.success === true) {
            show("请求发送成功");
            setTimeout(function () {
                location.reload();
            }, 2000);

        } else {
            show("请求发送失败");
            setTimeout(function () {
                location.reload();
            }, 2000);
        }
    });
};