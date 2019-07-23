package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.UserDaoImpl;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateuser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String func = "";
        int uid = 0;
        int permission = 0;
        UserService us = new UserService(new UserDaoImpl());
        JSONObject object = new JSONObject();
        try {
            func = request.getParameter("func");
            uid = Integer.parseInt(request.getParameter("id"));

            if ("del".equals(func)){
                us.delUser(uid);
            }else if ("changePer".equals(func)){
                permission = Integer.parseInt(request.getParameter("permission"));
                us.updatePermission(permission,uid);
            }
        }catch (Exception e){
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }
        object.put("success", true);
        response.getWriter().println(object);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
