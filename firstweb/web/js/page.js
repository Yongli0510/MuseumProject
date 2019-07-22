var currentPage = 1; //当前页面
var name,detail,place; //搜索项

function goPage(page) {
    $.ajax({
        url:"searchServlet",
        type:'post',
        data:{
            "page":page,
            "name":name,
            "detail":detail,
            "place":place
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
                tabData += '<img class="card-img-top" style="max-width: 400px" src="image/exhibit/' + list[i].pic + '.jpg">';
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

function genPageLink(pb){
    //拼接分页的超链接
    if(pb.currentPage == 1){
        $("#page_prev").html('<li id="page_prev" class="disabled page-item"><a href="#" class="page-link">&laquo;</a></li>');
    }
    else{
        $("#page_prev").html('<li id="page_prev" class="page-item" ><a href="javascript:goPage(' + (--currentPage) + ')" class="page-link">&laquo;</a></li>');
    }

    var s = "";
    for(var i = 1;i<=pb.totalPage;i++){
        //如果当前遍历到的页码数等于当前页，则当前页码被激活class="active"
        if(pb.currentPage == i){
            s += '<li id="page_ul" class="active page-item"><a href="javascript:goPage(' + i + ')" class="page-link">'+i+'</a></li>';
        }
        else{
            s += '<li id="page_ul" class="page-item"><a href="javascript:goPage(' + i + ')" class="page-link">'+i+'</a></li>';
        }
    }
    $("#page_ul").html(s);

    if(pb.currentPage == pb.totalPage){
        $("#page_next").html('<li id="page_next" class="disabled page-item" ><a href="#" class="page-link">&raquo;</a></li>');
    }else{
        $("#page_next").html('<li id="page_next" class="page-item" ><a href="javascript:goPage(' + (++currentPage) + ')" class="page-link">&raquo;</a></li>');
    }
}

$("#search").click(function () {
    name = $("#name").val();
    detail = $("#detail").val();
    place = $("#place").val();
    goPage(1);
});

