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
            var tabData = '<div>';
            if(jsonObject.totalNum != 0){
                var totalNum = Math.min(jsonObject.currentPage * jsonObject.pageSize,jsonObject.totalNum) - (jsonObject.currentPage - 1) * jsonObject.pageSize;
                for (var i = 0; i < totalNum; i++) {
                    if(i == 3)
                        tabData += '</div><div>';
                    tabData += '<div class="layui-inline layui-bg-cyan" style="width: 300px;height: 600px">';
                    tabData += '<img style="width: 300px;height: 300px" src="image/exhibit/' + list[i].pic + '.jpg">';
                    tabData += '<div>';
                    tabData += '<h5>' + list[i].name + '</h5>';
                    tabData += '<p>' + list[i].detail + '</p>';
                    tabData += '<a href="details.jsp?id=' + list[i].id + '" name="a1" class="layui-btn">查看详情</a>';
                    tabData += '</div></div>';
                }

                if(totalNum < 3){
                    for(var i = 3 - totalNum; i > 0;i--){
                        tabData += '<div class="layui-inline layui-bg-cyan" style="width: 300px;height: 600px">';
                        tabData += '</div>';
                    }
                }

                if(totalNum > 3 && totalNum < 6){
                    for(var i = 6 - totalNum; i > 0;i--){
                        tabData += '<div class="layui-inline layui-bg-cyan" style="width: 300px;height: 600px">';
                        tabData += '</div>';
                    }
                }
            }
            tabData += '</div>';
            $('#searchResult').html(tabData);
            genPageLink(jsonObject);
        }
    });
}

function genPageLink(pb){
    //拼接分页的超链接
    if(pb.currentPage == 1){
        $("#page_prev").html('<li class="disabled"><a href="#" class="layui-btn layui-btn-primary">&laquo;</a></li>');
    }
    else{
        $("#page_prev").html('<li><a href="javascript:goPage(' + (--currentPage) + ')" class="layui-btn layui-btn-primary">&laquo;</a></li>');
    }

    var s = "";
    for(var i = 1;i<=pb.totalPage;i++){
        //如果当前遍历到的页码数等于当前页，则当前页码被激活class="active"
        if(pb.currentPage == i){
            s += '<li class="layui-inline"><a href="javascript:goPage(' + i + ')" class="layui-btn">'+i+'</a></li>';
        }
        else{
            s += '<li class="layui-inline"><a href="javascript:goPage(' + i + ')" class="layui-btn layui-btn-primary">'+i+'</a></li>';
        }
    }
    $("#page_ul").html(s);

    if(pb.currentPage == pb.totalPage){
        $("#page_next").html('<li class="disabled" ><a href="#" class="layui-btn layui-btn-primary">&raquo;</a></li>');
    }else{
        $("#page_next").html('<li><a href="javascript:goPage(' + (++currentPage) + ')" class="layui-btn layui-btn-primary">&raquo;</a></li>');
    }
}

$("#search").click(function () {
    name = $("#name").val();
    detail = $("#detail").val();
    place = $("#place").val();
    goPage(1);
});

