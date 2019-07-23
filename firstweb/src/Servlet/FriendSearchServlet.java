package Servlet;

import com.alibaba.fastjson.JSON;
import dao.impl.ExhibitDaoImpl;
import dao.impl.FriendDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.Page;
import entity.User;
import service.FriendService;
import service.PageService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/friendsearch")
public class FriendSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = "";
        if(request.getParameter("name") != null)
            name = request.getParameter("name");


        FriendService fs = new FriendService(new UserDaoImpl(),new FriendDaoImpl());
        UserService us = new UserService(new UserDaoImpl());

        int page = 1;
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));


        List<User> list = us.searchUser(name);


        PageService pageService = new PageService(new ExhibitDaoImpl());
        Page<User> bean = pageService.page(page,list);

        String json = JSON.toJSONString(bean);


        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.append(json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
