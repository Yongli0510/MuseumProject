package Servlet;

import com.alibaba.fastjson.JSON;
import dao.impl.ExhibitDaoImpl;
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

@WebServlet("/friendsearch")
public class FriendSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        if(request.getParameter("agree") != null){

        }

        if(request.getParameter("refuse") != null){

        }

        FriendService fs = new FriendService(new UserDaoImpl());
        UserService us = new UserService(new UserDaoImpl());


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
