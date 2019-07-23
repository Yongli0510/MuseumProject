package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adduser")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = "", password = "", email = "", sig = "", operator = "";
        int permission = 1;

        try {
            if (request.getParameter("name") != null)
                name = request.getParameter("name");

            if (request.getParameter("password") != null)
                password = request.getParameter("password");

            if (request.getParameter("email") != null)
                email = request.getParameter("email");

            if (request.getParameter("sig") != null)
                sig = request.getParameter("sig");

            if (request.getParameter("permission") != null) {
                permission = Integer.parseInt(request.getParameter("permission"));
            }
        } catch (Exception e) {
            JSONObject object = new JSONObject();
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }
        operator = request.getParameter("operator");

        UserService us = new UserService(new UserDaoImpl());

        /*如果用户名已存在，则不能成功注册*/
        User check = us.getUser(name);
        if (check != null){
            JSONObject object = new JSONObject();
            object.put("success", false);
            object.put("exist", true);
            response.getWriter().println(object);
            return;
        }

        us.addUser(name, password, permission, email, sig);
        JSONObject object = new JSONObject();
        if ("sign".equals(operator)) {
            object.put("success", true);
            object.put("sign", true);
            User me = us.getUser(name);
            request.getSession().setAttribute("me", me);
            //TODO

        } else if ("admin".equals(operator)) {
            object.put("success", true);
            object.put("admin", true);
        }
        response.getWriter().println(object);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
