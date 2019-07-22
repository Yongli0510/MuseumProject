var friend_name;

function list(message) {
    var updateMyFriend = function (name) {
        $.post("./friendsearch", {
            name:name
        }, function (result) {
            var jsonObject = JSON.parse(result);
            if (jsonObject.success === true) {

            } else {

            }
        });
    };
}
