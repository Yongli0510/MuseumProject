package Servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import dao.impl.FriendDaoImpl;
import dao.impl.InviteDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Content;
import entity.Page;
import entity.User;
import service.FriendService;
import service.InviteService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/showFriendSearch")
public class ShowFriendSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = "";
        if (request.getParameter("name") != null)
            name = request.getParameter("name");

        int uid = 0;
        if (request.getParameter("id") != null)
            uid = Integer.parseInt(request.getParameter("id"));


        UserService us = new UserService(new UserDaoImpl());
        FriendService fs = new FriendService(new UserDaoImpl(),new FriendDaoImpl());

        List<User> list = us.searchUser(name);


        Content<User> bean = new Content<>();
        bean.setUid(uid);
        bean.setList(list);

        List<Boolean> bolList = new ArrayList<>();
        for (User user : list){
             bolList.add(fs.isFriend(user.getId(), uid));
        }
        bean.setBolList(bolList);


        String json = JSON.toJSONString(bean);
        System.out.println(json);
        response.getWriter().append(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
