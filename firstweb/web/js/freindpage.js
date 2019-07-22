var friend_name;

function list(message) {
    $.ajax({
        url:"friendSearchServlet",
        type:'post',
        data:{
            "name":message
        },
        success:function (data) {
            currentPage = page;
            var jsonObject = JSON.parse(data);
            var list = jsonObject.list;
            var tabData = '<div class="card-deck" style="flex-flow: initial">';
            var totalNum = Math.min(jsonObject.currentPage * jsonObject.pageSize,jsonObject.totalNum) - (jsonObject.currentPage - 1) * jsonObject.pageSize;
            for (var i = 0; i < totalNum; i++) {
                if(i == 3)
                    tabData += '</div><div class="card-deck" style="flex-flow: initial">';
                tabData += '<div class="card text-center text-white bg-dark" style="width: 400px;display: block">';
                tabData += '<img class="card-img-top" style="max-width: 400px" src="image/' + list[i].pic + '.jpg">';
                tabData += '<div class="card-body">';
                tabData += '<h5 class="card-title">' + list[i].name + '</h5>';
                tabData += '<p class="card-text">' + list[i].detail + '</p>';
                tabData += '<a href="details.jsp?id=' + list[i].id + '" name="a1" class="btn btn-primary">查看详情</a>';
                tabData += '</div></div>';
            }
            if(totalNum < 3){
                for(var i = 3 - totalNum; i > 0;i--){
                    tabData += '<div class="card text-center text-white bg-dark" style="width: 400px;display: block">';
                    tabData += '</div>';
                }
            }
            if(totalNum > 3 && totalNum < 6){
                for(var i = 6 - totalNum; i > 0;i--){
                    tabData += '<div class="card text-center text-white bg-dark" style="width: 400px;display: block">';
                    tabData += '</div>';
                }
            }
            tabData += '</div>';
            $('#searchResult').html(tabData);
            genPageLink(jsonObject)
        }
    });
}

$("#friend_search").click(function () {
    friend_name = $("#name").val();
    goPage(friend_name);
});